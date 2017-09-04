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
signal andABRez, andACinRez, andBCinRez,XorABRez :std_logic;
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
    c       : in std_logic;
	z       : out std_logic
  );
end component;

begin 
  andAB:and2
  port map(
  a => a,
  b => b,
  z => andABRez
  );
  andACin:and2
  port map(
  a => a,
  b => cin,
  z => andACinRez
  );
  andBCin:and2
  port map(
  a => a,
  b => b,
  z => andBCinRez
  );
  orGate:or3
  port map(
  a => andABRez,
  b => andBCinRez,
  z => andACinRez,
  z => cout
  );
  Xorgate1:xor2
  port map(
  a => a,
  b => b,
  z => XorABRez
  );
  Xorgate2:xor2
  port map(
  a => XorABRez,
  b => cin,
  z => sum
  );
  
end arch; 