library IEEE;
use IEEE.numeric_bit.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity predict4_2 is 
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
end predict4_2;  

architecture predict4_2 of predict4_2 is
signal p1: std_logic_vector(1 downto 0) := "00";
signal p2: std_logic_vector(1 downto 0) := "00";
signal p3: std_logic_vector(1 downto 0) := "00";
signal p4: std_logic_vector(1 downto 0) := "00";
signal p5: std_logic_vector(1 downto 0) := "00";
signal p6: std_logic_vector(1 downto 0) := "00";
signal p7: std_logic_vector(1 downto 0) := "00";
signal p8: std_logic_vector(1 downto 0) := "00";
signal p9: std_logic_vector(1 downto 0) := "00";
signal p10: std_logic_vector(1 downto 0) := "00";
signal p11: std_logic_vector(1 downto 0) := "00";
signal p12: std_logic_vector(1 downto 0) := "00";
signal p13: std_logic_vector(1 downto 0) := "00";
signal p14: std_logic_vector(1 downto 0) := "00";
signal p15: std_logic_vector(1 downto 0) := "00";
signal p16: std_logic_vector(1 downto 0) := "00";
signal m: integer := 0;
signal b_hist: std_logic_vector(3 downto 0) := "0000"; 

begin 

	process(Clk, clr)
	begin
		if clr = '1' then p1 <= "00";
				  p2 <= "00";
				  p3 <= "00";
				  p4 <= "00";
				  p5 <= "00";
				  p6 <= "00";
				  p7 <= "00";
				  p8 <= "00";
				  p9 <= "00";
				  p10 <= "00";
				  p11 <= "00";
				  p12 <= "00";
				  p13 <= "00";
				  p14 <= "00";
				  p15 <= "00";
				  p16 <= "00";
				  m <= 0;
				  b_hist <= "0000";

		elsif Clk'event and Clk='1' then
			b_hist <= b_hist(2 downto 0) & action;
			
			case b_hist is 
				when "0000" => case p1 is
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


				when "0001" => case p2 is
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

				when "0010" => case p3 is
							when "00" => if action = '1' then
									p3 <= p3 + "01" ;
									m <= m + 1 ;
					     			     else
									p3 <= p3 ;
					     			     end if;

							when "01" => if action = '1' then 
									p3 <= p3 + "01";
									m <= m + 1;
					     			     else
									p3 <= p3 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p3 <= p3 + "01";
					     			     else
									p3 <= p3 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p3 <= p3; 
					     			     else
									p3 <= p3 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p3 <= p3;
						end case;

				when "0011" => case p4 is
							when "00" => if action = '1' then
									p4 <= p4 + "01" ;
									m <= m + 1 ;
					     			     else
									p4 <= p4 ;
					     			     end if;

							when "01" => if action = '1' then 
									p4 <= p4 + "01";
									m <= m + 1;
					     			     else
									p4 <= p4 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p4 <= p4 + "01";
					     			     else
									p4 <= p4 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p4 <= p4; 
					     			     else
									p4 <= p4 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p4 <= p4;
						end case;

				when "0100" => case p5 is
							when "00" => if action = '1' then
									p5 <= p5 + "01" ;
									m <= m + 1 ;
					     			     else
									p5 <= p5 ;
					     			     end if;

							when "01" => if action = '1' then 
									p5 <= p5 + "01";
									m <= m + 1;
					     			     else
									p5 <= p5 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p5 <= p5 + "01";
					     			     else
									p5 <= p5 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p5 <= p5; 
					     			     else
									p5 <= p5 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p5 <= p5;
						end case;

				when "0101" => case p6 is
							when "00" => if action = '1' then
									p6 <= p6 + "01" ;
									m <= m + 1 ;
					     			     else
									p6 <= p6 ;
					     			     end if;

							when "01" => if action = '1' then 
									p6 <= p6 + "01";
									m <= m + 1;
					     			     else
									p6 <= p6 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p6 <= p6 + "01";
					     			     else
									p6 <= p6 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p6 <= p6; 
					     			     else
									p6 <= p6 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p6 <= p6;
						end case;


				when "0110" => case p7 is
							when "00" => if action = '1' then
									p7 <= p7 + "01" ;
									m <= m + 1 ;
					     			     else
									p7 <= p7 ;
					     			     end if;

							when "01" => if action = '1' then 
									p7 <= p7 + "01";
									m <= m + 1;
					     			     else
									p7 <= p7 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p7 <= p7 + "01";
					     			     else
									p7 <= p7 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p7 <= p7; 
					     			     else
									p7 <= p7 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p7 <= p7;
						end case;


				when "0111" => case p8 is
							when "00" => if action = '1' then
									p8 <= p8 + "01" ;
									m <= m + 1 ;
					     			     else
									p8 <= p8 ;
					     			     end if;

							when "01" => if action = '1' then 
									p8 <= p8 + "01";
									m <= m + 1;
					     			     else
									p8 <= p8 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p8 <= p8 + "01";
					     			     else
									p8 <= p8 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p8 <= p8; 
					     			     else
									p8 <= p8 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p8 <= p8;
						end case;

				when "1000" => case p9 is
							when "00" => if action = '1' then
									p9 <= p9 + "01" ;
									m <= m + 1 ;
					     			     else
									p9 <= p9 ;
					     			     end if;

							when "01" => if action = '1' then 
									p9 <= p9 + "01";
									m <= m + 1;
					     			     else
									p9 <= p9 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p9 <= p9 + "01";
					     			     else
									p9 <= p9 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p9 <= p9; 
					     			     else
									p9 <= p9 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p9 <= p9;
						end case;

				when "1001" => case p10 is
							when "00" => if action = '1' then
									p10 <= p10 + "01" ;
									m <= m + 1 ;
					     			     else
									p10 <= p10 ;
					     			     end if;

							when "01" => if action = '1' then 
									p10 <= p10 + "01";
									m <= m + 1;
					     			     else
									p10 <= p10 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p10 <= p10 + "01";
					     			     else
									p10 <= p10 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p10 <= p10; 
					     			     else
									p10 <= p10 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p10 <= p10;
						end case;

				when "1010" => case p11 is
							when "00" => if action = '1' then
									p11 <= p11 + "01" ;
									m <= m + 1 ;
					     			     else
									p11 <= p11 ;
					     			     end if;

							when "01" => if action = '1' then 
									p11 <= p11 + "01";
									m <= m + 1;
					     			     else
									p11 <= p11 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p11 <= p11 + "01";
					     			     else
									p11 <= p11 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p11 <= p11; 
					     			     else
									p11 <= p11 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p11 <= p11;
						end case;

				when "1011" => case p12 is
							when "00" => if action = '1' then
									p12 <= p12 + "01" ;
									m <= m + 1 ;
					     			     else
									p12 <= p12 ;
					     			     end if;

							when "01" => if action = '1' then 
									p12 <= p12 + "01";
									m <= m + 1;
					     			     else
									p12 <= p12 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p12 <= p12 + "01";
					     			     else
									p12 <= p12 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p12 <= p12; 
					     			     else
									p12 <= p12 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p12 <= p12;
						end case;

				when "1100" => case p13 is
							when "00" => if action = '1' then
									p13 <= p13 + "01" ;
									m <= m + 1 ;
					     			     else
									p13 <= p13 ;
					     			     end if;

							when "01" => if action = '1' then 
									p13 <= p13 + "01";
									m <= m + 1;
					     			     else
									p13 <= p13 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p13 <= p13 + "01";
					     			     else
									p13 <= p13 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p13 <= p13; 
					     			     else
									p13 <= p13 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p13 <= p13;
						end case;

				when "1101" => case p14 is
							when "00" => if action = '1' then
									p14 <= p14 + "01" ;
									m <= m + 1 ;
					     			     else
									p14 <= p14 ;
					     			     end if;

							when "01" => if action = '1' then 
									p14 <= p14 + "01";
									m <= m + 1;
					     			     else
									p14 <= p14 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p14 <= p14 + "01";
					     			     else
									p14 <= p14 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p14 <= p14; 
					     			     else
									p14 <= p14 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p14 <= p14;
						end case;

				when "1110" => case p15 is
							when "00" => if action = '1' then
									p15 <= p15 + "01" ;
									m <= m + 1 ;
					     			     else
									p15 <= p15 ;
					     			     end if;

							when "01" => if action = '1' then 
									p15 <= p15 + "01";
									m <= m + 1;
					     			     else
									p15 <= p15 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p15 <= p15 + "01";
					     			     else
									p15 <= p15 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p15 <= p15; 
					     			     else
									p15 <= p15 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p15 <= p15;
						end case;

				when "1111" => case p16 is
							when "00" => if action = '1' then
									p16 <= p16 + "01" ;
									m <= m + 1 ;
					     			     else
									p16 <= p16 ;
					     			     end if;

							when "01" => if action = '1' then 
									p16 <= p16 + "01";
									m <= m + 1;
					     			     else
									p16 <= p16 - "01" ;
                                             			     end if;
		
							when "10" => if action = '1' then 
									p16 <= p16 + "01";
					     			     else
									p16 <= p16 - "01" ;
									m <= m + 1;
					     			     end if;

							when "11" => if action = '1' then 
									p16 <= p16; 
					     			     else
									p16 <= p16 - "01" ;
									m <= m + 1; 
					     			     end if;
							when others => p16 <= p16;
						end case;

				when others =>  p1 <= p1;
						p2 <= p2;
						p3 <= p3;
						p4 <= p4;
						p5 <= p5;
						p6 <= p6;
						p7 <= p7;
						p8 <= p8;
						p9 <= p9;
						p10 <= p10;
						p11 <= p11;
						p12 <= p12;
						p13 <= p14;
						p15 <= p15;
						p16 <= p16;
			end case;	
		end if;
	end process;
	predict_1 <=p1;
	predict_2 <=p2;
	predict_3 <=p3;
	predict_4 <=p4;
	predict_5 <=p5;
	predict_6 <=p6;
	predict_7 <=p7;
	predict_8 <=p9;
	predict_10 <=p10;
	predict_11 <=p11;
	predict_12 <=p12;
	predict_13 <=p13;
	predict_14 <=p14;
	predict_15 <=p15;
	predict_16 <=p16;
	miss <= m;
	branch_h <= b_hist;
end predict4_2; 