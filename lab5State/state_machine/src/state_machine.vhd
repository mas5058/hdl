-------------------------------------------------------------------------------
-- Dr. Kaputa
-- state machine example
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      

entity state_machine is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    stateChange    : in std_logic;
    en          : out std_logic_vector(3 downto 0)
    --each bit is an enable for a state
  );
end state_machine;

architecture beh of state_machine is
-- signal declarations
constant input_a        : std_logic_vector(3 downto 0) := "0001";
constant input_b        : std_logic_vector(3 downto 0) := "0010";
constant disp_sum      : std_logic_vector(3 downto 0) := "00100";
constant disp_diff        : std_logic_vector(3 downto 0) := "0101";


signal state_reg      : std_logic_vector(3 downto 0);
signal state_next     : std_logic_vector(3 downto 0);

begin 
-- state register
process(clk,reset)
begin 
  if (reset = '1') then 
    state_reg <= input_a;
  elsif (clk'event and clk = '1') then
    state_reg <= state_next;
  end if;
end process;

-- next state logic
process(state_reg,nearby_opponent,friend_wounded,me_wounded)
begin
  -- default values
  fighting    <= '0';
  state_next <= state_reg;    -- prevents a latch
  case state_reg is  
    when input_a =>
      if (stateChange = '1') then  
        state_next <= input_b;
        en <= "0001";
      else
        state_next <= input_a;
      end if;  
    when input_b=>
      if (stateChange = '1') then  
        state_next <= disp_sum;
        en <= "0010";
      else
        state_next <= input_b;
      end if;  
    when disp_sum =>
      if (stateChange = '1') then  
        state_next <= disp_diff;
        en <= "0100";
      else
        state_next <= disp_sum;
      end if;
    when disp_sum =>
      if (stateChange = '1') then  
        state_next <= input_a;
        en <= "1000";
      else
        state_next <= disp_diff;
      end if;
    when others =>
      state_next <= input_a;
  end case;
end process;
end beh; 