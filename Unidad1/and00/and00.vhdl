library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity and00 is
	port( 
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		Y : out std_logic_vector(7 downto 0));
end and00;

architecture and0 of and00 is
begin
	Y <= A and B;
end and0;