-------------------------------------------------------------------------------
-- Dr. Kaputa
-- single bit full adder [archavioral]
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      

entity adderBehave is 
  port (
    a       : in std_logic;
    b       : in std_logic;
    cin     : in std_logic;
    sum     : out std_logic;
    cout    : out std_logic
  );
end adderBehave;

architecture arch of adderBehave is
begin 
  sum  <= (a xor b) xor cin;
  cout <= (a and b) or (b and cin) or (cin and a);
end arch; 