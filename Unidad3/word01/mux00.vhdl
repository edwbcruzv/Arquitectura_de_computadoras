library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity mux00 is
	port(in_cont: in std_logic_vector(3 downto 0); --turnos de cada display
		in_word_nibb_0:in std_logic_vector(7 downto 0); --nibble 0 
		in_word_nibb_1:in std_logic_vector(7 downto 0); --nibble 1
		in_word_nibb_2:in std_logic_vector(7 downto 0); --nibble 2
		in_word_nibb_3:in std_logic_vector(7 downto 0); --nibble 3
		out_word: out  std_logic_vector(7 downto 0));--salida hacia el Display 4 segnmentos
end mux00;

architecture mux0 of mux00 is

begin

	with in_cont select
		out_word <= in_word_nibb_0 when "1110",
					in_word_nibb_1 when "1101",
					in_word_nibb_2 when "1011",
					in_word_nibb_3 when "0111",
					"11111111"	when others;
				 
end mux0;