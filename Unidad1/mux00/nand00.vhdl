library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nand00 is
	port( 
		A_nand : in std_logic_vector(7 downto 0);
		B_nand : in std_logic_vector(7 downto 0);
		Y_nand : out std_logic_vector(7 downto 0));
end nand00;

architecture nand0 of nand00 is
begin
	Y_nand <= A_nand nand B_nand;
end nand0;