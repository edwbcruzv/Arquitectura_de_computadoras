library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;



package packageshiftrRL00 is 
	
	component osc00
	port(div_osc :in std_logic_vector(4 downto 0);
		clk_osc:inout std_logic);
	end component;

	component shiftrRL00 
		port(clks: in std_logic;
			ens: in std_logic;
			ins: in std_logic_vector(7 downto 0);
			outs: out std_logic_vector(7 downto 0));
	end component;

end packageshiftrRL00;