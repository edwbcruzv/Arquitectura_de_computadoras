library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package package_alu_00 is

	component osc00
			port(div_osc :in std_logic_vector(4 downto 0);
				clk_osc:inout std_logic);
	end component;

	component not_alu_00
		port(
			clk_not: in std_logic;
			funct: in std_logic_vector(5 downto 0);
			in_data_A: in std_logic_vector(7 downto 0);
			in_flag: in std_logic;
			out_data_C: out std_logic_vector(7 downto 0);
			out_flag: out std_logic);
	end component;
	 
	component and_alu_00
		port(
			clk_and: in std_logic;
			funct: in std_logic_vector(5 downto 0);
			in_data_A: in std_logic_vector(7 downto 0);
			in_data_B: in std_logic_vector(7 downto 0);
			in_flag: in std_logic;
			out_data_C: out std_logic_vector(7 downto 0);
			out_flag: out std_logic);
	end component;
	 
	component or_alu_00
		port(
			clk_or: in std_logic;
			funct: in std_logic_vector(5 downto 0);
			in_data_A: in std_logic_vector(7 downto 0);
			in_data_B: in std_logic_vector(7 downto 0);
			in_flag: in std_logic;
			out_data_C: out std_logic_vector(7 downto 0);
			out_flag: out std_logic);
	end component;
	 
	component nand_alu_00
		port(
			clk_nand: in std_logic;
			funct: in std_logic_vector(5 downto 0);
			in_data_A: in std_logic_vector(7 downto 0);
			in_data_B: in std_logic_vector(7 downto 0);
			in_flag: in std_logic;
			out_data_C: out std_logic_vector(7 downto 0);
			out_flag: out std_logic);
	end component;
	 
	component nor_alu_00
		port(
			clk_nor: in std_logic;
			funct: in std_logic_vector(5 downto 0);
			in_data_A: in std_logic_vector(7 downto 0);
			in_data_B: in std_logic_vector(7 downto 0);
			in_flag: in std_logic;
			out_data_C: out std_logic_vector(7 downto 0);
			out_flag: out std_logic);
	end component;
	 
	component xor_alu_00
		port(
			clk_xor: in std_logic;
			funct: in std_logic_vector(5 downto 0);
			in_data_A: in std_logic_vector(7 downto 0);
			in_data_B: in std_logic_vector(7 downto 0);
			in_flag: in std_logic;
			out_data_C: out std_logic_vector(7 downto 0);
			out_flag: out std_logic);
	end component;
	 
	component xnor_alu_00
		port(
			clk_xnor: in std_logic;
			funct: in std_logic_vector(5 downto 0);
			in_data_A: in std_logic_vector(7 downto 0);
			in_data_B: in std_logic_vector(7 downto 0);
			in_flag: in std_logic;
			out_data_C: out std_logic_vector(7 downto 0);
			out_flag: out std_logic);
	end component;
	 
	component ac_alu_00
		port(
			clk_ac: in std_logic;
			en: in std_logic;
			in_ac:in std_logic_vector(7 downto 0);
			in_flag: in std_logic;
			out_ac: out std_logic_vector(7 downto 0);
			out_flag: out std_logic);
	end component;



end package_alu_00;