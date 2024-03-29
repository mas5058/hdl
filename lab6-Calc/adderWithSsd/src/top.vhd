-------------------------------------------------------------------------------
-- Dr. Kaputa
-- top
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
  port (
    input           : in  std_logic_vector(7 downto 0);
    oper            : in  std_logic_vector(1 downto 0);
    clk             : in  std_logic; 
    reset           : in  std_logic;
    execute         : in  std_logic;
    mr              : in  std_logic;
    ms              : in  std_logic;
    hex0            : out std_logic_vector(6 downto 0);
    hex1            : out std_logic_vector(6 downto 0);
    hex2            : out std_logic_vector(6 downto 0)
    led            : out std_logic_vector(4 downto 0)
  );
end top;

--we is not an input, but something generated with state machine

architecture beh of top is

component memory is 
  generic (addr_width : integer := 4;
           data_width : integer := 8);
  port (
    clk               : in std_logic;
    we                : in std_logic;
    addr              : in std_logic_vector(addr_width - 1 downto 0);
    din               : in std_logic_vector(data_width - 1 downto 0);
    dout              : out std_logic_vector(data_width - 1 downto 0)
  );
end component;

component doubledabble is
  port (
    binIn             : in  std_logic_vector(11 downto 0); 
    ones              : out std_logic_vector (3 downto 0);
    tens              : out std_logic_vector (3 downto 0);
    hundreds          : out std_logic_vector (3 downto 0)
    --thousands         : out std_logic_vector (3 downto 0)
  );  
end component; 
--rez
component ssd is
  port (
    input                 : in  std_logic_vector(3 downto 0); 
    clk                   : in  std_logic; 
    reset                 : in  std_logic;
    hex                   : out std_logic_vector(6 downto 0)
  );  
end component;  

component state_machine is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    execute           : in std_logic;
    ms                : in std_logic;
    mr                : in std_logic;
    we                : out std_logic;
    en                : out std_logic_vector(4 downto 0)
  );
end component;


component alu is
  port (
    clk           : in  std_logic;
    reset         : in  std_logic;
    a             : in  std_logic_vector(7 downto 0); 
    b             : in  std_logic_vector(7 downto 0);
    op            : in  std_logic_vector(1 downto 0); -- 00: add, 01: sub, 10: mult, 11: div
    result        : out std_logic_vector(7 downto 0)
  );  
end component;   

component risingEdgeSynch is
  port (
    clk             : in  std_logic; 
    reset           : in std_logic;
    input           : in  std_logic;
    output          : out std_logic
  );  
end component;

signal oneSig,tenSig,Hundsig                 : std_logic_vector(3 downto 0) := (others => '0');
signal en                 : std_logic_vector(4 downto 0) := (others => '0');
signal opersig                                  : std_logic_vector(1 downto 0) := (others => '0');
signal rez,asig,bsig                            : std_logic_vector(7 downto 0):= (others => '0');
signal rezPad                                   : std_logic_vector(11 downto 0):= (others => '0');
signal memPad                                   : std_logic_vector(11 downto 0):= (others => '0');
signal addrsig                                  : std_logic_vector(9 downto 0):= (others => '0');
signal weSig                                       : std_logic;
begin

mem: memory
    port map(
    clk => clk,
    we => weSig,
    addr => addrsig,
    --ask about addr
    din => rezpad,
    --clk => clk,
    dout => asig
    --thousands => open
    );
dd: doubledabble
    port map(
    binIn => memPad,
    ones => oneSig,
    tens => tenSig,
    hundreds => Hundsig
    --thousands => open
    );
sta: state_machine
  port map(
    execute         => execute,
    ms              => ms,
    we => weSig,
    mr              => mr,
    clk             => clk,
    reset           => reset,
    en              => en
  );
  ssd0: ssd
  port map(
    input     => oneSig,
    clk       => clk,
    reset     => reset,
    hex      => hex0
  );
  ssd1: ssd  
  port map(
    input     => tenSig,
    clk       => clk,
    reset     => reset,
    hex      => hex1
  );
  ssd2: ssd
  port map(
    input     => Hundsig,
    clk       => clk,
    reset     => reset,
    hex      => hex2
  );
addersub: alu
  port map(
    a         => asig,
    b         => input,
    clk       => clk,
    reset     => reset,
    op        => oper,
    result    => rez
  );
  
trollToll:process(clk,en)
begin
    if (rising_edge(clk)) then
        if (en = "00010") then
            memPad <= rezPad;
        elsif(en = "10000") then
            memPad <= "0000" & asig;
        end if;
    end if;
end process;

process (clk, reset,rezPad,opersig)
begin
if (reset = '1') then
    rezPad <= (others => '0');
    opersig <= (others => '0');
elsif (rising_edge(clk)) then
    opersig <= oper;
    rezPad <= "0000" & rez;
end if;
end process;
-- process(en,asig,bsig,input)
-- begin
    -- case en is 
        -- when "0001" => asig <= input;
        -- when "0010" => bsig <= input;
        -- when others => 
            -- asig <= asig;
            -- bsig <= bsig;
        -- end case;
        -- end process;
     end beh;