library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageha00 is

	component and00 
	port( 
		A_and : in std_logic;
		B_and : in std_logic;
		Y_and : out std_logic);
	end component; 	
	
	component xor00 
	port( 
		A_xor : in std_logic;
		B_xor : in std_logic;
		Y_xor : out std_logic);
	end component;

end packageha00;