library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity register_file_tb is
end register_file_tb;

architecture test_bench of register_file_tb is
component register_file
port(
ReadRegister1, ReadRegister2, WriteRegister: in std_logic_vector(4 downto 0);
  --WriteRegister: in std_logic_vector(4 downto 0);
  WriteData:  in std_logic_vector(31 downto 0);
  RegWrite: in std_logic;
  ReadData1,ReadData2: out std_logic_vector(31 downto 0):= x"00000000";
  clk: in std_logic);
end component;

signal ReadRegister1, ReadRegister2, WriteRegister : std_logic_vector(4 downto 0);
signal WriteData : std_logic_vector(31 downto 0);
signal RegWrite : std_logic;
signal ReadData1, ReadData2 : std_logic_vector(31 downto 0);
signal clk : std_logic;
signal stopclock : boolean;
begin
aaa : register_file port map(
    ReadRegister1 => ReadRegister1,
	ReadRegister2 => ReadRegister2,
	WriteRegister => WriteRegister,
	WriteData => WriteData,
	RegWrite => RegWrite,
	ReadData1 => ReadData1,
	ReadData2 => ReadData2,
	clk => clk
	);
	
	Processbegin : process
	begin

        ReadRegister1 <= b"00000";
		ReadRegister2 <= b"00000";
		wait for 1ns;
        RegWrite <= '1';
		WriteRegister <= b"01010";
		WriteData <= x"365289ab";

		wait for 20ns;
		
		WriteRegister <= b"10101";
		WriteData <= x"aacfde25";
		
		wait for 20ns;

		RegWrite <= '0';

		wait for 15ns;

		ReadRegister1 <= b"01001";
		ReadRegister2 <= b"10001";
		wait for 100ns;

		stopclock <= true;
		wait;
	end process;

	clockprocess : process
	begin
		while not stopclock loop
			clk <= '0', '1' after 5ns;
			wait for 5ns;
		end loop;
		wait;
	end process;

end test_bench;
