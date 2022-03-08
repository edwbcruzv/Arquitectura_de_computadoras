library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xor00 is
	port( 
		A_xor : in std_logic_vector(7 downto 0);
		B_xor : in std_logic_vector(7 downto 0);
		Y_xor : out std_logic_vector(7 downto 0));
end xor00;

architecture xor0 of xor00 is
begin
	Y_xor <= A_xor xor B_xor;
end xor0;