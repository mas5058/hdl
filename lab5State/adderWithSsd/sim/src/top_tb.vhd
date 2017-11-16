-------------------------------------------------------------------------------
-- Dr. Kaputa
-- state machine test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      -- gives you the std_logic type

entity top_tb is 
end top_tb;

architecture beh of top_tb is

component top is
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
    stateChange     : in  std_logic;
    input           : in  std_logic_vector(7 downto 0);
    hex0            : out std_logic_vector(6 downto 0);
    hex1            : out std_logic_vector(6 downto 0);
    hex2            : out std_logic_vector(6 downto 0)
  );
end component;
  
constant period         : time := 20ns;                                              
signal clk              : std_logic := '0';
signal reset            : std_logic := '1';
signal stateChange      : std_logic := '0';
signal input            : std_logic_vector(7 downto 0) := (others => '0');
signal hex0             : std_logic_vector(6 downto 0) := (others => '0');
signal hex1             : std_logic_vector(6 downto 0) := (others => '0');
signal hex2             : std_logic_vector(6 downto 0) := (others => '0');

begin 
uut: top 
  port map(
    clk               => clk,
    reset             => reset,
    stateChange       => stateChange,
    input             => input,
    hex0              => hex0,
    hex1              => hex1,
    hex2              => hex2
  );
 
-- clock process
clock: process
  begin
    clk <= not clk;
    wait for period/2;
end process; 
 
-- reset process
async_reset: process
  begin
    wait for 2 * period;
    reset <= '0';
    wait;
end process; 
    
stateChanproc: process
 begin
    wait for 2 * period;
    stateChange <= not stateChange;
end process;
main: process 
  begin
    wait for 40 ns;
    input <= "00000101";
    stateChange <= '1';
    wait for 10 ns;
    stateChange <= '0';
    --input a =5
    wait for 40 ns;
    input <= "00000010";
    stateChange <= '1';
    wait for 10 ns;
    stateChange <= '0';
    --input b = 2
    wait for 40 ns;
    stateChange <= '1';
    --sum
    wait for 10 ns;
    stateChange <= '0';
    wait for 40 ns;
    wait;
  end process;  
end beh;