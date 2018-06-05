LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use work.pkg.all;
entity master is 
port (rst,clk,filter,start: in std_logic;
stride : in std_logic_vector(1 downto 0));
end master;

architecture dataFlow of master is 
signal k,r,readFilter,ramWrite,pcInImageEnable,pcOutImageEnable,pcSrc,
rowCounterEnable,cacheWrite,enableA,enableP,aluReset,
aluStart,instr,cacheRegEnable :std_logic;
signal cacheRegOut,aluDataOut : std_logic_vector(7 downto 0);
signal ramDataOut : std_logic_vector(39 downto 0);
signal cacheAdrr : std_logic_vector(4 downto 0);
signal rowCounterOut:  std_logic_vector(2 downto 0);
signal windCounterOut: std_logic_vector(7 downto 0); 
signal doneCounterOut :  std_logic_vector(7 downto 0);
signal accFinish,done,windRst,rowCounterRst,windCounterRst,doneCounterRst :  std_logic;
signal ramaddr : std_logic_vector (16 downto 0);
signal dataOut: ram_type(0 TO 24);
begin
done <= '1' when (doneCounterOut = "11111101" and filter = '1') or (doneCounterOut = "11111111" and filter = '0')
else '0';
windRst <= windCounterRst or k;


finiteState : entity work.state port map(clk,rst,filter,accFinish,done,instr,start,stride,rowCounterRst,windCounterRst,doneCounterRst,pcInImageEnable,pcOutImageEnable
,cacheRegEnable,rowCounterEnable,cacheWrite,enableA,enableP,r,k,ramWrite,aluReset,aluStart,pcSrc,readFilter,
rowCounterOut,windCounterOut,doneCounterOut);
Mycache: entity work.cache generic map (n => 8) PORT MAP(CLK,cacheWrite,cacheAdrr,ramDataOut,dataOut);
cacheReg : entity work.cacheReg port map(clk,rst,cacheRegEnable,aluDataOut,cacheRegOut); 



updatePc: entity work.UpdatePc port map (k,r,filter,stride,readFilter,clk,rst,pcInImageEnable,pcOutImageEnable,
filter,pcSrc,ramaddr);



Ram: entity work.ram port map (clk,ramWrite,ramaddr,ramDataOut,cacheRegOut);

counters : entity work.Main port map(clk,filter,rowCounterRst,windRst,doneCounterRst,r,k,rowCounterEnable,
cacheAdrr,doneCounterOut,windCounterOut,rowCounterOut);
Accelerator : entity work.accelerator port map(clk,rst,enableP,enableA,aluReset,aluStart,instr,filter,dataOut,aluDataOut,accFinish);

end dataFlow;
