-------------------------------------------------------------------------------
-- Dr. Kaputa
-- blink led demo
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;   
use ieee.numeric_std.all;      

entity alu is
  port (
    a              : in std_logic_vector(7 downto 0); 
    b              : in std_logic_vector(7 downto 0);
    oper           : in  std_logic_vector(1 downto 0);
    clk            : in std_logic;
    reset          : in std_logic;
    output         : out std_logic_vector(7 downto 0)
  );  
end alu;  

architecture arch of alu  is

signal rez :std_logic_vector(7 downto 0);
begin
sync:process(clk, reset)
    begin
    if(reset = '1') then
        output <= (others => '0');
    elsif (rising_edge(clk)) then
        output <= rez;
    end if;
    end process;
process(a,b,oper)
  begin
--  if (en = '1') then
    case oper is
        when "10" => rez <= a + b;
        when "01" => rez <= a - b;
        when others => rez <= (others => '0');
    end case;
    --end if;
  end process;
end arch;