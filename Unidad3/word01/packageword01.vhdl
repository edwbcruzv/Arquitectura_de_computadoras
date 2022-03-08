library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageword01 is

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
		port(
		in_coder: in std_logic_vector(3 downto 0); --numero en binario
		out_word: out std_logic_vector(7 downto 0)); --salida de la palabra para display
	end component;
	
	component mux00
		port(in_cont: in std_logic_vector(3 downto 0); --turnos de cada display
			in_word_nibb_0:in std_logic_vector(7 downto 0); --nibble 0 
			in_word_nibb_1:in std_logic_vector(7 downto 0); --nibble 1
			in_word_nibb_2:in std_logic_vector(7 downto 0); --nibble 2
			in_word_nibb_3:in std_logic_vector(7 downto 0); --nibble 3
			out_word: out  std_logic_vector(7 downto 0));--salida hacia el Display 4 segnmentos
	end component;

end packageword01;