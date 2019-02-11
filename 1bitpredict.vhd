library IEEE;
use IEEE.numeric_bit.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity bit_predict is 
	port(clr, Clk: in std_logic; 
             	action: in std_logic;
		branch_id: in integer;
		predict_1: out std_logic;
                predict_2: out std_logic;
		miss: out integer);
end bit_predict; 

architecture bit_predict of bit_predict is
signal comp: std_logic;      --compare input branch result and the predict bit X 
signal p1: std_logic := '0';
signal p2: std_logic := '0';
signal m: integer := 0;
begin 
  
      process(Clk,clr)
      begin
	if clr = '1' then p1 <= '0';
			  p2 <= '0'; 
		          m <= 0;	
	elsif Clk'event and Clk='1' then
		if branch_id = 1  then
        		comp <=action xor p1;		
				
			if comp ='1' and action ='1' then
				p1<=action;
				m<=m+1;
			elsif comp ='1' and action ='0' then
				p1<=action;
				m<=m+1;
			else
				p1<=action; 
                                       	   
                	end if;
        
		elsif branch_id = 2 then 
			comp <=action xor p2;
					
			if comp ='1' and action ='1' then
				p2<=action;
				m<=m+1;
			elsif comp ='1' and action ='0' then
				p2<=action;
				m<=m+1;
			else
				p2<=action; 
                                       	   
                	end if;
        	end if;
	end if;
      end process;
      predict_1<=p1;
      predict_2<=p2;	
      miss<=m;
end bit_predict; 
