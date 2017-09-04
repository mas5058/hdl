-------------------------------------------------------------------------------
-- Dr. Kaputa
-- blink test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity adderStruct_tb is
end adderStruct_tb;

architecture arch of adderStruct_tb is

component adderStruct is
  port (
    a             : in  std_logic; 
    b             : in  std_logic;
    cin           : in  std_logic;
    sum           : out std_logic;
    cout          : out std_logic
  );  
end component;  

                                            
signal a            : std_logic := '0';
signal b            : std_logic := '0';
signal cin          : std_logic := '0';
signal sum          : std_logic;
signal cout          : std_logic;

begin

uut: adderStruct  
  
  port map(
    a       => a,
    b     => b,
    cin    => cin,
    sum    => sum,
    cout    => cout
  );
  
  a <= not a after 10 ns;
  b <= not b after 20 ns;
  cin <= not cin after 30 ns;
end arch;