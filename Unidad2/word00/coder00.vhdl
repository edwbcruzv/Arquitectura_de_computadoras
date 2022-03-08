library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(in_cod: in std_logic_vector(3 downto 0); --turnos de cada display
		out_cod: out std_logic_vector(7 downto 0)); --salida de los segmentos
end coder00;

architecture coder0 of coder00 is
begin
	
	with in_cod select
		out_cod <= "10010000" when "0111", -- H
					 "00000010" when "1011",-- O
					 "11100010" when "1101",-- L
					 "00010000" when "1110",-- A
					 "00000000" when others;
end coder0;