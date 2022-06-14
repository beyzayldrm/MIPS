library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PCAdder_tb is
end PCAdder_tb;

architecture test_gate of PCAdder_tb is
component PCAdder is
port (
PCResult: in std_logic_vector (31 downto 0) ;
PCAddResult: out std_logic_vector (31 downto 0)
);
end component;

signal PCResult_t: std_logic_vector (31 downto 0);
signal PCAddResult_t : std_logic_vector (31 downto 0);

begin
U: PCAdder port map(
PCResult => PCResult_t,
PCAddResult => PCAddResult_t);

process
begin
PCResult_t <= "10101001101010101010001010101011";
wait for 10ns;
PCResult_t <= "10001001101010101010001010101011";
wait for 10ns;
PCResult_t <= "10000000001010101010001010000011";
wait;
end process;
end test_gate;
