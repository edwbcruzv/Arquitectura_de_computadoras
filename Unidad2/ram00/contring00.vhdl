library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
---Contador de anillo del teclado matricial, no debe de haber traslape de botones
entity contring00 is
	port(
		clk_cr: in std_logic; --entrada de seal de reloj
		load: in std_logic; --activacion del contador
		out_contring: out std_logic_vector(3 downto 0)); --salida hacia la fila de la matriz en turno
end contring00;

architecture contring0 of contring00 is
signal S_vector: std_logic_vector(3 downto 0); 
begin

	cr:process(clk_cr)
	begin
		if (clk_cr'event and clk_cr='1') then
		out_contring <= "0000";
		S_vector <= "1000";
			case load is
				when '0' =>
					out_contring <= "0000";-- inicializacion de la salida
					S_vector <= "1000";-- inicializacion del contador
				when '1' => --corrimiento de la fila en turno
					S_vector(3) <= S_vector(0);
					S_vector(2 downto 0) <= S_vector(3 downto 1); 
					out_contring <= S_vector; --salida
				when others => null;
				
			end case;
		end if;
	end process;
end contring0;