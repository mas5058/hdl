-------------------------------------------------------------------------------
-- Dr. Kaputa
-- seven segment test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevcount_tb is
end toplevcount_tb;

architecture arch of toplevcount_tb is

component toplevcount is
  port (
    clk                : in std_logic; 
    reset              : in std_logic;
    sevenSeg               : out std_logic_vector(6 downto 0)
  );  
end component; 

signal sevenSeg         : std_logic_vector(6 downto 0);
constant period     : time := 20ns;                                              
signal clk          : std_logic := '0';
signal reset        : std_logic := '1';

begin

-- bcd iteration
-- sequential_tb : process 
    -- begin
      -- report "****************** sequential testbench start ****************";
      -- wait for 80 ns;   -- let all the initial conditions trickle through
      -- for i in 0 to 9 loop
        -- bcd <= std_logic_vector(unsigned(bcd) + 1 );
        -- wait for 40 ns;
      -- end loop;
      -- report "****************** sequential testbench stop ****************";
      -- wait;
  -- end process; 

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

uut: toplevcount
  port map(        
    clk            => clk,
    reset          => reset,
    --bcd            => bcd,
    Sevenseg  => Sevenseg
  );
end arch;