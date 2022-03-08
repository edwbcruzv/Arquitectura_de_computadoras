library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagekey00 is

	component osc00 
		port(div_osc :in std_logic_vector(4 downto 0);
			clk_osc:inout std_logic);
	end component;

	component contring00
		port(
			clk_cont: in std_logic;
			load: in std_logic;
			out_cont: out std_logic_vector(3 downto 0));
	end component;
	
	component coder00
		port(clk_cod:in std_logic; 
		in_key_cod: in std_logic_vector(3 downto 0); --turnos de cada fila del teclado
		out_key_cod: in std_logic_vector(3 downto 0); --turnos de cada columna del teclado
		out_coder: inout std_logic_vector(7 downto 0)); --salida a los display de 7 segmentos y 4 digitos
	end component;

end packagekey00;