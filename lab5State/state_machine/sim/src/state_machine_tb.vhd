-------------------------------------------------------------------------------
-- Dr. Kaputa
-- state machine test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      -- gives you the std_logic type

entity state_machine_tb is 
end state_machine_tb;

architecture beh of state_machine_tb is

component state_machine is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    stateChange    : in std_logic;
    en          : out std_logic_vector(3 downto 0)
    --each bit is an enable for a state
  );
end component;
  
constant period         : time := 20ns;                                              
signal clk              : std_logic := '0';
signal reset            : std_logic := '1';
signal stateChange  : std_logic := '0';
signal en  : std_logic_vector(3 downto 0) := (others => '0');

begin 
uut: state_machine 
  port map(
    clk               => clk,
    reset             => reset,
    stateChange       => stateChange,
    en                => en
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
    
main: process 
  begin
    stateChange <= not stateChange;
    wait for period;
end process;
end beh;