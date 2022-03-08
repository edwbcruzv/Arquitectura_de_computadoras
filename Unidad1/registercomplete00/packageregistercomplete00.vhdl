library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;


package packageregistercomplete00 is

	component osc00
		port(div_osc :in std_logic_vector(4 downto 0);
			clk_osc:inout std_logic);
	end component;

	component registercomplete00
	port( Load,CLKin: in std_logic;
		selector: in std_logic_vector(2 downto 0); --seleccion para elegir el registro a trabajar
		position: in std_logic_vector(3 downto 0);
		Qin: in std_logic_vector(7 downto 0); --entrada de carga de datos
		Qout: out std_logic_vector(7 downto 0)); --entrada de salida de datos del registro
	end component;

end packageregistercomplete00;