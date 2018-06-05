LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;


ENTITY Ram IS

PORT(           CLK  : IN std_logic;
                 WR  : IN std_logic;
	     Address : IN std_logic_vector(16 DOWNTO 0);
	     Dout : OUT std_logic_vector(39 DOWNTO 0);
             Din  : IN std_logic_vector(7 DOWNTO 0));

               
END Ram;

ARCHITECTURE DATAFLOW  OF Ram IS

TYPE RAM_TYPE IS ARRAY(0 TO 131100) of std_logic_vector(7 DOWNTO 0);
     SIGNAL RAM : RAM_TYPE :=(
  OTHERS => X"00"
);

BEGIN
PROCESS (CLK)
BEGIN
	IF FALLING_EDGE (CLK)THEN
		IF(WR='1')THEN
			RAM(to_integer(unsigned(Address)))<=Din  ;
		END IF;
	END IF;	
END PROCESS;

Dout(7 downto 0) <= RAM(to_integer(unsigned(Address))) ;
Dout(15 downto 8) <= RAM(to_integer(unsigned(Address))+1);
Dout(23 downto 16) <= RAM(to_integer(unsigned(Address))+2);
Dout(31 downto 24) <= RAM(to_integer(unsigned(Address))+3);
Dout(39 downto 32) <= RAM(to_integer(unsigned(Address))+4);
END DATAFLOW;
