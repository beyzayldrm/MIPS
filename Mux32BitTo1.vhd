library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux32BitTo1 is
	port (
		inA : in std_logic_vector(31 downto 0);
		inB : in std_logic_vector(31 downto 0);
		sel : in std_logic;
		output : out std_logic_vector(31 downto 0));
end Mux32BitTo1;

architecture Behavioral of Mux32BitTo1 is
begin

	output <= inA 
	when (sel = '1') 
	else inB;

end Behavioral;