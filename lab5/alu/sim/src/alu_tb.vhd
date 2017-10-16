-------------------------------------------------------------------------------
-- Dr. Kaputa
-- alu test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
end alu_tb;

architecture arch of alu_tb is

component alu is
  port (
    a              : in std_logic_vector(3 downto 0); 
    b              : in std_logic_vector(3 downto 0);
    oper           : in  std_logic_vector(1 downto 0);
    output         : out std_logic_vector(3 downto 0)
  );  
end component;  

signal output       : std_logic_vector(3 downto 0);
signal oper         : std_logic_vector(1 downto 0) := "10";                                             
signal b            : std_logic_vector(3 downto 0) := (others => '0');
signal a            : std_logic_vector(3 downto 0) := (others => '0');

begin

-- clock process

seq_tb: process
    begin
    a(0) <= not a(0) after 10 ns;
    a(1) <= not a(1) after 20 ns;
    a(2) <= not a(2) after 30 ns;
    a(3) <= not a(3) after 40 ns;
    b(0) <= not b(0) after 20 ns;
    b(1) <= not b(1) after 40 ns;
    b(2) <= not b(2) after 60 ns;
    b(3) <= not b(3) after 80 ns;
    
    wait;
end process;

uut: alu  
  port map(
    a              => a,
    b              => b,
    oper           => oper,
    output         => output
  );
end arch;