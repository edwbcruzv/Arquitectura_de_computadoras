library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity and00 is
	port( 
		A_and : in std_logic_vector(7 downto 0);
		B_and : in std_logic_vector(7 downto 0);
		Y_and : out std_logic_vector(7 downto 0));
end and00;

architecture and0 of and00 is
begin
	Y_and <= A_and and B_and;
end and0;