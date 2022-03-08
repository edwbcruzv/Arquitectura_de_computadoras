library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity or00 is
	port( 
		A_or : in std_logic_vector(7 downto 0);
		B_or : in std_logic_vector(7 downto 0);
		Y_or : out std_logic_vector(7 downto 0));
end or00;

architecture or0 of or00 is
begin
	Y_or <= A_or or B_or;
end or0;