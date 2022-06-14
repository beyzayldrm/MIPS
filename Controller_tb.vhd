library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Controller_tb is
end;

architecture bench of Controller_tb is

  component Controller
     Port (
      Op :   in  STD_LOGIC_VECTOR(5 downto 0);  
      Func : in  STD_LOGIC_VECTOR(5 downto 0); 
      AluSrc   : out  STD_LOGIC;
      RegDst   : out  STD_LOGIC; 
      RegWrite   : out  STD_LOGIC  :='1'; 
      MemRead    : out  STD_LOGIC := '0';
      MemWrite   : out  STD_LOGIC := '0';
      MemtoReg   : out  STD_LOGIC := '0'; 
      PcSrc       : out std_logic := '0';
      AluOp :    out STD_LOGIC_VECTOR(3 downto 0)
      );
  end component;

  signal Op: STD_LOGIC_VECTOR(5 downto 0);
  signal Func: STD_LOGIC_VECTOR(5 downto 0);
  signal AluSrc: STD_LOGIC;
  signal RegDst: STD_LOGIC;
  signal RegWrite: STD_LOGIC :='1';
  signal MemRead: STD_LOGIC := '0';
  signal MemWrite: STD_LOGIC := '0';
  signal MemtoReg: STD_LOGIC := '0';
  signal PcSrc: std_logic := '0';
  signal AluOp: STD_LOGIC_VECTOR(3 downto 0) ;

begin

  uut: Controller port map ( Op       => Op,
                             Func     => Func,
                             AluSrc   => AluSrc,
                             RegDst   => RegDst,
                             RegWrite => RegWrite,
                             MemRead  => MemRead,
                             MemWrite => MemWrite,
                             MemtoReg => MemtoReg,
                             PcSrc    => PcSrc,
                             AluOp    => AluOp );

  stimulus: process
  begin
  Op<= "000000";
  Func<="100000";
  wait for 5ns;
  
  Op<= "000000";
  Func<="100010";
  wait for 5ns;
  
  Op<= "000000";
  Func<="100100";
  wait for 5ns;
    
  Op<= "000000";
  Func<="100101";
  wait for 5ns;
  
  Op<= "000000";
  Func<="101010";
  wait for 5ns;
  
  Op<= "000000";
  Func<="000000";
  wait for 5ns;
  
  Op<= "000000";
  Func<="000010";
  wait for 5ns;
  
  Op<= "011100";
  Func<="100001";
  wait for 5ns;
  
  Op<= "011100";
  Func<="100000";
  wait for 5ns;
  
  Op<= "011100";
  Func<="000010";
  wait for 5ns;
 
  Op<= "000000";
  Func<="000110";
  wait for 5ns;
  
  
    wait;
  end process;

end;
