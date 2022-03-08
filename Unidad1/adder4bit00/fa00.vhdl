library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagefa00.all;

entity fa00 is
	port( 
		A_fa : in std_logic;
		B_fa : in std_logic;
		Cin_fa : in std_logic;
		S_fa : out std_logic;
		Cout_fa : out std_logic);
end fa00;
--SUMADOR COMPLETO
architecture fa0 of fa00 is
signal Sint1: std_logic;
signal Cint1: std_logic;
signal Cint2: std_logic;
begin

	F00: ha00 port map(A_ha =>A_fa,
						B_ha =>B_fa,
						S_ha =>Sint1,
						C_ha =>Cint1);
						
	F01: ha00 port map(A_ha =>Cin_fa,
						B_ha =>Sint1,
						S_ha =>S_fa,
						C_ha =>Cint2);
						
	F02: or00 port map(A_or => Cint2,
						B_or => Cint1,
						Y_or => Cout_fa);

end fa0;