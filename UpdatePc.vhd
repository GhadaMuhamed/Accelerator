Library ieee;
Use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
Entity UpdatePc is

port(K,R,F: in std_logic;
stride : in std_logic_vector(1 downto 0);
Read_F,CLK,RST,PC_en,PC_en2,Filter,pcSrc: in std_logic;

ramAddr:out std_logic_vector(16 downto 0)
);
end UpdatePc;
----------------------------------------------------
Architecture Data_update of UpdatePc is

component pcmux is
Generic (n : integer :=17);
PORT (
IN1,IN2,IN3,IN4,IN5,IN6: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
SEl:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
OUT1:OUT  STD_LOGIC_VECTOR(n-1 DOWNTO 0)
);    
end component;
--------------------------------------------------
component mux_2 IS  
Generic (n : integer :=5);
PORT (
IN1,IN2:IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
SEl:IN STD_LOGIC;
OUT1:OUT  STD_LOGIC_VECTOR(n-1 DOWNTO 0)
);    
end component;
------------------------------------------------------
component RegPC is
port( Clk,Rst,num : in std_logic;
e : in std_logic;
d : in std_logic_vector(16 downto 0);
q : out std_logic_vector(16 downto 0));
end component;
--------------------------------------------------------------
component mux is
Generic (n : integer :=17);
PORT (
IN1,IN2,IN3: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
SEl:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
OUT1:OUT  STD_LOGIC_VECTOR(n-1 DOWNTO 0)
);    
end component;
----------------------------------------------------------
signal sel_pc : std_logic_vector(2 downto 0);
signal out_muxPC,RegPc_out,inMuxPc2,inMuxPc3,inMuxPc4,inMuxPc5,inMuxPc6,inmux2Pc,out_mux2,pcOut_image,pcOut_image_in,inmux3Pc : std_logic_vector(16 downto 0);
signal sel_mux2 : std_logic_vector(1 downto 0);
begin  
sel_pc <= K&R&F;
inMuxPc2<= RegPc_out-"1111111100"+Stride;
inMuxPc3<= RegPc_out-"111111110"+Stride;
inMuxPc4<= RegPc_out-"10000000000"+Stride;
inMuxPc5<= RegPc_out-"1000000000"+Stride;
inMuxPc6<= RegPc_out+"100000000";
mux1: pcMux generic map (n=>17) port map(RegPc_out,inMuxPc2,inMuxPc3,inMuxPc4,inMuxPc5,inMuxPc6,sel_pc,out_muxPC);
inmux2Pc <=RegPc_out+"101";
inmux3Pc <=RegPc_out+"11";
sel_mux2<=Read_F&Filter;
mux2: mux generic map (n=>17) port map(out_muxPC,inmux3Pc,inmux2Pc,sel_mux2,out_mux2);
Reg1:RegPC port map(Clk,Rst,'0',PC_en,out_mux2,RegPc_out);

muxForAddr: mux_2 generic map (n=>17) port map(RegPc_out,pcOut_image,pcSrc,ramAddr);
pcOut_image_in <= pcOut_image+'1';
Reg2 :RegPC port map(Clk,Rst,'1',PC_en2,pcOut_image_in,pcOut_image);
end Data_update;
