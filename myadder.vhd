LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY MYADDER IS  
		PORT (A,B,CIN 	      :  IN   std_logic;
		      COUT,S          :  OUT  STD_LOGIC);    
END ENTITY MYADDER;
ARCHITECTURE DATA_FLOW OF MYADDER IS 

BEGIN 
	 PROCESS (a,b,cin)
         BEGIN               
         s <= a XOR b XOR cin;               
         cout <= (a AND b) or (cin AND (a XOR b));     
         END PROCESS;

END ARCHITECTURE DATA_FLOW;