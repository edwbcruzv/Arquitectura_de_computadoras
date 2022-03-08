library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageha00.all;
-- MEDIO SUMADOR
entity ha00 is
	port( 
		A_ha : in std_logic;
		B_ha : in std_logic;
		S_ha : out std_logic;
		C_ha : out std_logic);
end ha00;

architecture ha0 of ha00 is
begin
	F00: xor00 port map(A_xor=>A_ha,
						B_xor=>B_ha,
						Y_xor=>S_ha);
	
	F01: and00 port map(A_and=>A_ha,
						B_and=>B_ha,
						Y_and=>C_ha);
		
end ha0;