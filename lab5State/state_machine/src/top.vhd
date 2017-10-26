-------------------------------------------------------------------------------
-- Dr. Kaputa
-- blink top
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity top is
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
    stateChange     : in  std_logic;
    input           : in  std_logic_vector(3 downto 0);
    hex0            : out std_logic_vector(6 downto 0);
    hex1            : out std_logic_vector(6 downto 0);
  );
end top;

architecture beh of top is

component ssd is
  port (
    input                 : in  std_logic_vector(3 downto 0); 
    clk                   : in  std_logic; 
    reset                 : in  std_logic;
    hex0, hex1            : out std_logic_vector(6 downto 0)
  );  
end component;  

component state_machine is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    stateChange       : in std_logic;
    en                : out std_logic_vector(3 downto 0)
    --each bit is an enable for a state
  );
end component;

component alu is
  port (
    a               : in std_logic_vector(7 downto 0); 
    b               : in std_logic_vector(7 downto 0);
    oper            : in  std_logic_vector(1 downto 0);
    output          : out std_logic
  );  
end component;
signal en                 : std_logic_vector(3 downto 0);
signal rez,asig,bsig     : std_logic_vector(7 downto 0):= (others => '0');
begin
sta: state_machine
  generic map (
  port map(
    stateChange     => stateChange,
    clk             => clk,
    reset           => reset,
    en              => en
  );
  uut: ssd  
  generic map (
  port map(
    input     => rez,
    clk       => clk,
    reset     => reset,
    hex0      => hex0,
    hex1      => hex1
  );
addersub: alu
  generic map (
  port map(
    a         => asig,
    b         => bsig,
    oper      => en(1) & en(0),
    output    => rez
  );

process(en)
    case en is 
        when "0001" => asig <= input;
        when "0010" => bsig <= input;
        when others => 
            asig <= a;
            bsig <= b;
    end beh;