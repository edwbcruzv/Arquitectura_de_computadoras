library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageword00 is

	component osc00 
		port(div_osc :in std_logic_vector(4 downto 0);
			clk_osc:inout std_logic);
	end component;
	
	component contring00
		port(clk_cont: in std_logic;
			load: in std_logic;
			out_cont: out std_logic_vector(3 downto 0));
	end component;

	component coder00 
		port(in_cod: in std_logic_vector(3 downto 0); --turnos de cada display
			out_cod: out std_logic_vector(7 downto 0)); --salida de los segmentos
	end component;

end packageword00;