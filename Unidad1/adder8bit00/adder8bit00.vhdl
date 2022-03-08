library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageadder8bit00.all;

entity adder8bit00 is 
	port(
		Cin :in std_logic;
		A,B :in std_logic_vector(7 downto 0);
		Z,LED_A ,LED_B:out std_logic_vector(7 downto 0);
		Cout :out std_logic);
 
 end adder8bit00;
 
 
 architecture adder8bit0 of adder8bit00 is
 signal C1,C2,C3,C4,C5,C6,C7,C8,D_S: std_logic;
signal B_S:std_logic_vector(7 downto 0);
signal Z_S:std_logic_vector(7 downto 0);
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
						Cout_fa => C4);
	
	F04: fa00 port map(A_fa => A(4), 
						B_fa => B_S(4),
						S_fa => Z_S(4),
						Cin_fa => C4,
						Cout_fa => C5);
						
	F05: fa00 port map(A_fa => A(5),
						B_fa => B_S(5),
						S_fa => Z_S(5),
						Cin_fa => C5,
						Cout_fa => C6);
						
	F06: fa00 port map(A_fa => A(6),
						B_fa => B_S(6),
						S_fa => Z_S(6),
						Cin_fa => C6,
						Cout_fa => C7);
						
	F07: fa00 port map(A_fa => A(7),
						B_fa => B_S(7),
						S_fa => Z_S(7),
						Cin_fa => C7,
						Cout_fa => C8 );
							
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
						
	F14: xor00 port map(A_xor => Cin,
						B_xor => B(4),
						y_xor =>B_s(4));
	
	F15: xor00 port map(A_xor => Cin,
						B_xor => B(5),
						y_xor =>B_s(5));
						
	F16: xor00 port map(A_xor => Cin,
						B_xor => B(6),
						y_xor =>B_s(6));
	
	F17: xor00 port map(A_xor => Cin,
						B_xor => B(7),
						y_xor =>B_s(7));

	--area de los dos xnor funales
	
	F20: xnor00 port map(A_xnor => C8,
						B_xnor => C7,
						y_xnor=>D_s);
						
	F21: xor00 port map(A_xor => C7,
						B_xor=> C8,
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
						
	F34: and00 port map(A_and => D_S,
						B_and => Z_S(4),
						y_and=>Z(4));
						
	F35: and00 port map(A_and => D_S,
						B_and => Z_S(5),
						y_and=>Z(5));
						
	F36: and00 port map(A_and => D_S,
						B_and => Z_S(6),
						y_and=>Z(6));
	
	F37: and00 port map(A_and => D_S,
						B_and => Z_S(7),
						y_and=>Z(7));
						
 end adder8bit0;