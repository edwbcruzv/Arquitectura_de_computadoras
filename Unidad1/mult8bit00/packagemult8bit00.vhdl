library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;


package packagemult8bit00 is

	component and00 
	port( 
		A_and : in std_logic;
		B_and : in std_logic;
		Y_and : out std_logic);
	end component;
	
	component fa00 
		port( 
		A_fa : in std_logic;
		B_fa : in std_logic;
		Cin_fa : in std_logic;
		Suma_fa : out std_logic;
		Cout_fa : out std_logic);

	end component;

	
end packagemult8bit00;