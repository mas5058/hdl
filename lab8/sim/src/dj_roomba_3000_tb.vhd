-------------------------------------------------------------------------------
-- Dr. Kaputa
-- dj roomba 3000 test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dj_roomba_3000_tb is
end dj_roomba_3000_tb;

architecture arch of dj_roomba_3000_tb is

component dj_roomba_3000 is 
  port(
    clk                 : in std_logic;
    reset               : in std_logic;
    execute_btn         : in std_logic;
    sync                : in std_logic;
    led                 : out std_logic_vector(7 downto 0);
    audio_out           : out std_logic_vector(15 downto 0)
  );
end component;

constant period     : time := 20ns;                                              
signal clk          : std_logic := '0';
signal reset        : std_logic := '1';
signal sync         : std_logic := '0';
signal execute_btn         : std_logic := '0';

begin

dj_roomba : dj_roomba_3000
  port map(
    clk         => clk,
    reset       => reset,
    execute_btn => execute_btn,
    sync        => sync,
    led         => open,
    audio_out   => open
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

-- main test process
main: process 
  begin
    report "****************** TB Start ****************" severity note;
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    wait for 100 ns;     
    execute_btn <= '1';
    wait for 100 ns;     
    execute_btn <= '0';
    report "****************** TB Finish ****************" severity note;
    wait;
  end process; 
end arch;