-------------------------------------------------------------------------------
-- Dr. Kaputa
-- blink_block_mem
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blink_block_mem is
  generic (
    update_rate      : in  integer -- 50,000,000 = 1 sec
  );
  port (
    clk              : in  std_logic; 
    reset            : in  std_logic;
    led_out          : out std_logic_vector(6 downto 0)
  );
end blink_block_mem;

architecture beh of blink_block_mem is

component seven_seg is
  port (
    bcd              : in  std_logic_vector(3 downto 0); 
    seven_seg_out    : out std_logic_vector(6 downto 0)
  );  
end component; 

component blink_rom
  PORT(
    address         : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    clock           : IN STD_LOGIC  := '1';
    q               : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
  );
end component;

component generic_counter is
generic (
  max_count        : integer := 3
);
port (
  clk              : in  std_logic; 
  reset            : in  std_logic;
  output           : out std_logic
);  
end component; 

signal address_sig  : std_logic_vector(4 downto 0) := "00001";
signal q_sig        : std_logic_vector(3 downto 0);
signal enable       : std_logic;

begin

seven_seg_inst: seven_seg 
  port map (
    bcd            => q_sig,
    seven_seg_out  => led_out
  );  

rom_inst : blink_rom 
  port map (
    address     => address_sig,
    clock       => clk,
    q           => q_sig
  );
  
generic_counter_inst: generic_counter  
generic map (
  max_count => update_rate
)
port map(
  clk       => clk,
  reset     => reset,
  output    => enable
);

update_address: process(clk,reset,address_sig)
  begin
    if reset = '1' then
      address_sig <= (others => '0');
    elsif clk'event and clk = '1' then
      if enable = '1' then
        address_sig <= std_logic_vector(unsigned(address_sig) + 1 );
      end if;
    end if;
  end process;
end beh;