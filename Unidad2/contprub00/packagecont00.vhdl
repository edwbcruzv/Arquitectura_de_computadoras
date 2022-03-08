library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package packagecont00 is

	component cont00
	port(
		clkc: in std_logic;
		resetc:in std_logic;
		outcontc: inout std_logic_vector(4 downto 0);
		outflagc: out std_logic);

	end component;
	
	component osc00
		port(div_osc :in std_logic_vector(4 downto 0);
			clk_osc:inout std_logic);
	end component;
	
end packagecont00;