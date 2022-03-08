library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagebarrelLR00 is

	component osc00
		port(div_osc :in std_logic_vector(4 downto 0);
		clk_osc:inout std_logic);
	end component;

	component barrelLR00
		port(clkb: in std_logic;  --Entrada de señal de reloj
			enb: in std_logic;		--Señal de carga del vector (LOAD)
			controlb: in std_logic_vector(2 downto 0);-- control de desplazamiento, indicaremos el numero de posiciones a desplazar
			inb: in std_logic_vector(7 downto 0); --Vector de entrada a desplazar 
			outb: out std_logic_vector(7 downto 0)); --Vista general del registro
		end component;

end packagebarrelLR00;