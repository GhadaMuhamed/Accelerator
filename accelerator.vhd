LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.pkg.all;

entity accelerator is 
	port (clk,rst,enp,ena,rstcnt,enablecnt,inst,f        :in std_logic;
		input 				: in ram_type(0 TO 24);
	        result				       	:out std_logic_vector (7 downto 0);
	      finishacc                               :out std_logic);
	                                   
end entity;

architecture accflow of accelerator is
component  alu IS
PORT( Clk,Rst,ena,enp,finishmul       : IN std_logic;
		inp                      : in std_logic_vector(7 downto 0); 
		res                      : OUT std_logic_vector (12 DOWNTO 0));
END component alu;
 
component sumplus is 
port(	clk    :in  std_logic ;
	inst,f  :in std_logic;
	input   :in adders_sig(24 downto 0);
	outf   :out std_logic_vector (7 downto 0));
end  component sumplus;

signal finishmul,rstcnt1,other :std_logic;
signal outcnt1  :std_logic_vector (3 downto 0); 
signal outalu	 :adders_sig (0 TO 24);
begin 
other <= (outcnt1(0)or outcnt1(1) )or outcnt1(2);
finishmul <= inst or(outcnt1(3) and other);
finishacc<= (inst and enablecnt) or (outcnt1(3));
rstcnt1<=Rst or rstcnt;
cnt1: entity work.General_Counter generic map (n=> 4) port map (enablecnt,Clk ,rstcnt1,outcnt1);
 loop1: FOR I IN 0 TO 24 GENERATE
	alu0:alu PORT MAP(Clk,Rst,ena,enp,finishmul,input(I),outalu(I));
 END GENERATE ;
	
	sum:sumplus port map (Clk,inst,f,outalu,result);
end accflow;