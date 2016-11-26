library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity SetingTime is 
	port( 
		load : in std_logic ;
		time_input: in std_logic_vector(3 downto 0);
		time_set: out std_logic_vector(3 downto 0)
	);
end SetingTime ;

architecture behav of SetingTime is 
begin
process(load)
begin
	if load'event and load = '1' then
		time_set <= time_input ;
	end if ;
	end process ;
end behav;