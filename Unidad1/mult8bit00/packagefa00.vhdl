library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagefa00 is

	component or00 
	port( 
		A_or : in std_logic;
		B_or : in std_logic;
		Y_or : out std_logic);
	end component;
	
	component ha00 
		port( 
		A_ha : in std_logic;
		B_ha : in std_logic;
		S_ha : out std_logic;
		C_ha : out std_logic);

	end component;

	
end packagefa00;