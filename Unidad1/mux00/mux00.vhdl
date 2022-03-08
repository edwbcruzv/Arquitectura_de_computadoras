library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity mux00 is
	port( 
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		S : in std_logic_vector(2 downto 0);
		L_A : out std_logic_vector(7 downto 0);
		L_B : out std_logic_vector(7 downto 0);
		Z: out std_logic_vector(7 downto 0));
end mux00;


architecture mux0 of mux00 is
begin

	L_A <= A;
	L_B <= B;

	with S select
	Z<= A when "000",
		not A when "001",
		A and B when "010",
		A or B when "011",
		A nand B when "100",
		A nor B when "101",
		A xor B when "110",
		not(A xor B) when others;

end mux0;
