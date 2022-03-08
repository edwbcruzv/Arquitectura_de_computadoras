library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;


entity registercomplete00 is
	port( Load,CLKin: in std_logic;
		selector: in std_logic_vector(2 downto 0); --seleccion para elegir el registro a trabajar
		position: in std_logic_vector(3 downto 0);
		Qin: in std_logic_vector(7 downto 0); --entrada de carga de datos
		Qout: out std_logic_vector(7 downto 0)); --entrada de salida de datos del registro
end registercomplete00;

architecture registercomplete0 of registercomplete00 is
signal S_vector: std_logic_vector(7 downto 0);--buffer
signal S_cont: std_logic_vector(4 downto 0); --contador
begin

	process(CLKin)
	begin
		if (CLKin'event and CLKin='1') then --flanco de subida
			
			case Load is --la carga sea activada
			
				when '0' =>
					S_vector <= Qin; --el vector de entrada con el buffer
					Qout <= (others => '0');--el vector de salida se deja en 0`s
					S_cont <= (others => '0'); --reiniciando contador
				when others =>
					case selector is
					---------------------------------REGISTROS----------------------------
						when "000" => --Desplazamiento de (R)Derecha a (L)Izquierda <----
								S_vector (7 downto 1) <= S_vector(6 downto 0);
								S_vector (0) <= '0';
								Qout <= S_vector;
						when "001" => --Desplazamiento de (L)Izquierda a (R)Derecha ---->
								S_vector (6 downto 0) <= S_vector(7 downto 1); 
								S_vector (7) <= '0';
								Qout <= S_vector;
						when "010" => --Desplazamiento Rotacional de (R)Derecha a (L)Izquierda <----
								S_vector (0) <= S_vector (7);
								S_vector (7 downto 1) <= S_vector(6 downto 0);
								Qout <= S_vector;
						when "011" => --Desplazamiento Rotacional de (L)Izquierda a (R)Derecha ---->
								S_vector (7) <= S_vector(0);
								S_vector (6 downto 0) <= S_vector(7 downto 1); 
								Qout <= S_vector;
								
					----------------------------------BARREL------------------------------------
						when"100" => --Desplazamiento de (R)Derecha a (L)Izquierda <----
							if(S_cont < position) then
								S_cont <= S_cont+'1';--incrementando contador despues de la instruccion
								S_vector (7 downto 1) <= S_vector(6 downto 0);
								S_vector (0) <= '0';
								Qout <= S_vector;
							else
								Qout <= S_vector;
								S_cont <= S_cont;
							end if;
						when "101" => --Desplazamiento de (L)Izquierda a (R)Derecha ---->
							if(S_cont < position) then
								S_cont <= S_cont+'1';--incrementando contador despues de la instruccion
								S_vector (6 downto 0) <= S_vector(7 downto 1);
								S_vector (7) <= '0';
								Qout <= S_vector;
							else
								Qout <= S_vector;
								S_cont <= S_cont;
							end if;
						when "110" => --Desplazamiento Rotacional de (R)Derecha a (L)Izquierda <----
							if(S_cont < position) then-- 0=muestra, 1=un despl, 2=dos despl,...7=siete despl.
								S_cont <= S_cont+'1';--incrementando contador despues de la instruccion
								S_vector (0) <= S_vector(7);
								S_vector (7 downto 1) <= S_vector(6 downto 0);
								Qout <= S_vector;
							else
								Qout <= S_vector;
								S_cont <= S_cont;
							end if;
						when "111" =>--Desplazamiento Rotacional de (L)Izquierda a (R)Derecha ---->
							if(S_cont < position) then-- 0=muestra, 1=un despl, 2=dos despl,...7=siete despl.
								S_cont <= S_cont+'1';--incrementando contador despues de la instruccion
								S_vector (7) <= S_vector(0);
								S_vector (6 downto 0) <= S_vector(7 downto 1); 
								Qout <= S_vector;
							else
								Qout <= S_vector;
								S_cont <= S_cont;
							end if;
						when others => null;
						
					end case;
			end case;
		end if;
	end process;
	


end registercomplete0;