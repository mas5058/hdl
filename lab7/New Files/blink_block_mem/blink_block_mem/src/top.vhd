-------------------------------------------------------------------------------
-- Dr. Kaputa
-- block mem top
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity top is
  port (
    clk              : in  std_logic; 
    reset            : in  std_logic;
    led_out          : out std_logic_vector(6 downto 0)
  );
end top;

architecture arch of top is

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

constant UPDATE_RATE : integer := 50000000;

begin

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