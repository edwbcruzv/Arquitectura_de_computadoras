library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xnor00 is
	port( 
		A_xnor : in std_logic_vector(7 downto 0);
		B_xnor : in std_logic_vector(7 downto 0);
		Y_xnor : out std_logic_vector(7 downto 0));
end xnor00;

architecture xnor0 of xnor00 is
begin
	Y_xnor <= not(A_xnor xor B_xnor);
end xnor0;