library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
--Coder del teclado matricial
entity coder00 is
	port(clk_coder:in std_logic; --entrada de se�al de reloj
		reset:in std_logic; --reset de la matriz
		rw:in std_logic;	--rw de la matriz
		in_key: in std_logic_vector(3 downto 0); --Entrada del contador de anillo, nos indica el turno de la fila
		out_key: inout std_logic_vector(3 downto 0); --Salida hacia el teclado matricial, indica el turno de la columna
		out_word: inout std_logic_vector(7 downto 0); --Salida a los display de 7 segmentos y 4 digitos
		out_cont_write:inout std_logic_vector(5 downto 0); --contador de escritura, le dira a contRead que tecla se pulsa
		out_flag:out std_logic);--bandera  de control, cada que se pulse un boton se activa y a su vez activa a la RAM
end coder00;

architecture coder0 of coder00 is
signal S_control: std_logic_vector(1 downto 0);--se�al de control
begin
--				in_key					  reset	    rw
--				(3)(2)(1)(0)				0		0 	inicializa
--			(0)	 7  8  9  /					0		1 	inicializa
--  out_key	(1)	 4  5  6  *					1		0 	write
--			(2)	 1  2  3  - 				1		1 	read
--			(3)	 0  c  =  +

	S_control <= (reset) & (rw); --concatenacion de valores
	
	P00:process(clk_coder,in_key,out_key)
	variable auxF:bit:='0'; --ningun boton activo
	variable auxC1,auxC2,auxC3,auxC4:bit:='1'; --ningun boton activo
	begin
		
		if(clk_coder'event and clk_coder='1') then

            --***************INICIO DE reset rw ******************
			case S_control is
				when "00" => --inicializa
					out_word <= "11111111";
					out_cont_write <="000000";
					out_flag <= '0';
				when "01" => --inicializa
					out_word <= "11111111";
					out_cont_write <="000000";
					out_flag <= '0';
				when "10" => --escritura
				--*******************INICIO TECLADO*****************

                        case out_key is
                        
                            when "0001" => 
                                if auxC1 = '1' then
                                    case in_key is 
                                    
                                        when "0000" =>
                                            auxF:='0';
											auxC2:='1';auxC3:='1';auxC4:='1'; --se deshabilitan las fila
                                        when "1000" =>
                                            if auxF='0' then
                                                auxF:='1';	
                                                out_word <= "00011111";-- 7
                                                auxC2:='0';auxC3:='0';auxC4:='0'; --se deshabilitan las fila
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                            
                                        when "0100" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "00000001";-- 8
                                                auxC2:='0';auxC3:='0';auxC4:='0';--se deshabilitan las fila
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                            
                                        when "0010" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "00011001";-- 9
                                                auxC2:='0';auxC3:='0';auxC4:='0';--se deshabilitan las fila
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                       
                                        when "0001" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "00010001";-- A
                                                auxC2:='0';auxC3:='0';auxC4:='0';--se deshabilitan las fila
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when others =>
                                                out_word <= out_word;
                                    end case;
                                end if;	
                                
                            when "0010" =>
                                if auxC2 = '1' then
                                    case in_key is 
                                        
                                        when "0000" =>
                                            auxF:='0';
											auxC1:='1';auxC3:='1';auxC4:='1';--se deshabilitan las filas
                                        when "1000" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "10011001";-- 4
                                                auxC1:='0';auxC3:='0';auxC4:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when "0100" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "01001001";-- 5
                                                auxC1:='0';auxC3:='0';auxC4:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when "0010" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "01000001";-- 6
                                                auxC1:='0';auxC3:='0';auxC4:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when "0001" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "11000000";-- B
                                                auxC1:='0';auxC3:='0';auxC4:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when others =>
                                                out_word <= out_word;
                                    end case;
                                end if;
                            when "0100" => 
                                if auxC3 = '1' then
                                    case in_key is 
                                        
                                        when "0000" =>
                                            auxF:='0';
											auxC1:='1';auxC2:='1';auxC4:='1';--se deshabilitan las filas
                                        when "1000" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "10011111";-- 1
                                                auxC1:='0';auxC2:='0';auxC4:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when "0100" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "00100101";-- 2
                                                auxC1:='0';auxC2:='0';auxC4:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;	
                                        when "0010" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "00001101";-- 3
                                                auxC1:='0';auxC2:='0';auxC4:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when "0001" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "01100011";-- C
                                                auxC1:='0';auxC2:='0';auxC4:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when others =>
                                            out_word <= out_word ;
                                    end case;
                                end if;
                                
                            when "1000" =>
                                if auxC4 = '1' then	
                                    case in_key is 
                                        
                                        when "0000" =>
                                            auxF:='0';
											auxC1:='1';auxC2:='1';auxC3:='1';--se deshabilitan las filas
                                        when "1000" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "00000011";-- 0
                                                auxC1:='0';auxC2:='0';auxC3:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when "0100" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "00111000";-- +
                                                auxC1:='0';auxC2:='0';auxC3:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when "0010" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "11000100";-- -
                                                auxC1:='0';auxC2:='0';auxC3:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when "0001" =>
                                            if auxF='0' then
                                                auxF:='1';
                                                out_word <= "10000100";-- D
                                                auxC1:='0';auxC2:='0';auxC3:='0';--se deshabilitan las filas
                                                out_cont_write <= out_cont_write+'1';
                                                out_flag <= '1';
                                            else
                                                out_cont_write <= out_cont_write;
                                                out_flag <= '0';
                                            end if;
                                        when others =>
                                            out_word <= out_word;
                                    end case;
                                end if;
                                
                            when others =>null;
                        end case;
					when others =>null;
                 --- *******FINA DEL TECLADO*********                                   
            end case; -- Case S_control
		end if;
	end process;
end coder0;