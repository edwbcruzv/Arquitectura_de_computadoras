library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagemult8bit00.all;

entity mult8bit00 is 
	port(A :in std_logic_vector(7 downto 0);
		 B :in std_logic_vector(7 downto 0);
		 R :out std_logic_vector(15 downto 0);
		 LED_A :out std_logic_vector(7 downto 0);
		 LED_B :out std_logic_vector(7 downto 0));
	
end mult8bit00;

architecture mult8bit0 of mult8bit00 is
--COMO VAN A SER 7 FILAS DE PUROS SUMADORES, CON 2 ENTRADAS CADA SUMADOR
--SON 2 VECTORES PARA CADA FILA
--ENTONCES SERAN 14 SIGNALS 
signal SS_A_fa0,SS_B_fa0,SS_C0: std_logic_vector(7 downto 0);--primera fila de sumadores completos
signal SS_A_fa1,SS_B_fa1,SS_C1: std_logic_vector(7 downto 0);--segunda fila de sumadores completos
signal SS_A_fa2,SS_B_fa2,SS_C2: std_logic_vector(7 downto 0);--tercera fila de sumadores completos
signal SS_A_fa3,SS_B_fa3,SS_C3: std_logic_vector(7 downto 0);--cuarta fila de sumadores completos
signal SS_A_fa4,SS_B_fa4,SS_C4: std_logic_vector(7 downto 0);--quinta fila de sumadores completos
signal SS_A_fa5,SS_B_fa5,SS_C5: std_logic_vector(7 downto 0);--sexta fila de sumadores completos
signal SS_A_fa6,SS_B_fa6,SS_C6: std_logic_vector(7 downto 0);--septima fila de sumadores completos

begin

	LED_A <= A;
	LED_B <= B;
	--
	R(0) <= SS_A_fa0(0);
	R(1) <= SS_A_fa1(0);
	R(2) <= SS_A_fa2(0);
	R(3) <= SS_A_fa3(0);
	R(4) <= SS_A_fa4(0);
	R(5) <= SS_A_fa5(0);
	R(6) <= SS_A_fa6(0);

	--SON 8 FILAS EN TOTAL DE PURAS AND'S
	--primer recorrido multiplicando B 0 con el vector 
	AND_0_A_fa0: and00 port map(A_and => A(0),B_and => B(0),Y_and=>SS_A_fa0(0)); --R(0)
	AND_1_A_fa0: and00 port map(A_and => A(1),B_and => B(0),Y_and=>SS_A_fa0(1));
	AND_2_A_fa0: and00 port map(A_and => A(2),B_and => B(0),Y_and=>SS_A_fa0(2));
	AND_3_A_fa0: and00 port map(A_and => A(3),B_and => B(0),Y_and=>SS_A_fa0(3));
	AND_4_A_fa0: and00 port map(A_and => A(4),B_and => B(0),Y_and=>SS_A_fa0(4));
	AND_5_A_fa0: and00 port map(A_and => A(5),B_and => B(0),Y_and=>SS_A_fa0(5));
	AND_6_A_fa0: and00 port map(A_and => A(6),B_and => B(0),Y_and=>SS_A_fa0(6));
	AND_7_A_fa0: and00 port map(A_and => A(7),B_and => B(0),Y_and=>SS_A_fa0(7));
	
	--segundo recorrido multiplicando B(1) con el vector A
	AND_0_B_fa0: and00 port map(A_and => A(0),B_and => B(1),Y_and => SS_B_fa0(0));
	AND_1_B_fa0: and00 port map(A_and => A(1),B_and => B(1),Y_and => SS_B_fa0(1));
	AND_2_B_fa0: and00 port map(A_and => A(2),B_and => B(1),Y_and => SS_B_fa0(2));
	AND_3_B_fa0: and00 port map(A_and => A(3),B_and => B(1),Y_and => SS_B_fa0(3));
	AND_4_B_fa0: and00 port map(A_and => A(4),B_and => B(1),Y_and => SS_B_fa0(4));
	AND_5_B_fa0: and00 port map(A_and => A(5),B_and => B(1),Y_and => SS_B_fa0(5));
	AND_6_B_fa0: and00 port map(A_and => A(6),B_and => B(1),Y_and => SS_B_fa0(6));
	AND_7_B_fa0: and00 port map(A_and => A(7),B_and => B(1),Y_and => SS_B_fa0(7));	
	 
	--tercer recorrido multiplicando B(2) con el vector A 
	AND_0_B_fa1: and00 port map(A_and => A(0),B_and => B(2),Y_and => SS_B_fa1(0));
	AND_1_B_fa1: and00 port map(A_and => A(1),B_and => B(2),Y_and => SS_B_fa1(1));
	AND_2_B_fa1: and00 port map(A_and => A(2),B_and => B(2),Y_and => SS_B_fa1(2));
	AND_3_B_fa1: and00 port map(A_and => A(3),B_and => B(2),Y_and => SS_B_fa1(3));
	AND_4_B_fa1: and00 port map(A_and => A(4),B_and => B(2),Y_and => SS_B_fa1(4));
	AND_5_B_fa1: and00 port map(A_and => A(5),B_and => B(2),Y_and => SS_B_fa1(5));
	AND_6_B_fa1: and00 port map(A_and => A(6),B_and => B(2),Y_and => SS_B_fa1(6));
	AND_7_B_fa1: and00 port map(A_and => A(7),B_and => B(2),Y_and => SS_B_fa1(7));	
	
	--cuarto recorrido multiplicando B(3) con el vector A  
	AND_0_B_fa2: and00 port map(A_and => A(0),B_and => B(3),Y_and => SS_B_fa2(0));
	AND_1_B_fa2: and00 port map(A_and => A(1),B_and => B(3),Y_and => SS_B_fa2(1));
	AND_2_B_fa2: and00 port map(A_and => A(2),B_and => B(3),Y_and => SS_B_fa2(2));
	AND_3_B_fa2: and00 port map(A_and => A(3),B_and => B(3),Y_and => SS_B_fa2(3));
	AND_4_B_fa2: and00 port map(A_and => A(4),B_and => B(3),Y_and => SS_B_fa2(4));
	AND_5_B_fa2: and00 port map(A_and => A(5),B_and => B(3),Y_and => SS_B_fa2(5));
	AND_6_B_fa2: and00 port map(A_and => A(6),B_and => B(3),Y_and => SS_B_fa2(6));
	AND_7_B_fa2: and00 port map(A_and => A(7),B_and => B(3),Y_and => SS_B_fa2(7));	
	
	--quinto recorrido multiplicando B(4) con el vector A  
	AND_0_B_fa3: and00 port map(A_and => A(0),B_and => B(4),Y_and => SS_B_fa3(0));
	AND_1_B_fa3: and00 port map(A_and => A(1),B_and => B(4),Y_and => SS_B_fa3(1));
	AND_2_B_fa3: and00 port map(A_and => A(2),B_and => B(4),Y_and => SS_B_fa3(2));
	AND_3_B_fa3: and00 port map(A_and => A(3),B_and => B(4),Y_and => SS_B_fa3(3));
	AND_4_B_fa3: and00 port map(A_and => A(4),B_and => B(4),Y_and => SS_B_fa3(4));
	AND_5_B_fa3: and00 port map(A_and => A(5),B_and => B(4),Y_and => SS_B_fa3(5));
	AND_6_B_fa3: and00 port map(A_and => A(6),B_and => B(4),Y_and => SS_B_fa3(6));
	AND_7_B_fa3: and00 port map(A_and => A(7),B_and => B(4),Y_and => SS_B_fa3(7));	
	
	--sexto recorrido multiplicando B(5) con el vector A  
	AND_0_B_fa4: and00 port map(A_and => A(0),B_and => B(5),Y_and => SS_B_fa4(0));
	AND_1_B_fa4: and00 port map(A_and => A(1),B_and => B(5),Y_and => SS_B_fa4(1));
	AND_2_B_fa4: and00 port map(A_and => A(2),B_and => B(5),Y_and => SS_B_fa4(2));
	AND_3_B_fa4: and00 port map(A_and => A(3),B_and => B(5),Y_and => SS_B_fa4(3));
	AND_4_B_fa4: and00 port map(A_and => A(4),B_and => B(5),Y_and => SS_B_fa4(4));
	AND_5_B_fa4: and00 port map(A_and => A(5),B_and => B(5),Y_and => SS_B_fa4(5));
	AND_6_B_fa4: and00 port map(A_and => A(6),B_and => B(5),Y_and => SS_B_fa4(6));
	AND_7_B_fa4: and00 port map(A_and => A(7),B_and => B(5),Y_and => SS_B_fa4(7));	
	
	--septimo recorrido multiplicando B(6) con el vector A  
	AND_0_B_fa5: and00 port map(A_and => A(0),B_and => B(6),Y_and => SS_B_fa5(0));
	AND_1_B_fa5: and00 port map(A_and => A(1),B_and => B(6),Y_and => SS_B_fa5(1));
	AND_2_B_fa5: and00 port map(A_and => A(2),B_and => B(6),Y_and => SS_B_fa5(2));
	AND_3_B_fa5: and00 port map(A_and => A(3),B_and => B(6),Y_and => SS_B_fa5(3));
	AND_4_B_fa5: and00 port map(A_and => A(4),B_and => B(6),Y_and => SS_B_fa5(4));
	AND_5_B_fa5: and00 port map(A_and => A(5),B_and => B(6),Y_and => SS_B_fa5(5));
	AND_6_B_fa5: and00 port map(A_and => A(6),B_and => B(6),Y_and => SS_B_fa5(6));
	AND_7_B_fa5: and00 port map(A_and => A(7),B_and => B(6),Y_and => SS_B_fa5(7));	
	
	--octavo recorrido multiplicando B(7) con el vector A  
	AND_0_B_fa6: and00 port map(A_and => A(0),B_and => B(7),Y_and => SS_B_fa6(0));
	AND_1_B_fa6: and00 port map(A_and => A(1),B_and => B(7),Y_and => SS_B_fa6(1));
	AND_2_B_fa6: and00 port map(A_and => A(2),B_and => B(7),Y_and => SS_B_fa6(2));
	AND_3_B_fa6: and00 port map(A_and => A(3),B_and => B(7),Y_and => SS_B_fa6(3));
	AND_4_B_fa6: and00 port map(A_and => A(4),B_and => B(7),Y_and => SS_B_fa6(4));
	AND_5_B_fa6: and00 port map(A_and => A(5),B_and => B(7),Y_and => SS_B_fa6(5));
	AND_6_B_fa6: and00 port map(A_and => A(6),B_and => B(7),Y_and => SS_B_fa6(6));
	AND_7_B_fa6: and00 port map(A_and => A(7),B_and => B(7),Y_and => SS_B_fa6(7));


	--SON 7 FILAS DE PUROS SUMADORES
	--primera fila 
	----	-	-	-	-	-	||-result de la AND,s-|-result de las AND's-|- resultado de fa0 --||------- zona de los acarreos------------||
	SUMADOR_0_fa0: fa00 port map(A_fa => SS_A_fa0(1),B_fa => SS_B_fa0(0),Suma_fa => SS_A_fa1(0),Cin_fa => '0'     ,Cout_fa => SS_C0(0)); --SS_A_fa1(0)=R(1)
	SUMADOR_1_fa0: fa00 port map(A_fa => SS_A_fa0(2),B_fa => SS_B_fa0(1),Suma_fa => SS_A_fa1(1),Cin_fa => SS_C0(0),Cout_fa => SS_C0(1));
	SUMADOR_2_fa0: fa00 port map(A_fa => SS_A_fa0(3),B_fa => SS_B_fa0(2),Suma_fa => SS_A_fa1(2),Cin_fa => SS_C0(1),Cout_fa => SS_C0(2));
	SUMADOR_3_fa0: fa00 port map(A_fa => SS_A_fa0(4),B_fa => SS_B_fa0(3),Suma_fa => SS_A_fa1(3),Cin_fa => SS_C0(2),Cout_fa => SS_C0(3));
	SUMADOR_4_fa0: fa00 port map(A_fa => SS_A_fa0(5),B_fa => SS_B_fa0(4),Suma_fa => SS_A_fa1(4),Cin_fa => SS_C0(3),Cout_fa => SS_C0(4));
	SUMADOR_5_fa0: fa00 port map(A_fa => SS_A_fa0(6),B_fa => SS_B_fa0(5),Suma_fa => SS_A_fa1(5),Cin_fa => SS_C0(4),Cout_fa => SS_C0(5));
	SUMADOR_6_fa0: fa00 port map(A_fa => SS_A_fa0(7),B_fa => SS_B_fa0(6),Suma_fa => SS_A_fa1(6),Cin_fa => SS_C0(5),Cout_fa => SS_C0(6));
	SUMADOR_7_fa0: fa00 port map(A_fa => '0'        ,B_fa => SS_B_fa0(7),Suma_fa => SS_A_fa1(7),Cin_fa => SS_C0(6),Cout_fa => SS_C0(7));
	
	--segunda fila 
	----	-	-	-	-	-	||-resultado de fa0 -|-result de las AND's-|- resultado de fa1 --||------- zona de los acarreos------------||
	SUMADOR_0_fa1: fa00 port map(A_fa => SS_A_fa1(1),B_fa => SS_B_fa1(0),Suma_fa => SS_A_fa2(0),Cin_fa => '0'     ,Cout_fa => SS_C1(0));--SS_A_fa2(0)=R(2)
	SUMADOR_1_fa1: fa00 port map(A_fa => SS_A_fa1(2),B_fa => SS_B_fa1(1),Suma_fa => SS_A_fa2(1),Cin_fa => SS_C1(0),Cout_fa => SS_C1(1));
	SUMADOR_2_fa1: fa00 port map(A_fa => SS_A_fa1(3),B_fa => SS_B_fa1(2),Suma_fa => SS_A_fa2(2),Cin_fa => SS_C1(1),Cout_fa => SS_C1(2));
	SUMADOR_3_fa1: fa00 port map(A_fa => SS_A_fa1(4),B_fa => SS_B_fa1(3),Suma_fa => SS_A_fa2(3),Cin_fa => SS_C1(2),Cout_fa => SS_C1(3));
	SUMADOR_4_fa1: fa00 port map(A_fa => SS_A_fa1(5),B_fa => SS_B_fa1(4),Suma_fa => SS_A_fa2(4),Cin_fa => SS_C1(3),Cout_fa => SS_C1(4));
	SUMADOR_5_fa1: fa00 port map(A_fa => SS_A_fa1(6),B_fa => SS_B_fa1(5),Suma_fa => SS_A_fa2(5),Cin_fa => SS_C1(4),Cout_fa => SS_C1(5));
	SUMADOR_6_fa1: fa00 port map(A_fa => SS_A_fa1(7),B_fa => SS_B_fa1(6),Suma_fa => SS_A_fa2(6),Cin_fa => SS_C1(5),Cout_fa => SS_C1(6));
	SUMADOR_7_fa1: fa00 port map(A_fa => SS_C0(7)   ,B_fa => SS_B_fa1(7),Suma_fa => SS_A_fa2(7),Cin_fa => SS_C1(6),Cout_fa => SS_C1(7));
	
	--tercera fila 
	----	-	-	-	-	-	||-resultado de fa1 -|-result de las AND's-|- resultado de fa2 --||------- zona de los acarreos------------||
	SUMADOR_0_fa2: fa00 port map(A_fa => SS_A_fa2(1),B_fa => SS_B_fa2(0),Suma_fa => SS_A_fa3(0),Cin_fa => '0'     ,Cout_fa => SS_C2(0));--SS_A_fa3(0)=R(3)
	SUMADOR_1_fa2: fa00 port map(A_fa => SS_A_fa2(2),B_fa => SS_B_fa2(1),Suma_fa => SS_A_fa3(1),Cin_fa => SS_C2(0),Cout_fa => SS_C2(1));
	SUMADOR_2_fa2: fa00 port map(A_fa => SS_A_fa2(3),B_fa => SS_B_fa2(2),Suma_fa => SS_A_fa3(2),Cin_fa => SS_C2(1),Cout_fa => SS_C2(2));
	SUMADOR_3_fa2: fa00 port map(A_fa => SS_A_fa2(4),B_fa => SS_B_fa2(3),Suma_fa => SS_A_fa3(3),Cin_fa => SS_C2(2),Cout_fa => SS_C2(3));
	SUMADOR_4_fa2: fa00 port map(A_fa => SS_A_fa2(5),B_fa => SS_B_fa2(4),Suma_fa => SS_A_fa3(4),Cin_fa => SS_C2(3),Cout_fa => SS_C2(4));
	SUMADOR_5_fa2: fa00 port map(A_fa => SS_A_fa2(6),B_fa => SS_B_fa2(5),Suma_fa => SS_A_fa3(5),Cin_fa => SS_C2(4),Cout_fa => SS_C2(5));
	SUMADOR_6_fa2: fa00 port map(A_fa => SS_A_fa2(7),B_fa => SS_B_fa2(6),Suma_fa => SS_A_fa3(6),Cin_fa => SS_C2(5),Cout_fa => SS_C2(6));
	SUMADOR_7_fa2: fa00 port map(A_fa => SS_C1(7)   ,B_fa => SS_B_fa2(7),Suma_fa => SS_A_fa3(7),Cin_fa => SS_C2(6),Cout_fa => SS_C2(7));
	
	--cuarta fila 
	----	-	-	-	-	-	||-resultado de fa2 -|-result de las AND's-|- resultado de fa3 --||------- zona de los acarreos------------||
	SUMADOR_0_fa3: fa00 port map(A_fa => SS_A_fa3(1),B_fa => SS_B_fa3(0),Suma_fa => SS_A_fa4(0),Cin_fa => '0'     ,Cout_fa => SS_C3(0));--SS_A_fa4(0)=R(4)
	SUMADOR_1_fa3: fa00 port map(A_fa => SS_A_fa3(2),B_fa => SS_B_fa3(1),Suma_fa => SS_A_fa4(1),Cin_fa => SS_C3(0),Cout_fa => SS_C3(1));
	SUMADOR_2_fa3: fa00 port map(A_fa => SS_A_fa3(3),B_fa => SS_B_fa3(2),Suma_fa => SS_A_fa4(2),Cin_fa => SS_C3(1),Cout_fa => SS_C3(2));
	SUMADOR_3_fa3: fa00 port map(A_fa => SS_A_fa3(4),B_fa => SS_B_fa3(3),Suma_fa => SS_A_fa4(3),Cin_fa => SS_C3(2),Cout_fa => SS_C3(3));
	SUMADOR_4_fa3: fa00 port map(A_fa => SS_A_fa3(5),B_fa => SS_B_fa3(4),Suma_fa => SS_A_fa4(4),Cin_fa => SS_C3(3),Cout_fa => SS_C3(4));
	SUMADOR_5_fa3: fa00 port map(A_fa => SS_A_fa3(6),B_fa => SS_B_fa3(5),Suma_fa => SS_A_fa4(5),Cin_fa => SS_C3(4),Cout_fa => SS_C3(5));
	SUMADOR_6_fa3: fa00 port map(A_fa => SS_A_fa3(7),B_fa => SS_B_fa3(6),Suma_fa => SS_A_fa4(6),Cin_fa => SS_C3(5),Cout_fa => SS_C3(6));
	SUMADOR_7_fa3: fa00 port map(A_fa => SS_C2(7)   ,B_fa => SS_B_fa3(7),Suma_fa => SS_A_fa4(7),Cin_fa => SS_C3(6),Cout_fa => SS_C3(7));
	
	--quinta fila 
	----	-	-	-	-	-	||-resultado de fa3 -|-result de las AND's-|- resultado de fa4 --||------- zona de los acarreos------------||
	SUMADOR_0_fa4: fa00 port map(A_fa => SS_A_fa4(1),B_fa => SS_B_fa4(0),Suma_fa => SS_A_fa5(0),Cin_fa => '0'     ,Cout_fa => SS_C4(0));--SS_A_fa5(0)=R(5)
	SUMADOR_1_fa4: fa00 port map(A_fa => SS_A_fa4(2),B_fa => SS_B_fa4(1),Suma_fa => SS_A_fa5(1),Cin_fa => SS_C4(0),Cout_fa => SS_C4(1));
	SUMADOR_2_fa4: fa00 port map(A_fa => SS_A_fa4(3),B_fa => SS_B_fa4(2),Suma_fa => SS_A_fa5(2),Cin_fa => SS_C4(1),Cout_fa => SS_C4(2));
	SUMADOR_3_fa4: fa00 port map(A_fa => SS_A_fa4(4),B_fa => SS_B_fa4(3),Suma_fa => SS_A_fa5(3),Cin_fa => SS_C4(2),Cout_fa => SS_C4(3));
	SUMADOR_4_fa4: fa00 port map(A_fa => SS_A_fa4(5),B_fa => SS_B_fa4(4),Suma_fa => SS_A_fa5(4),Cin_fa => SS_C4(3),Cout_fa => SS_C4(4));
	SUMADOR_5_fa4: fa00 port map(A_fa => SS_A_fa4(6),B_fa => SS_B_fa4(5),Suma_fa => SS_A_fa5(5),Cin_fa => SS_C4(4),Cout_fa => SS_C4(5));
	SUMADOR_6_fa4: fa00 port map(A_fa => SS_A_fa4(7),B_fa => SS_B_fa4(6),Suma_fa => SS_A_fa5(6),Cin_fa => SS_C4(5),Cout_fa => SS_C4(6));
	SUMADOR_7_fa4: fa00 port map(A_fa => SS_C3(7)   ,B_fa => SS_B_fa4(7),Suma_fa => SS_A_fa5(7),Cin_fa => SS_C4(6),Cout_fa => SS_C4(7));
	
	--sexta fila 
	----	-	-	-	-	-	||-resultado de fa4 -|-result de las AND's-|- resultado de fa5 --||------- zona de los acarreos------------||
	SUMADOR_0_fa5: fa00 port map(A_fa => SS_A_fa5(1),B_fa => SS_B_fa5(0),Suma_fa => SS_A_fa6(0),Cin_fa => '0'     ,Cout_fa => SS_C5(0));--SS_A_fa6(0)=R(6)
	SUMADOR_1_fa5: fa00 port map(A_fa => SS_A_fa5(2),B_fa => SS_B_fa5(1),Suma_fa => SS_A_fa6(1),Cin_fa => SS_C5(0),Cout_fa => SS_C5(1));
	SUMADOR_2_fa5: fa00 port map(A_fa => SS_A_fa5(3),B_fa => SS_B_fa5(2),Suma_fa => SS_A_fa6(2),Cin_fa => SS_C5(1),Cout_fa => SS_C5(2));
	SUMADOR_3_fa5: fa00 port map(A_fa => SS_A_fa5(4),B_fa => SS_B_fa5(3),Suma_fa => SS_A_fa6(3),Cin_fa => SS_C5(2),Cout_fa => SS_C5(3));
	SUMADOR_4_fa5: fa00 port map(A_fa => SS_A_fa5(5),B_fa => SS_B_fa5(4),Suma_fa => SS_A_fa6(4),Cin_fa => SS_C5(3),Cout_fa => SS_C5(4));
	SUMADOR_5_fa5: fa00 port map(A_fa => SS_A_fa5(6),B_fa => SS_B_fa5(5),Suma_fa => SS_A_fa6(5),Cin_fa => SS_C5(4),Cout_fa => SS_C5(5));
	SUMADOR_6_fa5: fa00 port map(A_fa => SS_A_fa5(7),B_fa => SS_B_fa5(6),Suma_fa => SS_A_fa6(6),Cin_fa => SS_C5(5),Cout_fa => SS_C5(6));
	SUMADOR_7_fa5: fa00 port map(A_fa => SS_C4(7)   ,B_fa => SS_B_fa5(7),Suma_fa => SS_A_fa6(7),Cin_fa => SS_C5(6),Cout_fa => SS_C5(7));
	
	--septima fila 
	----	-	-	-	-	-	||-resultado de fa5 -|-result de las AND's-|- resultado de fa6 --||------- zona de los acarreos------------||
	SUMADOR_0_fa6: fa00 port map(A_fa => SS_A_fa6(1),B_fa => SS_B_fa6(0),Suma_fa => R(07),Cin_fa => '0'     ,Cout_fa => SS_C6(0));
	SUMADOR_1_fa6: fa00 port map(A_fa => SS_A_fa6(2),B_fa => SS_B_fa6(1),Suma_fa => R(08),Cin_fa => SS_C6(0),Cout_fa => SS_C6(1));
	SUMADOR_2_fa6: fa00 port map(A_fa => SS_A_fa6(3),B_fa => SS_B_fa6(2),Suma_fa => R(09),Cin_fa => SS_C6(1),Cout_fa => SS_C6(2));
	SUMADOR_3_fa6: fa00 port map(A_fa => SS_A_fa6(4),B_fa => SS_B_fa6(3),Suma_fa => R(10),Cin_fa => SS_C6(2),Cout_fa => SS_C6(3));
	SUMADOR_4_fa6: fa00 port map(A_fa => SS_A_fa6(5),B_fa => SS_B_fa6(4),Suma_fa => R(11),Cin_fa => SS_C6(3),Cout_fa => SS_C6(4));
	SUMADOR_5_fa6: fa00 port map(A_fa => SS_A_fa6(6),B_fa => SS_B_fa6(5),Suma_fa => R(12),Cin_fa => SS_C6(4),Cout_fa => SS_C6(5));
	SUMADOR_6_fa6: fa00 port map(A_fa => SS_A_fa6(7),B_fa => SS_B_fa6(6),Suma_fa => R(13),Cin_fa => SS_C6(5),Cout_fa => SS_C6(6));
	SUMADOR_7_fa6: fa00 port map(A_fa => SS_C5(7)   ,B_fa => SS_B_fa6(7),Suma_fa => R(14),Cin_fa => SS_C6(6),Cout_fa => R(15));					
	
end mult8bit0;