library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity barrelLR00 is 
	port(clkb: in std_logic;  --Entrada de señal de reloj
		enb: in std_logic;		--Señal de carga del vector (LOAD)
		controlb: in std_logic_vector(2 downto 0);-- control de desplazamiento, indicaremos el numero de posiciones a desplazar
		inb: in std_logic_vector(7 downto 0); --Vector de entrada a desplazar 
		outb: out std_logic_vector(7 downto 0)); --Vista general del registro
 
 end barrelLR00;
 --Desplazamiento de (R)Derecha a (L)Izquierda <----
 architecture barrelLR0 of barrelLR00 is
 signal S_barrel: std_logic_vector(7 downto 0);  --buffer 
 signal S_cont: std_logic_vector(3 downto 0); --contador
 begin
	
	pbarrel: process(clkb)
	begin
		if (clkb'event and clkb='1') then  --deteccion del flanco de subida
			case enb is  
				when '0' =>
						S_barrel <= inb; --La entrada sera igual al buffer
						outb <= (others => '0'); --todos los elementos std_logic del vector se establecen en '0'.
						S_cont <= (others => '0');--iniciando contador con cero
				when '1' =>
					if(S_cont <= controlb) then-- 0=muestra, 1=un despl, 2=dos despl,...7=siete despl.
						S_cont <= S_cont+'1';--incrementando contador despues de la instruccion
						S_barrel (7 downto 1) <= S_barrel(6 downto 0);
						S_barrel (0) <= '0';
						outb <= S_barrel;
					else
						S_cont <= S_cont;
					end if;
				when others => null;
			end case;
		end if;
	end process;
 end barrelLR0;
 