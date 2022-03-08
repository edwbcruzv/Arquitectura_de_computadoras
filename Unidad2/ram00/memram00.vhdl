library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;


entity memram00 is 
	port(
		clk_memram:in std_logic; --entrada de reloj
		reset:in std_logic; --reset de la ram
		rw:in std_logic;	--rw de la ram
		in_flag:in std_logic; --entrada de bandera, activacion de la ram
		in_word:in std_logic_vector(7 downto 0); --entrada del codigo de display del numero, este se almacena
		in_cont_write:in std_logic_vector(5 downto 0); --entrada de contador de escritura
		in_cont_read:in std_logic_vector(5 downto 0); --entrada de contador de rectura
		out_word:out std_logic_vector(7 downto 0)); --salida de de lectura,sale el codigo del display del numero

end memram00;


architecture memram0 of memram00 is
--reservando memoria de almacenamiento, aqui se guarda nuestra informacion que capturamos
--se guarda el codigo del display de un numero
type arrayram is array(0 to 63) of std_logic_vector(7 downto 0);
signal S_word : arrayram:=(others => "11111111");--Conectamos la reserva con una se�al y poderla usar,ya esta inicializada
---------------------------------------------------------------------
signal S_control: std_logic_vector(1 downto 0); -- vector de control
begin

	S_control <= (reset)&(rw);-- concatenacion de valores

	process(clk_memram)
	begin
		if (clk_memram'event and clk_memram='1') then
			case S_control is
				when "00" =>  --inicializa
					out_word <= "11111111"; --salida apagada
				when "01" =>  --inicializa
					out_word <= "11111111"; --salida apagada
				when "10" =>  --escribe
				if (in_flag='1') then --se activa la bandera al presionar una tecla en el teclado
					--se almacena en memoria el codigo del display del numero del control de escritura que entra
					--el subindice de s_word es el mismo numero de control que entra
					S_word(conv_integer(in_cont_write)) <= in_word;
				end if;
				when "11" => --leer
					--el mismo numero de control de lectura que se solicita se almacena 
					--en el subindice del w_word
					out_word <= S_word(conv_integer(in_cont_read));-- la salida sera el codigo de display
				when others => null;
			end case;
		end if;
	end process;

end memram0;