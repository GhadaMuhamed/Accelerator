LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY windCounter IS
Generic (n : integer :=8);
PORT(
EN: IN std_logic;
CLK: IN std_logic;
RST: IN std_logic;
Output: OUT std_logic_vector(n-1 downto 0));
end windCounter;

ARCHITECTURE Arch_Genral_Counter OF General_Counter IS
SIGNAL temp: std_logic_vector(n-1 DOWNTO 0);
BEGIN PROCESS(CLK,RST)
BEGIN
     IF RST='1' THEN
	temp<= (others => '0');
     ELSIF(RISING_EdGE(CLK)) THEN
        IF EN='1' THEN
	    	temp <= temp+1;
    END IF;
END IF;
END PROCESS;
Output<=temp;
END Arch_Genral_Counter;		