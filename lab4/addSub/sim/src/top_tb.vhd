
library ieee;
use ieee.std_logic_1164.all;      
use ieee.std_logic_signed.all;  
use ieee.numeric_std.all;  
use ieee.std_logic_1164.all;

entity top_tb is
end top_tb;

architecture arch of top_tb is

component top is 
    port (a, b           : in std_logic_vector (2 downto 0);
          add,sub,clk,reset      : in std_logic;
          hex0,hex1,hex2 : out std_logic_vector (6 downto 0)
    );
    end component;

--signal output       : std_logic;
constant period: time := 20ns;
signal a, b : std_logic_vector(2 downto 0) := (others => '0');
signal add,sub,clk : std_logic := '0';
signal reset : std_logic := '1';
signal  hex0,hex1,hex2 : std_logic_vector (6 downto 0);


begin

-- clock process
clock: process
  begin
    clk <= not clk;
    wait for period/2;
end process; 
 
-- reset process
sequential_tb : process 
    begin
      report "****************** sequential testbench start ****************";
      wait for 40 ns;   -- let all the initial conditions trickle through
      for i in 0 to 9 loop
        a <= a + '1';
        wait for 40 ns;
       b <= b + '1';
      end loop;
      report "****************** sequential testbench stop ****************";
      wait;
  end process; 
  
async_reset: process
  begin
    wait for 2 * period;
    reset <= '0';
    wait;
end process; 

uut: top  
  port map(
    clk       => clk,
	a         =>    a,
	b         =>    b,
	--oper      =>  oper,
    add       => add,
    sub       => sub,
    reset     => reset,
    hex0      =>  hex0,
    hex1      =>  hex1,
    hex2      =>  hex2
  );
end arch;