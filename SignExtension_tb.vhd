library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SignExtension_tb is
end entity;

architecture test_bench of SignExtension_tb is
	component SignExtension
		port (
			INPUT : in std_logic_vector(15 downto 0);
			OUTPUT : out std_logic_vector(31 downto 0));
	end component;
	signal INPUT : std_logic_vector(15 downto 0);
	signal OUTPUT : std_logic_vector(31 downto 0);

begin

	ut : SignExtension port map(
		INPUT => INPUT,
		OUTPUT => OUTPUT);

	stimulus : process
	begin

		INPUT <= b"0010111110101110";
		wait for 10ns;

		INPUT <= b"1110011110100010";
		wait for 10ns;

		wait;
	end process;
end;