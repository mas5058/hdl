library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity top is 
    port (a, b           : in std_logic_vector (2 downto 0);
          add,sub,clk,reset      : in std_logic;
          hex0,hex1,hex2 : out std_logic_vector (6 downto 0)
    );
    end top;
    
architecture arch of top is
    signal asig,bsig : std_logic_vector(3 downto 0);
    signal rezsig : std_logic_vector(3 downto 0);
    signal opersig : std_logic_vector(1 downto 0);
    signal subsig : std_logic;
    signal addsig : std_logic;

    component alu is
  port (
    a              : in std_logic_vector(3 downto 0); 
    b              : in std_logic_vector(3 downto 0);
    oper           : in  std_logic_vector(1 downto 0);
    output          : out std_logic_vector(3 downto 0)
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
    
    component synchronizer is 
    port (
        clk               : in std_logic;
        reset             : in std_logic;
        async_in          : in std_logic;
        sync_out          : out std_logic
      );
    end component;
    
    component ssd is
  port (
    bcd             : in  std_logic_vector(3 downto 0); 
    clk             : in  std_logic; 
    reset           : in  std_logic;
    hex0            : out std_logic_vector(6 downto 0)
  );
end component;
         
    begin 
    opersig <= addsig & subsig;
    syncproc: process(clk, reset)
    begin
    --report
    --wait for 20 ns;
    if (reset = '1') then
        asig <= (others => '0');
        bsig <= (others => '0');
    elsif(rising_edge(clk)) then
        asig <= '0' & a;
        bsig <= '0' & b;
        --wait for 10 ns;
    
    --report
    --wait;
    end if;
    end process;
    
    
    add_sub: alu
        port map(
        a => asig,
        b => bsig,
        oper => opersig,
        output => rezsig);
   
    ssd0: ssd
        port map(
            bcd  =>  asig,
            reset => reset,
            clk => clk,
            hex0 => hex0
            );
    ssd1: ssd
        port map(
            bcd  =>  bsig,
            reset => reset,
            clk => clk,
            hex0 => hex1
            );
    ssd2: ssd
        port map(
            bcd  =>  rezsig,
            reset => reset,
            clk => clk,
            hex0 => hex2
            );
    
    sync3: synchronizer
        port map(
        clk => clk,
        reset => reset,
        async_in => sub,
        sync_out => subsig);
        
    sync4: synchronizer
        port map(
        clk => clk,
        reset => reset,
        async_in => add,
        sync_out => addsig);

end arch;
        
