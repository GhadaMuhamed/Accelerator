
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 
use work.pkg.all;

entity cache is
Generic (n : integer :=8);
    port(clk, wr:in STD_LOGIC;
         address:in STD_LOGIC_VECTOR(4 downto 0);  -- l address mn 0 Le 25 
         data_in:in STD_LOGIC_VECTOR(39 downto 0);   --40 bit (5 pixel * 8 bit)
	dataOut: out ram_type(0 TO 24)
     );
end cache;

architecture behavorial_data_array of cache is
   -- type data_array is array ( 25  downto 0) of STD_LOGIC_VECTOR (7 downto 0);   --tolha
    signal data: ram_type(0 To 24):=(OTHERS =>X"00") ;
begin
    --data_out <= data(to_integer(unsigned(address)));
    process(clk)
    begin
	if (RISING_EDGE(clk)) then
        if(wr = '1') then
            data(to_integer(unsigned(address)))   <= data_in(7 downto 0);
	    data(to_integer(unsigned(address))+1) <= data_in(15 downto 8);
	    data(to_integer(unsigned(address))+2) <= data_in(23 downto 16);
            data(to_integer(unsigned(address))+3) <= data_in(31 downto 24);
            data(to_integer(unsigned(address))+4) <= data_in(39 downto 32);
	end if;
        end if;

    end process;
dataOut <= data(0 To 24);
end behavorial_data_array;