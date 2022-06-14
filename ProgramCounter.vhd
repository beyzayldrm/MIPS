library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ProgramCounter is
	port (
		Address : in std_logic_vector(31 downto 0);
		reset: in std_logic;
		clk : in std_logic;
		PCResult : out std_logic_vector(31 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
begin
	process (clk)begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				PCResult <= "00000000000000000000000000000000";
			else
				PCResult <= address;
			end if;
		end if;
	end process;
end Behavioral;