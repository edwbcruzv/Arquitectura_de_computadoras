library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageadder4bit00.all;

entity adder4bit00 is 
	port(
		Cin :in std_logic;
		A,B :in std_logic_vector(3 downto 0);
		Z,LED_A ,LED_B:out std_logic_vector(3 downto 0);
		Cout :out std_logic);
 
 end adder4bit00;
 
 
 architecture adder4bit0 of adder4bit00 is
 signal C1,C2,C3,C4,D_S: std_logic;
signal B_S:std_logic_vector(3 downto 0);
signal Z_S:std_logic_vector(3 downto 0);
 begin
 
	LED_A <= A;
	LED_B <= B;
	--area de los sumadores completos
	F00: fa00 port map(A_fa => A(0), 
						B_fa => B_S(0),
						S_fa => Z_S(0),
						Cin_fa => Cin,
						Cout_fa => C1);
						
	F01: fa00 port map(A_fa => A(1),
						B_fa => B_S(1),
						S_fa => Z_S(1),
						Cin_fa => C1,
						Cout_fa => C2);
						
	F02: fa00 port map(A_fa => A(2),
						B_fa => B_S(2),
						S_fa => Z_S(2),
						Cin_fa => C2,
						Cout_fa => C3);
						
	F03: fa00 port map(A_fa => A(3),
						B_fa => B_S(3),
						S_fa => Z_S(3),
						Cin_fa => C3,
						Cout_fa => C4 );
							
	--area de xor de entrada a los sumadores completos
	
	F10: xor00 port map(A_xor => Cin,
						B_xor => B(0),
						y_xor =>B_s(0));
						
	F11: xor00 port map(A_xor => Cin,
						B_xor=> B(1),
						y_xor=>B_s(1));
						
	F12: xor00 port map(A_xor => Cin,
						B_xor=> B(2),
						y_xor=>B_s(2));
						
	F13: xor00 port map(A_xor => Cin,
						B_xor=> B(3),
						y_xor=>B_s(3));
						
	--area de los dos xnor funales
	
	F20: xnor00 port map(A_xnor => C4,
						B_xnor => C3,
						y_xnor=>D_s);
						
	F21: xor00 port map(A_xor => C3,
						B_xor=> C4,
						y_xor=>Cout);
						
	--area de las 4 and
	
	F30: and00 port map(A_and => D_S,
						B_and => Z_S(0),
						y_and=>Z(0));
						
	F31: and00 port map(A_and => D_S,
						B_and => Z_S(1),
						y_and=>Z(1));
						
	F32: and00 port map(A_and => D_S,
						B_and => Z_S(2),
						y_and=>Z(2));
						
	F33: and00 port map(A_and => D_S,
						B_and => Z_S(3),
						y_and=>Z(3));
										
 end adder4bit0;