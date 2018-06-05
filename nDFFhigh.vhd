LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nDFFhigh IS
PORT( Clk,Rst        : IN std_logic;
		   d : IN std_logic_vector(2 DOWNTO 0);
		   q : OUT std_logic_vector(2 DOWNTO 0));
END nDFFhigh;

ARCHITECTURE  nDFFhighARCH OF nDFFhigh IS
BEGIN
PROCESS (Clk,Rst)
BEGIN
IF Rst = '1' THEN
		q <= (OTHERS=>'0');
ELSIF FALLING_EDGE(Clk) then
		q <= d;
end if;
END PROCESS;

END nDFFhighARCH;
