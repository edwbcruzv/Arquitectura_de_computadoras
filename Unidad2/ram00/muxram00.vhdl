library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
-- el muxram mostrara el numero que nosotros tecleamos 
entity muxram00 is
	port(
		reset: in std_logic; --reset de muxram
		rw: in std_logic; --rw de musram
		in_word_coder: in std_logic_vector(7 downto 0); --entrada que viene del coder, codigo del display
		in_word_memram: in std_logic_vector(7 downto 0); --entrada que viene de memram
		out_word: out std_logic_vector(7 downto 0)); --salida de codigo de display que se solicito por teclado matricial

end muxram00;

architecture muxram0 of muxram00 is 
signal S_control:std_logic_vector(1 downto 0); --vector de control
begin
	S_control <= (reset)&(rw); --concatenacion de valores
	with S_control select
		out_word <= "11111111" when "00", --inicializacion
						"11111111" when "01", --inicialicacion
				in_word_coder when "10",
						in_word_memram when "11",
						"11111111" when others;
						
end muxram0;