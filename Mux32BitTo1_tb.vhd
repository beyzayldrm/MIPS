library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Mux32BitTo1_tb is
end;

architecture test_bench of Mux32BitTo1_tb is
	component Mux32BitTo1
		port (
			inA : in std_logic_vector(31 downto 0);
			inB : in std_logic_vector(31 downto 0);
			sel : in std_logic;
			output : out std_logic_vector(31 downto 0));
	end component;

	signal inA : std_logic_vector(31 downto 0);
	signal inB : std_logic_vector(31 downto 0);
	signal sel : std_logic;
	signal output : std_logic_vector(31 downto 0);

begin

	AA : Mux32BitTo1 port map(
		inA => inA,
		inB => inB,
		sel => sel,
		output => output);

	stimulus : process
	begin

		inA <= x"9178d1da";
		inB <= x"361b41163";
		sel <= '0';
		wait for 10ns;

		for i in 0 to 4 loop
			sel <= not sel;
			wait for 10ns;
		end loop;
		wait for 20ns;
		inA <= x"5cad4537";
		inB <= x"613356d3";
		sel <= '0';
		wait for 10ns;

		for i in 0 to 4 loop
			sel <= not sel;
			wait for 10ns;
		end loop;
		wait;
	end process;
end;