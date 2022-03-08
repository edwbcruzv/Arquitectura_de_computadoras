library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nor00 is
	port( 
		A_nor : in std_logic_vector(7 downto 0);
		B_nor : in std_logic_vector(7 downto 0);
		Y_nor : out std_logic_vector(7 downto 0));
end nor00;

architecture nor0 of nor00 is
begin
	Y_nor <= A_nor nor B_nor;
end nor0;