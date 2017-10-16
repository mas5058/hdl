-------------------------------------------------------------------------------
-- Dr. Kaputa
-- blink led demo
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      

entity risingEdgeSynch is
  port (
    clk             : in  std_logic; 
	reset           : in std_logic;
    input           : in  std_logic;
    output          : out std_logic
  );  
end risingEdgeSynch;  

architecture arch of risingEdgeSynch  is

signal count_sig    : integer range 0 to max_count := 0;
signal output_sig   : std_logic;

begin
process(clk,reset)
  begin
    if (reset = '1') then 
      output <= 0;
    elsif (clk'event and clk = '1') then
		output <= input;
    end if;
  end process;
end arch;