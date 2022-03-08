library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xor00 is
	port( 
		A_xor : in std_logic;
		B_xor : in std_logic;
		Y_xor : out std_logic);
end xor00;

architecture xor0 of xor00 is
begin
	Y_xor <= A_xor xor B_xor;
end xor0;