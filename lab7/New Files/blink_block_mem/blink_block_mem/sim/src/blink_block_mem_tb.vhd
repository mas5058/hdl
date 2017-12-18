-------------------------------------------------------------------------------
-- Dr. Kaputa
-- block mem test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity blink_block_mem_tb is
end blink_block_mem_tb;

architecture arch of blink_block_mem_tb is

component blink_block_mem is
  generic (
    update_rate      : in  integer -- 50,000,000 = 1 sec
  );
  port (
    clk              : in  std_logic; 
    reset            : in  std_logic;
    led_out          : out std_logic_vector(6 downto 0)
  );
end component; 

signal led_out        : std_logic_vector(6 downto 0);
constant period       : time := 20ns;                                              
signal clk            : std_logic := '0';
signal reset          : std_logic := '1';
constant UPDATE_RATE  : integer := 5;

begin

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

uut: blink_block_mem  
  generic map (
    update_rate   => UPDATE_RATE
  )
  port map(
    clk           => clk,
    reset         => reset,
    led_out       => led_out
  );
end arch;