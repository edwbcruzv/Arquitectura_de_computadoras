library ieee;
use ieee.std_logic_1164.all;
--library lattice;
--use lattice.all;

entity andTestBench00 is
end andTestBench00;

architecture andTestBench0 of andTestBench00 is
	component and00
		port( 
			A : in std_logic_vector(7 downto 0);
			B : in std_logic_vector(7 downto 0);
			Y : out std_logic_vector(7 downto 0));
	end component;
signal sA : std_logic_vector(7 downto 0);
signal sB : std_logic_vector(7 downto 0);
signal sY : std_logic_vector(7 downto 0);

begin
	A00: and00 port map ( A=>sA,
							B=>sB,
							Y=>sY);
	estimulos: process
	begin         		-- en Hexadecimal
		sA <="00000011"; --03 
		sB <="11000011"; --C3
		wait for 50 ns;
		
		sA <="11000011"; --C3
		sB <="00000011"; --03
		wait for 50 ns;
		
		sA <="11000011"; --C3
		sB <="11000000"; --C0
		wait for 50 ns;
		
		sA <="00111100"; --3C
		sB <="00001100"; --0C
		wait for 50 ns;
		
		sA <="00111100"; --3C
		sB <="00111100"; --3C
		wait for 50 ns;
		
	end process;

end andTestBench0;