library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		in_coder: in std_logic_vector(3 downto 0); --numero en binario
		out_word: out std_logic_vector(7 downto 0)); --salida de la palabra para display
end coder00;

architecture coder0 of coder00 is
type arrayrom is array(0 to 15) of std_logic_vector(7 downto 0);
constant wordrom: arrayrom:=("00000011", --0
							  "10011111", --1
							  "00100101", --2
							  "00001101", --3
							  "10011001", --4
							  "01001001", --5
							  "01000001", --6
							  "00011111", --7
							  "00000001", --8
							  "00011001", --9
							  "00010001", --A
							  "11000001", --B
							  "01100011", --C
							  "10000101", --D
							  "01100001", --E
							  "01110001", --F
								others => "11111111");
begin
	
					out_word <= wordrom(conv_integer(in_coder));
	
end coder0;