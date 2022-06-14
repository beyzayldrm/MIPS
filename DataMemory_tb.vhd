library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity DataMemory_tb is
end;

architecture bench of DataMemory_tb is

  component DataMemory
         Port    (    MemWrite , MemRead : in std_logic;
                      Address : in std_logic_vector(9 downto 0);
                      WriteData :in std_logic_vector(31 downto 0);
                      ReadData : out std_logic_vector(31 downto 0):= x"00000000";
                      Clk: in std_logic 
                         );
  end component;


  signal MemWrite , MemRead: std_logic;
  signal Address: std_logic_vector(9 downto 0);
  signal WriteData: std_logic_vector(31 downto 0);
  signal ReadData: std_logic_vector(31 downto 0):= x"00000000";
  signal Clk: std_logic ;


  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: DataMemory port map ( MemWrite  => MemWrite,
                             MemRead   => MemRead,
                             Address   => Address,
                             WriteData => WriteData,
                             ReadData  => ReadData,
                             Clk       => Clk 
                             );

  stimulus: process
  begin

MemWrite<='0';
MemRead<='0';
WriteData<=x"00000003";
Address<= "0000000001";
wait for 20ns;

MemWrite<='1';
MemRead<='1';
WriteData<=x"00000053";
Address<= "0000000101";
wait for 20ns;

MemWrite<='0';
MemRead<='1';
WriteData<=x"00000003";
Address<= "0000000001";
wait for 20ns;

MemWrite<='1';
MemRead<='0';
WriteData<=x"00000053";
Address<= "0000000101";
wait for 20ns;

MemWrite<='1';
MemRead<='0';
WriteData<=x"00000003";
Address<= "0000000001";
wait for 20ns;



MemWrite<='0';
MemRead<='1';
WriteData<=x"00000053";
Address<= "0000000101";
wait for 20ns;



MemWrite<='1';
MemRead<='1';
WriteData<=x"00000003";
Address<= "0000000001";
wait for 20ns;



MemWrite<='0';
MemRead<='0';
WriteData<=x"00000053";
Address<= "0000000101";
wait for 20ns;
       
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      Clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;