library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity toplevcount is
generic (
    bits    : integer := 4
  );
port (
	--bcd                    : in std_logic_vector(3 downto 0);
    clk                    : in std_logic; 
    --enable             	   : in std_logic; 
    reset                  : in std_logic;
    --sum                    : out std_logic_vector(bits-1 downto 0);
    sevenSeg               : out std_logic_vector(6 downto 0)
  ); 
 end entity toplevcount;
 
 architecture arch of toplevcount is
 signal sum_sig :std_logic_vector(bits-1 downto 0);
 signal enable : std_logic;
 
 component generic_adder_beh is 
 port (
    a       : in  std_logic_vector(bits-1 downto 0);
    b       : in  std_logic_vector(bits-1 downto 0);
    cin     : in  std_logic;
    sum     : out std_logic_vector(bits-1 downto 0);
    cout    : out std_logic
  );
end component;

component generic_counter is
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
    output          : out std_logic
  );  
end component;  

component ssd is
  port (
    bcd             : in  std_logic_vector(3 downto 0); 
    clk             : in  std_logic; 
    reset           : in  std_logic;
    hex0            : out std_logic_vector(6 downto 0)
  );
end component;

adder:generic_adder_beh
	port map(
		a=>sum_sig,
		b=>"0001";
		reset => reset,
		sum => sum_sig,
		cout => open
		);

counter:generic_counter 
	port map(
		clk =>clk,
		reset => reset,
		output=>enable
		);

uut:ssd
	port map(
	bcd=>sum_sig,
	clk=>clk,
	reset=>reset,
	hex0=>sevenSeg
	);