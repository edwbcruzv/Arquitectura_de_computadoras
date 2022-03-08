library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageadder8bit00 is

	component and00
	port( 
		A_and : in std_logic;
		B_and : in std_logic;
		Y_and : out std_logic);
	end component;
	
	component xor00 --compuerta xor
	port( 
		A_xor : in std_logic;
		B_xor : in std_logic;
		Y_xor : out std_logic);
	end component;

	component xnor00 --compuerta xnor
	port( 
		A_xnor : in std_logic;
		B_xnor : in std_logic;
		Y_xnor : out std_logic);
	end component;

	component fa00 --sumador completo
	port( 
		A_fa : in std_logic;
		B_fa : in std_logic;
		Cin_fa : in std_logic;
		S_fa : out std_logic;
		Cout_fa : out std_logic);
	end component;
	
end packageadder8bit00;