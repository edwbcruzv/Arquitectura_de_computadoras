library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package package_mux00 is

	component not00 is
	port( 
		A_not : in std_logic_vector(7 downto 0);
		Y_not : out std_logic_vector(7 downto 0));
	end component;

	component and00 is
	port( 
		A_and : in std_logic_vector(7 downto 0);
		B_and : in std_logic_vector(7 downto 0);
		Y_and : out std_logic_vector(7 downto 0));
	end component;

	component or00 is
	port( 
		A_or : in std_logic_vector(7 downto 0);
		B_or : in std_logic_vector(7 downto 0);
		Y_or : out std_logic_vector(7 downto 0));
	end component;

	component nand00 is
	port( 
		A_nand : in std_logic_vector(7 downto 0);
		B_nand : in std_logic_vector(7 downto 0);
		Y_nand : out std_logic_vector(7 downto 0));
	end component;

	component nor00 is
	port( 
		A_nor : in std_logic_vector(7 downto 0);
		B_nor : in std_logic_vector(7 downto 0);
		Y_nor : out std_logic_vector(7 downto 0));
	end component;

	component xor00 is
	port( 
		A_xor : in std_logic_vector(7 downto 0);
		B_xor : in std_logic_vector(7 downto 0);
		Y_xor : out std_logic_vector(7 downto 0));
	end component;

	component xnor00 is
	port( 
		A_xnor : in std_logic_vector(7 downto 0);
		B_xnor : in std_logic_vector(7 downto 0);
		Y_xnor : out std_logic_vector(7 downto 0));
	end component;

end package_mux00;
