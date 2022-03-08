library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
--controla el llenado de la ram, controla cada digito que entra a la ram
entity contRead00 is
	port(
		clk_contRead :in std_logic; --entrada de reloj
		reset :in std_logic; --reset del contador
		rw :in std_logic; --rw del contador
		in_cont_write :in std_logic_vector(5 downto 0); --entrada de contador de escritura,servira como tope de control de escritura
		out_contRead :inout std_logic_vector(5 downto 0));--salida de contador de escritura

end contRead00;

architecture contRead0 of contRead00 is
signal S_control:std_logic_vector(1 downto 0);--control
--	  reset		wr
--		0		0	inicializa
--		0		1	inicializa
--		1		0	write
--		1		1	read
begin

	S_control <= (reset)&(rw);--concatenacion de valores
	
	process(clk_contRead)
	begin
		if(clk_contRead'event and clk_contRead='1') then
			case S_control is
				when "00" => --inicializacion
					out_contRead <= "000000";
				when "01" => --inicializacion
					out_contRead <= "000000";
				when "10" => --escritura
					out_contRead <= "000000";
				when "11" => --lectura
					--se inicia el contador y se termina hasta donde indiquemos
					if (out_contRead < in_cont_write ) then
						out_contRead <= out_contRead +'1';
					else
						out_contRead <= out_contRead;
					end if;
				when others => null;
			end case;	
		end if;
	
	end process;

end contRead0;