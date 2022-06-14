library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity signExtention_5Bit_tb is
--  Port ( );
end signExtention_5Bit_tb;

architecture Behavioral of signExtention_5Bit_tb is
component signExtention_5Bit is
generic(shifti5Bit : integer := 5;
        bitnum : integer :=32
        );

 Port (in_shift5 : in std_logic_vector(shifti5Bit -1 downto 0) ;
       out_shift5 : out std_logic_vector(bitnum -1 downto 0) 
        );
end component;

signal in_shift5 :  std_logic_vector(4 downto 0) ;
signal out_shift5 :  std_logic_vector(31 downto 0);
begin

uut: signExtention_5Bit
port map(in_shift5 => in_shift5,
out_shift5 => out_shift5);

stimulus: process
begin
in_shift5 <= "00110";
wait for 10ns;

in_shift5 <= "11110";
wait for 10ns;
wait;
end process;
end;
