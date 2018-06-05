LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
package pkg is 

--TYPE matrix  IS ARRAY(natural range<>, natural range<>) OF std_logic_vector(7 DOWNTO 0);
TYPE ram_type IS ARRAY(natural range<>) OF std_logic_vector(7 DOWNTO 0);
TYPE adders_sig IS ARRAY(natural range<>) OF std_logic_vector(12 DOWNTO 0);
end pkg;