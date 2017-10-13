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
    a              : in std_logic_vector(3 downto 0); 
	b              : in std_logic_vector(3 downto 0);
    oper           : in  std_logic_vector(1 downto 0);
    output          : out std_logic_vector(3 downto 0)
  );  
end alu;  

architecture arch of alu  is

signal rez, signeda, signedb, unsigneda,unsignedb :std_logic_vector(7 downto 0);

begin
process(a,b,oper, signeda, signedb)
  begin
    case oper is
        when "10" => rez <= a + b;
        when "01" => rez <= a - b;
        when others => rez <= "00000000";
    end case;
  end process;
end arch;