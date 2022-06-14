library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter_tb is
end ProgramCounter_tb;

architecture test_gate of ProgramCounter_tb is
component ProgramCounter is
 Port (
Address:in std_logic_vector (31 downto 0);
Reset: in std_logic;
Clk: in std_logic;
PCResult: out std_logic_vector (31 downto 0));
end component;

signal Address_t : std_logic_vector(31 downto 0);
signal Reset_t : std_logic;
signal Clk_t : std_logic;
signal PCResult_t: std_logic_vector(31 downto 0);
begin
U:ProgramCounter port map(
Address => Address_t,
Clk => Clk_t,
Reset => Reset_t,
PCResult => PCResult_t
);
clk_process: process
begin
Clk_t<='1';
 wait for 5ns  ; 
Clk_t<='0';
 wait for 5ns  ;
end process;

UU: process 
begin
Reset_t <= '1';
Address_t <= "00001011111111111111111111111100";
wait for 10ns;
Reset_t <= '1';
Address_t <= "00001111111111111111111111111100";
wait for 10ns;
Reset_t <= '1';
Address_t <= "00001011111111111111001111100100";
wait for 10ns;
Reset_t <= '0';
Address_t <= "00001011111111111111111111111100";
wait for 10ns;
Reset_t <= '0';
Address_t <= "00001011111111111111100111111100";
wait;
end process;
end test_gate;
