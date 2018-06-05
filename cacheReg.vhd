Library ieee;
Use ieee.std_logic_1164.all;

Entity cacheReg is
port( Clk,Rst : in std_logic;
e : in std_logic;
d : in std_logic_vector(7 downto 0);
q : out std_logic_vector(7 downto 0));
end cacheReg;

Architecture store of cacheReg is
begin
process(Clk,Rst)
begin
if Rst = '1'  then
q <= (others=>'0');
elsif RISING_edge(Clk) then
if (e='1') then 
q <= d;
end if;
end if;
end process;
end store;