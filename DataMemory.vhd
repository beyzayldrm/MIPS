library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DataMemory is
 Port(    
 MWrite : in std_logic;
 MRead : in std_logic;
 Address : in std_logic_vector(9 downto 0);
 WriteData :in std_logic_vector(31 downto 0);
 ReadData : out std_logic_vector(31 downto 0):= x"00000000";
 Clk: in std_logic 
);                      
end DataMemory;
architecture Behavioral of DataMemory is
type data_file is array(0 to 1023) of std_logic_vector(31 downto 0);
signal data : data_File := (others => (others => '0'));

begin
process(Writedata,Address,MWrite,MRead,Clk)
begin

if falling_edge(Clk) then
case MRead is when '1'  => ReadData <= Data(to_integer(unsigned(Address))) ;
when others => ReadData <= x"00000000";
end case;
end if;

if  rising_edge(Clk) then
case MWrite is when '1'  => Data (to_integer(unsigned(Address))) <= WriteData ;
when others => Data <= Data;
end case;
end if;
end process;   
end Behavioral;