-------------------------------------------------------------------------------
-- Dr. Kaputa
-- rising_edge_synchronizer example
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      

entity rising_edge_synchronizer is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    input             : in std_logic;
    edge              : out std_logic
  );
end rising_edge_synchronizer;

architecture beh of rising_edge_synchronizer is
-- signal declarations
signal input_z     : std_logic := '1';
signal input_zz    : std_logic := '1';

begin 
process(reset,clk,input)
	begin
		if reset = '1' then
			edge        <= '0';
      input_z     <= '0';
      input_zz    <= '0';
		elsif rising_edge(clk) then
      input_z   <= input;
      input_zz  <= input_z;
      edge <= (input_z xor input_zz) and input_zz;
		end if;
end process;	
end beh; 