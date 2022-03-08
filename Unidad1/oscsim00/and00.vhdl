library ieee;
use ieee.std_logic_1164.all;


entity and00 is
	port( 
		A_and : in std_logic;
		B_and : in std_logic;
		Y_and : out std_logic);
end and00;

architecture and0 of and00 is
begin
	Y_and <= A_and and B_and;
end and0;