library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port ( 
        clk             : in std_logic;
        reset_n         : in std_logic;
        execute         : in std_logic;
        seven_seg_hun   : out std_logic_vector(6 downto 0);
        seven_seg_ten   : out std_logic_vector(6 downto 0);
        seven_seg_one   : out std_logic_vector(6 downto 0)
    ); 
end top;

architecture beh of top is

component blink_rom
    PORT(
        address         : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        clock           : IN STD_LOGIC  := '1';
        q               : OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
    );
end component;

component seven_seg is
    generic (
        max_count       : integer := 25000000
    );
    port (
        bcd               : in std_logic_vector(3 downto 0);
        seven_seg_out     : out std_logic_vector(6 downto 0)
    );
end component; 

component memory is
    generic (
        addr_width : integer := 4; 
        data_width : integer := 8
    );
    port (
        clk               : in std_logic;
        we                : in std_logic;
        addr              : in std_logic_vector(addr_width - 1 downto 0);
        din               : in std_logic_vector(data_width - 1 downto 0);
        dout              : out std_logic_vector(data_width - 1 downto 0)
    );
end component; 

component rising_edge_synchronizer is 
    port (
        clk               : in std_logic;
        reset             : in std_logic;
        input             : in std_logic;
        edge              : out std_logic
    );
end component;

component alu is
    port (
        clk        :in std_logic;
        reset      :in std_logic;
        a          :in std_logic_vector(7 downto 0);
        b          :in std_logic_vector(7 downto 0);
        op         :in std_logic_vector(1 downto 0);
        result     :out std_logic_vector(7 downto 0)
    );
end component;

constant read_w               : std_logic_vector(5 downto 0) :="000001";
constant read_r               : std_logic_vector(5 downto 0) :="000010";
constant write_r              : std_logic_vector(5 downto 0) :="000100";
constant write_w_no_op        : std_logic_vector(5 downto 0) :="001000"; 
constant write_w              : std_logic_vector(5 downto 0) :="010000";
constant write_mem_to_work    : std_logic_vector(5 downto 0) :="100000"; 
signal stateReg          : std_logic_vector(5 downto 0);
signal stateNext         : std_logic_vector(5 downto 0);
signal synced_execute    : std_logic;
signal save              : std_logic_vector(7 downto 0);
signal result_sig        : std_logic_vector(7 downto 0);
signal to_mem            : std_logic_vector(7 downto 0);
signal preDD             : std_logic_vector(11 downto 0);
signal ones              : std_logic_vector(3 downto 0);
signal tens              : std_logic_vector(3 downto 0);
signal hundreds          : std_logic_vector(3 downto 0);
signal output_logic_we   : std_logic;
signal output_logic_addr : std_logic_vector(3 downto 0);




signal address_sig  : std_logic_vector(3 downto 0) := "0000";
signal q_sig : std_logic_vector(11 downto 0);
alias num: std_logic_vector(7 downto 0) is q_sig(7 downto 0);
alias ms: std_logic is q_sig(11);
alias mr: std_logic is q_sig(10);
alias opCode: std_logic_vector(1 downto 0) is q_sig(9 downto 8);


begin 
rom_inst : blink_rom 
    port map (
        address     => address_sig,
        clock       => clk,
        q           => q_sig
    );

alu_comp: alu 
    port map(
        clk         => clk,
        reset       => reset_n,
        a           => save, 
        b           => num, --alias from rom not synched
        op          => opCode,
        result      => result_sig
    );
 
sync_execute: rising_edge_synchronizer 
    port map(
        clk     => clk,
        reset   => reset_n,
        input   => execute,
        edge    => synced_execute
    );

convert_to_ssd_a: seven_seg 
    port map(
        bcd           => hundreds, --hundreds from dd
        seven_seg_out => seven_seg_hun
    );

convert_to_ssd_b: seven_seg 
    port map(
        bcd           => tens, --tens from dd
        seven_seg_out => seven_seg_ten
    );

convert_to_ssd_c: seven_seg 
    port map(
        bcd           => ones, --ones from dd
        seven_seg_out => seven_seg_one
    );

comp_memory: memory 
    port map(
        clk  => clk,
        we   => output_logic_we,
        addr => output_logic_addr,
        din  => to_mem,
        dout => save
    );

--process to update on execute from rom component
process(clk,synced_execute,reset_n,address_sig)
begin
    if reset_n = '0' then
        address_sig <= (others => '0');
    elsif clk'event and clk = '1' then
        if synced_execute = '1' then
            address_sig <= std_logic_vector(unsigned(address_sig) + 1 );
        end if;
    end if;
end process;

--state register
process(reset_n, clk)
begin
    if (reset_n = '0') then
        stateReg <= read_w;
    elsif (clk'event and clk ='1') then
        stateReg <= stateNext;
    end if;
end process;

--sensitivity list Next State Logic
process(stateReg, reset_n, synced_execute, ms, mr) --NSL mr and ms arent synched
begin
    if reset_n = '0' then 
        stateNext <= read_w;
    else 
        stateNext <= stateReg; --prevent latch
        case stateReg is
            when read_w =>
                output_logic_we <= '0';
                output_logic_addr <= "0000";
                if (synced_execute='1') then
                    stateNext <= write_w_no_op;
                    elsif (ms='1') then --not synched
                        stateNext <= write_r;
                    elsif (mr='1') then --not synched
                        output_logic_we <= '0';
                        output_logic_addr <= "0001";
                        stateNext <= read_r;
                else 
                    stateNext <= read_w;
                end if;

            when read_r =>
                if (synced_execute='1') then
                    stateNext <= write_w_no_op;
                else
                    stateNext <= write_mem_to_work;
                end if;

            when write_r =>
                output_logic_we <= '1';
                output_logic_addr <= "0001";
                stateNext <= read_w;

            when write_w_no_op =>
                stateNext <= write_w;

            when write_mem_to_work => 
                output_logic_we <= '1';
                output_logic_addr <= "0000";
                stateNext <= write_w;

            when write_w =>
                output_logic_we <= '1';
                output_logic_addr <= "0000";
                stateNext <= read_w;

            when others =>
                stateNext <= read_w;
        end case;
    end if;
end process;

-- routing [asynchronous]
process(num, reset_n, stateReg, clk)
begin
    if (clk'event and clk ='1') then
        if (stateReg=write_w_no_op) then
            to_mem <= result_sig;
        elsif (stateReg=read_r) then
            to_mem <= save;
        end if;
    end if;
    preDD <= std_logic_vector(unsigned("0000" & to_mem));
end process;


bcd1: process(preDD)
variable temp : STD_LOGIC_VECTOR (11 downto 0);
variable bcd : UNSIGNED (15 downto 0) := (others => '0');
begin
    bcd := (others => '0');
    temp(11 downto 0) := preDD;
    for i in 0 to 11 loop
        if bcd(3 downto 0) > 4 then 
            bcd(3 downto 0) := bcd(3 downto 0) + 3;
        end if;
        if bcd(7 downto 4) > 4 then 
            bcd(7 downto 4) := bcd(7 downto 4) + 3;
        end if;
        if bcd(11 downto 8) > 4 then  
           bcd(11 downto 8) := bcd(11 downto 8) + 3;
        end if;
        bcd := bcd(14 downto 0) & temp(11);
        temp := temp(10 downto 0) & '0';
    end loop;
    ones <= STD_LOGIC_VECTOR(bcd(3 downto 0));
    tens <= STD_LOGIC_VECTOR(bcd(7 downto 4));
    hundreds <= STD_LOGIC_VECTOR(bcd(11 downto 8));
end process bcd1;

end beh;