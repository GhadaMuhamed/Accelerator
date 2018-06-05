LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Counter IS
Generic (n : integer :=3);
PORT(
EN: IN std_logic;
CLK: IN std_logic;
RST: IN std_logic;
Filter: IN std_logic;  --zero when filter 3 and 1 when filter 5
Output: OUT std_logic_vector(n-1 downto 0));
end Counter;

ARCHITECTURE Arch_Counter OF Counter IS
SIGNAL temp: std_logic_vector(n-1 DOWNTO 0);
BEGIN PROCESS(CLK,RST)
BEGIN
     IF RST='1' THEN
	temp<= (others => '0');
     ELSIF(RISING_EdGE(CLK)) THEN
        IF EN='1' THEN
	   IF Filter ='0' THEN
	        IF temp ="011" THEN
		temp <="001";
		ELSE 
	    	temp <= temp+1;
 		END IF;	
	   ELSE
		IF temp ="101" THEN
		temp <="001";	
		ELSE 
	    	temp <= temp+1;
		END IF;
      END IF;
    END IF;
END IF;
END PROCESS;
Output<=temp;
END Arch_Counter;		