-------------------------------------------------------------------------------
-- Dr. Kaputa
-- single bit full adder [archavioral]
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      

entity adderStruct is 
  port (
    a       : in std_logic;
    b       : in std_logic;
    cin     : in std_logic;
    sum     : out std_logic;
    cout    : out std_logic
  );
end adderStruct;

architecture arch of adderStruct is
component and2 is 
  port (
    a       : in std_logic;
    b       : in std_logic;
	z       : out std_logic
  );
end component;

component xor2 is 
  port (
    a       : in std_logic;
    b       : in std_logic;
	z       : out std_logic
  );
end component;

component or3 is 
  port (
    a       : in std_logic;
    b       : in std_logic;
	z       : out std_logic
  );
end component;

begin 
  sum  <= (a xor b) xor cin;
  cout <= (a and b) or (b and cin) or (cin and a);
end arch; 