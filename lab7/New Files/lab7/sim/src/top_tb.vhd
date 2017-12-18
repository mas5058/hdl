-------------------------------------------------------------------------------
-- Dr. Kaputa
-- seven segment test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end top_tb;

architecture arch of top_tb is

component top is
  port ( 
        clk             : in std_logic;
        reset_n         : in std_logic;
        execute         : in std_logic;
        seven_seg_hun   : out std_logic_vector(6 downto 0);
        seven_seg_ten   : out std_logic_vector(6 downto 0);
        seven_seg_one   : out std_logic_vector(6 downto 0)
    ); 
end component; 

constant SEQUENTIAL_FLAG   : boolean := true;
constant NUM_BITS          : integer := 3;
signal output       : std_logic;
constant period     : time := 20ns;                                              
signal clk          : std_logic := '0';
signal reset_n        : std_logic := '0';
signal execute          : std_logic := '0';
signal seven_seg_hun: std_logic_vector(6 downto 0);
signal seven_seg_ten: std_logic_vector(6 downto 0);
signal seven_seg_one: std_logic_vector(6 downto 0);

begin

uut: top
  port map(               
    clk             => clk,          
    reset_n         => reset_n,               
    execute         => execute,      
    seven_seg_hun   => seven_seg_hun,
    seven_seg_ten   => seven_seg_ten,
    seven_seg_one   => seven_seg_one
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
    reset_n <= '1';
    wait;
end process; 



sequential_stimuli: if SEQUENTIAL_FLAG generate
  sequential_tb : process 
    begin
    wait for 2 * period;
    wait for 500 ns;
    for k in 0 to 1 loop
        execute<=not(execute);
        wait for 50 ns;
    end loop;
    wait for 500 ns;
    for k in 0 to 1 loop
        execute<=not(execute);
        wait for 50 ns;
    end loop;
end process;
end generate sequential_stimuli;
end arch;