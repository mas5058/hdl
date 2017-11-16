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
    execute           : in std_logic;
    ms                : in std_logic;
    mr                : in std_logic;
    en                : out std_logic_vector(3 downto 0)
    --each bit is an enable for a state
  );
end state_machine;

architecture beh of state_machine is
-- signal declarations
constant read_write      : std_logic_vector(3 downto 0) := "0000";
constant writeNoper      : std_logic_vector(3 downto 0) := "0100";
constant writeCoper      : std_logic_vector(3 downto 0) := "0101";
constant write_s         : std_logic_vector(3 downto 0) := "0111";
constant read_s          : std_logic_vector(3 downto 0) := "0001";


signal state_reg      : std_logic_vector(3 downto 0);
signal state_next     : std_logic_vector(3 downto 0);

begin 
-- state register
process(clk,reset)
begin 
  if (reset = '1') then 
    state_reg <= read_write;
  elsif (clk'event and clk = '1') then
    state_reg <= state_next;
  end if;
end process;

-- next state logic
process(state_reg,stateChange)
begin
  -- default values
  state_next <= state_reg;    -- prevents a latch
  case state_reg is  
    when read_write =>
      if (execute = '1') then  
        state_next <= writeNoper;
        en <= "0001";
      elsif ms = '1') then
        state_next <= write_s;
      elsif mr = '1') then
        state_next <= read_s;
      else
        state_next <= read_write;
      end if;  
    when writeNoper=>
        state_next <= writeCoper;
    when writeCoper =>
        state_next <= read_write;
    when write_s =>
        state_next <= read_write;
    when read_s =>
        state_next <= writeNoper;
    when others =>
      state_next <= read_write;
  end case;
end process;
end beh; 