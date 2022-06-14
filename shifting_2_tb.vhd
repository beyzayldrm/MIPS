library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shifting_2_tb is
--  Port ( );
end shifting_2_tb;

architecture Behavioral of shifting_2_tb is

component shifting_2 is

  Port (
        shifting_in : in std_logic_vector(31 downto 0);
        shifting_out : out std_logic_vector(31 downto 0)
        );
end component;
signal shifting_in: std_logic_vector(31 downto 0);
signal shifting_out: std_logic_vector(31 downto 0);
begin

uut: shifting_2 port map(
shifting_in => shifting_in,
shifting_out => shifting_out);

stimulus: process
begin
         shifting_in <= x"01010010";
		wait for 10ns;

		shifting_in <= x"00110100";
		wait for 10ns;
wait;
end process;
end Behavioral;
