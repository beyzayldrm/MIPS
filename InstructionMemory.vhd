library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstructionMemory is
    Port (
           Address : in STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is

type InstructionArray is array(0 to 127) of std_logic_vector(31 downto 0);
constant Ins_rom: InstructionArray:=(

x"2010000e",
x"2011000f",
x"2012001d",
x"2013fff1",
x"02324020",
x"02504024",
x"72114002",
x"02504025",
x"36080010",
x"02124022",
x"72604021",
x"72404020",
x"0211402a",
x"0230402a",
x"00114080",
x"001240c2", 
others=>x"00000000"
);
begin
instruction <= Ins_rom(to_integer(unsigned(Address(8 downto 2))));
end Behavioral;