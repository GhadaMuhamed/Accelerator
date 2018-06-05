Library ieee;
Use ieee.std_logic_1164.all;

Entity RegPc is
port( Clk,Rst,num : in std_logic;
e : in std_logic;
d : in std_logic_vector(16 downto 0);
q : out std_logic_vector(16 downto 0));
end RegPc;

Architecture my_Reg of RegPc is
begin
process(Clk,Rst)
begin
if Rst = '1'  then
if (num = '0') then
q <= (others=>'0');
else q <= "10000000000011000" ;
end if;
elsif RISING_EDGE(Clk) then
if (e='1') then 
q <= d;
end if;
end if;
end process;
end my_Reg;
