library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MUX4Bit_tb is
end;

architecture test_bench of MUX4Bit_tb is
	component MUX4Bit
		port (     
           inA   : in  STD_LOGIC_VECTOR (4 downto 0);
           inB   : in  STD_LOGIC_VECTOR (4 downto 0);
           sel : in  STD_LOGIC;
           output  : out STD_LOGIC_VECTOR (4 downto 0)
 );
	end component;

	signal inA : std_logic_vector(4 downto 0);
	signal inB : std_logic_vector(4 downto 0);
	signal sel : std_logic;
	signal output : std_logic_vector(4 downto 0);

begin

	AA : MUX4Bit port map(
		inA => inA,
		inB => inB,
		sel => sel,
		output => output);

	stimulus : process
	begin

		inA <= "01010";
		inB <= "00011";
		sel <= '0';
		wait for 10ns;

		for i in 0 to 4 loop
			sel <= not sel;
			wait for 10ns;
		end loop;
		wait for 20ns;
			inA <= "00010";
		inB <= "00001";
		sel <= '0';
		wait for 10ns;

		for i in 0 to 4 loop
			sel <= not sel;
			wait for 10ns;
		end loop;
		wait;
	end process;
end;