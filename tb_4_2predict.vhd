library IEEE;
use IEEE.numeric_bit.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity tb_4_2predict is
end tb_4_2predict;

architecture test1 of tb_4_2predict is 
	
	component predict4_2
		port(   clr, Clk: in std_logic; 
             		action: in std_logic;
			branch_h: out std_logic_vector(3 downto 0);
			predict_1: out std_logic_vector(1 downto 0);
                	predict_2: out std_logic_vector(1 downto 0);
			predict_3: out std_logic_vector(1 downto 0);
			predict_4: out std_logic_vector(1 downto 0);
			predict_5: out std_logic_vector(1 downto 0);
			predict_6: out std_logic_vector(1 downto 0);
			predict_7: out std_logic_vector(1 downto 0);
			predict_8: out std_logic_vector(1 downto 0);
			predict_9: out std_logic_vector(1 downto 0);
			predict_10: out std_logic_vector(1 downto 0);
			predict_11: out std_logic_vector(1 downto 0);
			predict_12: out std_logic_vector(1 downto 0);
			predict_13: out std_logic_vector(1 downto 0);
			predict_14: out std_logic_vector(1 downto 0);
			predict_15: out std_logic_vector(1 downto 0);
			predict_16: out std_logic_vector(1 downto 0);
			miss: out integer);
	end component; 

file file_VECTORS : text;

signal r_clk : std_logic :='0';
signal r_clr : std_logic :='0';
signal r_action : std_logic;
signal r_branch_h: std_logic_vector(3 downto 0) :="0000"; 
signal r_predict1 : std_logic_vector(1 downto 0) :="00";
signal r_predict2 : std_logic_vector(1 downto 0) :="00";
signal r_predict3 : std_logic_vector(1 downto 0) :="00";
signal r_predict4 : std_logic_vector(1 downto 0) :="00";
signal r_predict5 : std_logic_vector(1 downto 0) :="00";
signal r_predict6 : std_logic_vector(1 downto 0) :="00";
signal r_predict7 : std_logic_vector(1 downto 0) :="00";
signal r_predict8 : std_logic_vector(1 downto 0) :="00";
signal r_predict9 : std_logic_vector(1 downto 0) :="00";
signal r_predict10 : std_logic_vector(1 downto 0) :="00";
signal r_predict11 : std_logic_vector(1 downto 0) :="00";
signal r_predict12 : std_logic_vector(1 downto 0) :="00";
signal r_predict13 : std_logic_vector(1 downto 0) :="00";
signal r_predict14 : std_logic_vector(1 downto 0) :="00";
signal r_predict15 : std_logic_vector(1 downto 0) :="00";
signal r_predict16 : std_logic_vector(1 downto 0) :="00";
signal r_miss : integer :=0 ;

constant MEMSIZE: integer := 6000;
type a_array is array(0 to MEMSIZE) of std_logic;

signal act: a_array;

constant clk_period: time := 100 ns; 

begin

	bit_p : predict4_2 port map (  
			clr => r_clr,
			clk => r_clk,
			action => r_action,
			branch_h => r_branch_h,
			predict_1 => r_predict1,
			predict_2 => r_predict2,
			predict_3 => r_predict3,
			predict_4 => r_predict4,
			predict_5 => r_predict5,
			predict_6 => r_predict6,
			predict_7 => r_predict7,
			predict_8 => r_predict8,
			predict_9 => r_predict9,
			predict_10 => r_predict10,
			predict_11 => r_predict11,
			predict_12 => r_predict12,
			predict_13 => r_predict13,
			predict_14 => r_predict14,
			predict_15 => r_predict15,
			predict_16 => r_predict16,
			miss => r_miss);
			


clock_process: process
begin
	r_clk <= '0';
	wait for clk_period/2;  
	r_clk <='1';
	wait for clk_period/2;
end process; 

stimulus_process: process  
	variable v_Iline : line;
	variable v_action: std_logic;
	variable i: integer;
begin
	i := 0;
	file_open(file_VECTORS, "CorrelatorPredictorInputsNumOnly.txt", read_mode);

	while not endfile(file_VECTORS) loop
		readline(file_VECTORS, v_Iline);
		read(v_Iline, v_action);

		act(i) <= v_action;
		i := i + 1;						

	end loop; 
	file_close(file_VECTORS);
	wait;
	end process;


	process(r_clk)
		variable i: integer range 0 to act'HIGH := 0;  
	begin
			
			if(r_clk'event and r_clk = '1') then
				 
					r_action <= act(i);
					i := i + 1;

			end if;			
	end process;
	 
end test1;