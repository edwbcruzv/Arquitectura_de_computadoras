library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use package_alu_00.all;

entity alu00 is 
	port(
		clk_00:out std_logic;
		enable_00:in std_logic;
		funct_00: in std_logic_vector(5 downto 0);
		DATA_A_00: in std_logic_vector(7 downto 0);
		DATA_B_00: in std_logic_vector(7 downto 0);
		out_AC_8_00:out std_logic_vector(7 downto 0);
		out_flag_00:out std_logic);
	
end alu00;

architecture alu0 of alu00 is
signal S_CLK: std_logic; --señal entra a todas las compuertas
signal S_out_flags_comp: std_logic; --sale de todas las compuertas hacia ac (acomulador)
signal S_out_Flag_AC: std_logic;--sale del ac hacia todas las compuertas
signal S_in_AC: std_logic_vector(7 downto 0); --salida de las operaciones de todas las compuertas hacia ac (acomulador)

begin
	clk_00 <= S_CLK;
	out_flag_00 <= S_out_Flag_AC;
	F_osc: osc00 port map(div_osc => "10000",clk_osc => S_CLK);

	F_not: not_alu_00 port map(
			clk_not => S_CLK,
			funct => funct_00,
			in_data_A => DATA_A_00,
			in_flag => S_out_Flag_AC,
			out_data_C => S_in_AC,
			out_flag => S_out_flags_comp);
	
	F_and: and_alu_00 port map(
			clk_and => S_CLK,
			funct => funct_00,
			in_data_A => DATA_A_00,
			in_data_B => DATA_B_00,
			in_flag => S_out_Flag_AC,
			out_data_C => S_in_AC,
			out_flag => S_out_flags_comp);
			
	F_or: or_alu_00 port map(
			clk_or => S_CLK,
			funct => funct_00,
			in_data_A => DATA_A_00,
			in_data_B => DATA_B_00,
			in_flag => S_out_Flag_AC,
			out_data_C => S_in_AC,
			out_flag => S_out_flags_comp);

	F_nand: nand_alu_00 port map(
			clk_nand => S_CLK,
			funct => funct_00,
			in_data_A => DATA_A_00,
			in_data_B => DATA_B_00,
			in_flag => S_out_Flag_AC,
			out_data_C => S_in_AC,
			out_flag => S_out_flags_comp);
			
	F_nor: nor_alu_00 port map(
			clk_nor => S_CLK,
			funct => funct_00,
			in_data_A => DATA_A_00,
			in_data_B => DATA_B_00,
			in_flag => S_out_Flag_AC,
			out_data_C => S_in_AC,
			out_flag => S_out_flags_comp);
			
	F_xor: xor_alu_00 port map(
			clk_xor => S_CLK,
			funct => funct_00,
			in_data_A => DATA_A_00,
			in_data_B => DATA_B_00,
			in_flag => S_out_Flag_AC,
			out_data_C => S_in_AC,
			out_flag => S_out_flags_comp);
			
	F_xonr: xnor_alu_00 port map(
			clk_xnor => S_CLK,
			funct => funct_00,
			in_data_A => DATA_A_00,
			in_data_B => DATA_B_00,
			in_flag => S_out_Flag_AC,
			out_data_C => S_in_AC,
			out_flag => S_out_flags_comp);
			
	F_AC: ac_alu_00 port map(
			clk_ac => S_CLK,
			en => enable_00,
			in_ac => S_in_AC,
			in_flag => S_out_flags_comp,
			out_ac => out_AC_8_00,
			out_flag => S_out_Flag_AC);
			
end alu0;