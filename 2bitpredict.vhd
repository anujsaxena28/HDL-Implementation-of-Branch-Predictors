library IEEE;
use IEEE.numeric_bit.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity bit_predict_2 is 
	port(   clr, Clk: in std_logic; 
             	action: in std_logic;
		branch_id: in integer;
		predict_1: out std_logic_vector(1 downto 0);
                predict_2: out std_logic_vector(1 downto 0);
		miss: out integer);
end bit_predict_2;  

architecture bit_predict_2 of bit_predict_2 is
signal p1: std_logic_vector(1 downto 0) := "00";
signal p2: std_logic_vector(1 downto 0) := "00";
signal m: integer := 0;
begin
	process(Clk, clr)
	begin
	  if clr = '1' then p1 <= "00";
			    p2 <= "00";
			    m <= 0;
	  elsif Clk'event and Clk='1' then	
 		if branch_id = 1 then
			case p1 is
				when "00" => if action = '1' then
						p1 <= p1 + "01" ;
						m <= m + 1 ;
					     else
						p1 <= p1 ;
					     end if;

				when "01" => if action = '1' then 
						p1 <= p1 + "01";
						m <= m + 1;
					     else
						p1 <= p1 - "01" ;
                                             end if;

				when "10" => if action = '1' then 
						p1 <= p1 + "01";
					     else
						p1 <= p1 - "01" ;
						m <= m + 1;
					     end if;

				when "11" => if action = '1' then 
						p1 <= p1; 
					     else
						p1 <= p1 - "01" ;
						m <= m + 1; 
					     end if;
				when others => p1 <= p1;
			end case;
		
		elsif branch_id = 2 then

				case p2 is
					when "00" => if action = '1' then
							p2 <= p2 + "01" ;
							m <= m + 1 ;
					     	     else
							p2 <= p2 ;
					     	     end if;

					when "01" => if action = '1' then 
							p2 <= p2 + "01";
							m <= m + 1;
					     	     else
							p2 <= p2 - "01" ;
                                             	     end if;

					when "10" => if action = '1' then 
							p2 <= p2 + "01";
					     	     else
							p2 <= p2 - "01" ;
							m <= m + 1;
					     	     end if;

					when "11" => if action = '1' then 
							p2 <= p2; 
					     	     else
							p2 <= p2 - "01" ;
							m <= m + 1; 
					     	     end if;
					when others => p2 <= p2;
				end case;
		end if;
	  end if; 
	end process;
	predict_1 <=p1;
	predict_2 <=p2; 
	miss <= m;
end bit_predict_2;	