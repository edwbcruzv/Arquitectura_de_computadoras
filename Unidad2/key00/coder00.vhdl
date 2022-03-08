library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(clk_cod:in std_logic; 
		in_key_cod: in std_logic_vector(3 downto 0); --turnos de cada fila del teclado
		out_key_cod: in std_logic_vector(3 downto 0); --turnos de cada columna del teclado
		out_coder: inout std_logic_vector(7 downto 0)); --salida a los display de 7 segmentos y 4 digitos
end coder00;

architecture coder0 of coder00 is
signal S_vector: std_logic_vector(3 downto 0);
begin
--				in_key
--				(3)(2)(1)(0)
--			(0)	 7  8  9  /
--  out_key	(1)	 4  5  6  *
--			(2)	 1  2  3  - 
--			(3)	 0  c  =  +
	
	
	
	P00:process(clk_cod,in_key_cod,S_vector)
	
	variable auxF:bit:='0'; --ningun boton activo
	variable auxC1,auxC2,auxC3,auxC4:bit:='1'; --ningun boton activo
	begin
		
		if(clk_cod'event and clk_cod='1') then
			case out_key_cod is
			
				when "0001" => 
					if auxC1 = '1' then
						case in_key_cod is 
						
							when "0000" =>
								if auxF='1' then
									auxF:='0';
									out_coder <= "11111111";
									auxC2:='1';auxC3:='1';auxC4:='1'; --se habilitan de nuevo las filas
									
								end if;
							when "1000" =>
								if auxF='0' then
									auxF:='1';	
									out_coder <= "00011111";-- 7
									auxC2:='0';auxC3:='0';auxC4:='0'; --se deshabilitan las fila
									
								end if;
							when "0100" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "00000001";-- 8
									auxC2:='0';auxC3:='0';auxC4:='0';--se deshabilitan las fila
									
								end if;
							when "0010" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "00011001";-- 9
									auxC2:='0';auxC3:='0';auxC4:='0';--se deshabilitan las fila
									
								end if;
							when "0001" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "00010001";-- A
									auxC2:='0';auxC3:='0';auxC4:='0';--se deshabilitan las fila
									
								end if;
							when others =>
									out_coder <= out_coder;
						end case;
					end if;	
					
				when "0010" =>
					if auxC2 = '1' then
						case in_key_cod is 
							
							when "0000" =>
								if auxF='1' then
									auxF:='0';
									out_coder <= "11111111";
									auxC1:='1';auxC3:='1';auxC4:='1'; --se habilitan de nuevo las filas
									
								end if;
							when "1000" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "10011001";-- 4
									auxC1:='0';auxC3:='0';auxC4:='0';--se deshabilitan las filas
									
								end if;
							when "0100" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "01001001";-- 5
									auxC1:='0';auxC3:='0';auxC4:='0';--se deshabilitan las filas
									
								end if;
							when "0010" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "01000001";-- 6
									auxC1:='0';auxC3:='0';auxC4:='0';--se deshabilitan las filas
									
								end if;
							when "0001" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "11000000";-- B
									auxC1:='0';auxC3:='0';auxC4:='0';--se deshabilitan las filas
									
								end if;
							when others =>
									out_coder <= out_coder;
						end case;
					end if;
				when "0100" => 
					if auxC3 = '1' then
						case in_key_cod is 
							
							when "0000" =>
								if auxF='1' then
									auxF:='0';
									out_coder <= "11111111";
									auxC1:='1';auxC2:='1';auxC4:='1'; --se habilitan de nuevo las filas
									
								end if;
							when "1000" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "10011111";-- 1
									auxC1:='0';auxC2:='0';auxC4:='0';--se deshabilitan las filas
									
								end if;
							when "0100" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "00100101";-- 2
									auxC1:='0';auxC2:='0';auxC4:='0';--se deshabilitan las filas
									
								end if;	
							when "0010" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "00001101";-- 3
									auxC1:='0';auxC2:='0';auxC4:='0';--se deshabilitan las filas
									
								end if;
							when "0001" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "01100011";-- C
									auxC1:='0';auxC2:='0';auxC4:='0';--se deshabilitan las filas
									
								end if;
							when others =>
								out_coder <= out_coder ;
						end case;
					end if;
					
				when "1000" =>
					if auxC4 = '1' then	
						case in_key_cod is 
							
							when "0000" =>
								if auxF='1' then
									auxF:='0';
									out_coder <= "11111111";
									auxC1:='1';auxC2:='1';auxC3:='1'; --se habilitan de nuevo las filas
									
								end if;				
							when "1000" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "00000011";-- 0
									auxC1:='0';auxC2:='0';auxC3:='0';--se deshabilitan las filas
									
								end if;
							when "0100" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "00111000";-- +
									auxC1:='0';auxC2:='0';auxC3:='0';--se deshabilitan las filas
									
								end if;
							when "0010" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "11000100";-- -
									auxC1:='0';auxC2:='0';auxC3:='0';--se deshabilitan las filas
									
								end if;
							when "0001" =>
								if auxF='0' then
									auxF:='1';
									out_coder <= "10000100";-- D
									auxC1:='0';auxC2:='0';auxC3:='0';--se deshabilitan las filas
									
								end if;
							when others =>
								out_coder <= out_coder;
						end case;
					end if;
					
				when others =>null;
			end case;
		end if;
	end process;
end coder0;