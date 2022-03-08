library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity oscint00 is
	port(osc_int :out std_logic);
end oscint00;

architecture oscint0 of oscint00 is
--declarando el oscilador ya existende respecto a la documentacion de lattice
-- se puede usar en un package aparte o antes del begin
	COMPONENT OSCH --nombre del componente
		GENERIC  (NOM_FREQ: string := "2.08");
		PORT (STDBY:IN std_logic;
				OSC:OUT std_logic);
				--SEDSTDBY:OUT std_logic); --no se va a usar esta salida
	END COMPONENT;     

	attribute NOM_FREQ : string;    
	attribute NOM_FREQ of OSCinst0 : label is "2.08"; --valor para la oscilacion
	
begin
	--invocacion del OSC
	OSCInst0: OSCH GENERIC MAP( NOM_FREQ  => "2.08" ) --directiva de que frecuencia solicitamos
					--eclarando conexiones internas
					PORT MAP (STDBY => '0', -- 0  para encender el oscilador y 1 para apagar
							OSC =>  osc_int); -- salida de la señal del oscilador
							--SEDSTDBY => stdby_sed); --no se va a usar esta salida

end oscint0;