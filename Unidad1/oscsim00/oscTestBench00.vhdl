library ieee;
use ieee.std_logic_1164.all;

entity oscTestBench00 is
end oscTestBench00;

architecture oscTestBench0 of oscTestBench00 is
	component and00
		port( 
			A_and : in std_logic;
			B_and : in std_logic;
			Y_and : out std_logic);
	end component;
signal sclk,sBa,sYa: std_logic;
constant periodo: time:= 40 ns;
	
begin
	A00: and00 port map(A_and => sclk,
						B_and => sBa,
							Y_and => sYa);
	
	pclk: process
	begin
		sclk<= '1';
		wait for periodo/2;
		sclk<= '0';
		wait for periodo/2;
	end process;
	
	
	estimulos: process
	begin
	-----------------------
		sBa <='1';
		wait for 40 ns;
	-----------------------
	-----------------------
		sBa <='0';
		wait for 40 ns;
	-----------------------
	-----------------------
		sBa <='1';
		wait for 1600 ns;
	-----------------------
	-----------------------
		sBa <='0';
		wait for 80 ns;
	-----------------------
		wait;
	end process;


end oscTestBench0;