library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity register_file is
  Port (
  ReadRegister1, ReadRegister2, WriteRegister: in std_logic_vector(4 downto 0);
  WriteData:  in std_logic_vector(31 downto 0);
  RegWrite: in std_logic;
  ReadData1,ReadData2: out std_logic_vector(31 downto 0):= x"00000000";
  clk: in std_logic
  );
end register_file;

architecture Behavioral of register_file is

type RegisterType is array (31 downto 0) of std_logic_vector(31 downto 0);
	signal regist : RegisterType := (others => (others => '0'));
	attribute ram : string;
    attribute ram of regist: signal is "distributed";
begin
process (clk)
begin

if falling_edge(clk) then
  ReadData1 <= regist(to_integer(unsigned(ReadRegister1)));
  ReadData2 <= regist(to_integer(unsigned(ReadRegister2)));
end if;
   
if (rising_edge(clk) and RegWrite = '1') then
   regist(to_integer(unsigned(WriteRegister))) <= WriteData;
end if;
end process;
end Behavioral;
