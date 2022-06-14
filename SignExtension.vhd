library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SignExtension is
	port (
		INPUT : in std_logic_vector(15 downto 0);
		OUTPUT : out std_logic_vector(31 downto 0));
end SignExtension;

architecture Behavioral of SignExtension is
begin
process(input)
begin
if (input(15) ='0' ) then
	OUTPUT(15 downto 0) <= INPUT;
	OUTPUT(31 downto 16) <= (31 downto 16 => input(15));
else
	OUTPUT(15 downto 0) <= INPUT;
	OUTPUT(31 downto 16) <= (31 downto 16 => input(15));
end if;
end process;
end Behavioral;