library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shiftrRL00 is
	port(clks: in std_logic;  --Entrada de se?al de reloj
		ens: in std_logic;		--Se?al de carga del vector (LOAD)
		ins: in std_logic_vector(7 downto 0); --Vector de entrada a desplazar 
		outs: out std_logic_vector(7 downto 0)); --Vista general del registro
end shiftrRL00;
--Desplazamiento Rotacional de (R)Derecha a (L)Izquierda <----
architecture shiftrRL0 of shiftrRL00 is
signal sshift : std_logic_vector(7 downto 0);  --buffer 
begin
	pshift: process(clks)
	begin
		if (clks'event and clks='1') then  --deteccion del flanco de subida
			case ens is  
				when '0' =>
						sshift <= ins;
						outs <= (others => '0');--todos los elementos std_logic del vector se establecen en '0'
				when '1' =>
						sshift (0) <= sshift (7);
						sshift (7 downto 1) <= sshift(6 downto 0);
						outs <= sshift;
				when others => null;
			end case;
		end if;
	end process;

end shiftrRL0;