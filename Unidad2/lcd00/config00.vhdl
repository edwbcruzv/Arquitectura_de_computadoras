library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;


entity config00 is
port(clk_config: in std_logic;
	reset: in std_logic;
	in_flag: in std_logic;
	in_cont: in std_logic_vector(4 downto 0);
	out_data: out std_logic_vector(7 downto 0); --Datos para el LCD D0-D7
	out_EN: out std_logic;
	out_RW: out std_logic;
	out_RS: out std_logic;
	out_flag: out std_logic);

end config00;

architecture config0 of config00 is 
signal S_control : std_logic_vector(1 downto 0):="00";
begin
	S_control <= (reset)&(in_flag);

	process(clk_config)
	begin
		if(clk_config'event and clk_config='1') then
			case S_control is
				when "00"=>
					out_data <= (others => '0');
					out_EN <= '0';
					out_RW <= '0';
					out_RS <= '0';
					out_flag <= '0';
				when "11"=>
					case in_cont is
						when "00001" => --en base al diagrama de tiempos
							out_data <= "00000001"; --limpiar pantalla
							out_EN <= '1'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "00010" => --en base al diagrama de tiempos
							out_data <= "00000001"; --limpiar pantalla
							out_EN <= '0'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "00011" =>------------------------------------------------
							out_data <= "00000010"; --regresa el cursor
							out_EN <= '1'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "00100" =>
							out_data <= "00000010"; --regrea el cursior
							out_EN <= '0'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "00101" =>------------------------------------------------
							out_data <= "00000110"; --seleccion de modo
							out_EN <= '1'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "00110" =>
							out_data <= "00000110"; --seleccion de modo
							out_EN <= '0'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "00111" =>------------------------------------------------
							out_data <= "00001111"; --encendido/apagado de pantalla
							out_EN <= '1'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "01000" =>
							out_data <= "00001111"; --encendido/apagado de pantalla
							out_EN <= '0'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "01001" =>------------------------------------------------
							out_data <= "00011100"; --desplazar cursor/pantalla
							out_EN <= '1'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "01010" =>
							out_data <= "00011100"; --desplazar cursor/pantalla
							out_EN <= '0'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "01011" =>------------------------------------------------
							out_data <= "00111100"; -- activar funcion
							out_EN <= '1'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "01100" =>
							out_data <= "00111100"; -- activar funcion
							out_EN <= '0'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "01101" =>------------------------------------------------
							out_data <= "00111100"; -- activar funcion
							out_EN <= '1'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '0';
						when "01110" =>
							out_data <= "00111100"; -- activar funcion
							out_EN <= '0'; --segun diagrama de tiempos
							out_RW <= '0';
							out_RS <= '0'; 
							out_flag <= '1';
						
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process;

end config0;