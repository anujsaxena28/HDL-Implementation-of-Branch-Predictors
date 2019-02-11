library IEEE;
use IEEE.numeric_bit.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity tb_2bitpredict is
end tb_2bitpredict;

architecture test1 of tb_2bitpredict is 
	
	component bit_predict_2
		port(clr, Clk, action: in std_logic; 
             	     branch_id: in integer;
		     predict_1: out std_logic_vector(1 downto 0);
                     predict_2: out std_logic_vector(1 downto 0);
                     miss: out integer);
	end component; 

file file_VECTORS : text;

signal r_clk : std_logic :='0';
signal r_clr : std_logic :='0';
signal r_action : std_logic;
signal r_branch_id: integer;
signal r_predict1 : std_logic_vector(1 downto 0) :="00";
signal r_predict2 : std_logic_vector(1 downto 0) :="00";
signal r_miss : integer :=0 ;

constant MEMSIZE: integer := 6000;
type b_array is array(0 to MEMSIZE) of integer;
type a_array is array(0 to MEMSIZE) of std_logic;

signal b_id: b_array;
signal act: a_array; 

constant clk_period: time := 100 ns; 

begin

	bit_p : bit_predict_2 port map (  
		clr => r_clr,
		clk => r_clk,
		action => r_action,
		branch_id => r_branch_id,
		predict_1 => r_predict1,
		predict_2 => r_predict2,
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
        variable v_branch: integer;
        variable v_space: character;  
	variable i: integer; 
begin
	i := 0;
	file_open(file_VECTORS, "OneBitTwoBitNumOnly 1.txt", read_mode);

	while not endfile(file_VECTORS) loop
		readline(file_VECTORS, v_Iline);
		read(v_Iline, v_branch);
                read(v_Iline, v_space);
		read(v_Iline, v_action);
 		
		b_id(i) <= v_branch;
		act(i) <= v_action;
		i := i + 1;						

	end loop; 
	file_close(file_VECTORS);
	wait;
	end process;


	process(r_clk)
		variable i: integer range 0 to b_id'HIGH := 0;  
	begin
			
			if(r_clk'event and r_clk = '1') then
				
					r_branch_id <= b_id(i); 
					r_action <= act(i);
					i := i + 1;

			end if;			
	end process;
	 
end test1;