LIBRARY ieee;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

ENTITY Main IS
PORT(
CLK,filter,rowCounterRst,windCounterRst,doneCounterRst,En_Window,En_Done: IN std_logic;
rowCounterEnable : in std_logic;
cacheAddr : out std_logic_vector(4 downto 0);
DoneOut:out std_logic_vector(7 downto 0);
WindowOut :out std_logic_vector(7 downto 0);
rowOut:out std_logic_vector(2 downto 0));
END Main;

ARCHITECTURE Arch_Main OF Main IS

COMPONENT Counter IS
Generic(n : integer :=3);
PORT(
EN: IN std_logic;
CLK: IN std_logic;
RST: IN std_logic;
Filter: IN std_logic;  --zero when filter 3 and 1 when filter 5
Output: OUT std_logic_vector(n-1 downto 0));
END COMPONENT;


COMPONENT mux_8 IS  
Generic (n : integer :=5);
PORT (
IN1,IN2,IN3,IN4,IN5,IN6: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
SEl:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
OUT1:OUT  STD_LOGIC_VECTOR(n-1 DOWNTO 0)
);    
END COMPONENT;

COMPONENT General_Counter IS
Generic (n : integer :=8);
PORT(
EN: IN std_logic;
CLK: IN std_logic;
RST: IN std_logic;
Output: OUT std_logic_vector(n-1 downto 0));
END COMPONENT;

COMPONENT mux_2 IS  
Generic (n : integer :=5);
PORT (
IN1,IN2:IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
SEl:IN STD_LOGIC;
OUT1:OUT  STD_LOGIC_VECTOR(n-1 DOWNTO 0)
);    
END COMPONENT;



signal OUT_Row:std_logic_vector(2 downto 0);
signal ram_ready:STD_LOGIC;
signal IN1:STD_LOGIC_VECTOR(4 DOWNTO 0):=std_logic_vector(to_unsigned(0,5 ));
signal IN2:STD_LOGIC_VECTOR(4 DOWNTO 0):= std_logic_vector(to_unsigned(5,5));
signal IN3:STD_LOGIC_VECTOR(4 DOWNTO 0):= std_logic_vector(to_unsigned(10,5));
signal IN4:STD_LOGIC_VECTOR(4 DOWNTO 0):= std_logic_vector(to_unsigned(15,5));
signal IN5:STD_LOGIC_VECTOR(4 DOWNTO 0):= std_logic_vector(to_unsigned(20,5));
signal IN6:STD_LOGIC_VECTOR(4 DOWNTO 0):= std_logic_vector(to_unsigned(0,5));
signal OUT_Done:std_logic_vector(7 downto 0);
Signal OUT_Window:std_logic_vector(7 downto 0);
Signal OUT_Mux2_Address:STD_LOGIC_VECTOR(4 DOWNTO 0);
signal Address:STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN 

RW_Counter: counter PORT MAP(rowCounterEnable,CLK,rowCounterRst,Filter,OUT_Row);
MUX_Address: mux_8 PORT MAP(IN1,IN2,IN3,OUT_Mux2_Address,IN5,IN6,OUT_Row,Address);
Window_Counter: General_Counter PORT MAP(EN_Window,CLK,windCounterRst,OUT_Window);
Done_Counter: General_Counter PORT MAP(EN_Done,CLK,doneCounterRst,OUT_Done);
Mux2_Address: Mux_2 PORT MAP(IN6,IN4,Filter,OUT_Mux2_Address);
rowOut <=   OUT_Row;  
WindowOut <= OUT_Window;
DoneOut <= OUT_Done;
cacheAddr <= Address;
END Arch_Main;		


