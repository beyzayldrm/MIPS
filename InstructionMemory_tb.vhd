library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity InstructionMemory_tb is
end;

architecture bench of InstructionMemory_tb is

	component InstructionMemory
		port (
			Address : in std_logic_vector(31 downto 0);
			Instruction : out std_logic_vector(31 downto 0));
	end component;

	signal Address : std_logic_vector(31 downto 0);
	signal Instruction : std_logic_vector(31 downto 0);


begin

	uut : InstructionMemory port map(
		Address => Address,
		Instruction => Instruction);

	stimulus : process
	begin

		Address <= x"00000010";
		
		wait for 10ns;
		
		for i in 0 to 16 loop
		    Address <= std_logic_vector(to_unsigned(i * 4, 32));
		    wait for 10ns;
		end loop;

		wait;
	end process;


end;