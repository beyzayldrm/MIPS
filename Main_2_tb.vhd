
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Main_2_tb is
end Main_2_tb;

architecture Behavioral of MAIN is

component InstructionMemory is
port (
 Address: in std_logic_vector(31 downto 0);
 Instruction: out  std_logic_vector(31 downto 0)
);
end component;

component ALU32Bit is
Port (
 ALUControl: in std_logic_vector (3 downto 0);
 A: in std_logic_vector (31 downto 0) := x"00000000";
 B: in std_logic_vector (31 downto 0):= x"00000000";
 ALUOut : out std_logic_vector(31 downto 0);
 ZERO: out std_logic
 );
end component;

component DataMemory is
 Port(    
 MemWrite : in std_logic;
 MemRead : in std_logic;
 Address : in std_logic_vector(31 downto 0):= x"00000000";
 WriteData :in std_logic_vector(31 downto 0);
 ReadData : out std_logic_vector(31 downto 0):= x"00000000";
 clk: in std_logic 
);                                            
end component;

component Mux32BitTo1 is
	port (
		inA : in std_logic_vector(31 downto 0);
		inB : in std_logic_vector(31 downto 0);
		sel : in std_logic;
		output : out std_logic_vector(31 downto 0));
end component;

component PCAdder is
 Port (
PCResult: in std_logic_vector (31 downto 0);
PCAddResult: out std_logic_vector (31 downto 0)
);
end component;

component ProgramCounter is
	port (
		Address : in std_logic_vector(31 downto 0);
		reset: in std_logic;
		clk : in std_logic;
		PCResult : out std_logic_vector(31 downto 0));
end component;

component SignExtension is
	port (
		INPUT : in std_logic_vector(15 downto 0);
		OUTPUT : out std_logic_vector(31 downto 0));
end component;

component register_file is
  Port(
  ReadRegister1, ReadRegister2, WriteRegister: in std_logic_vector(4 downto 0);
  WriteData:  in std_logic_vector(31 downto 0);
  RegWrite: in std_logic;
  ReadData1,ReadData2: out std_logic_vector(31 downto 0):= x"00000000";
  clk: in std_logic
  );
end component;

component MUX4bit is
Port (    
           inA   : in  STD_LOGIC_VECTOR (4 downto 0);
           inB   : in  STD_LOGIC_VECTOR (4 downto 0);
            sel : in  STD_LOGIC;
           output  : out STD_LOGIC_VECTOR (4 downto 0)
 );
end component;


component Controller is
   Port (
    FUNC ,OP :   in  STD_LOGIC_VECTOR(5 downto 0); 
    ALUSrc   : out  STD_LOGIC;
    RegDst   : out  STD_LOGIC; 
    RegWrite   : out  STD_LOGIC  :='1'; 
    MemRead    : out  STD_LOGIC := '0';
    MemWrite   : out  STD_LOGIC := '0';
    MemtoReg   : out  STD_LOGIC := '0'; 
    PCSrc       : out std_logic := '0';
    ALUOp :    out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

--signal Address:  std_logic_vector(31 downto 0):= x"00000000";
--signal Instruction: std_logic_vector(31 downto 0);
--signal ALUControl:  std_logic_vector (3 downto 0);
--signal A:  std_logic_vector (31 downto 0) := x"00000000";
--signal B:  std_logic_vector (31 downto 0):= x"00000000";
--signal ALUOut : std_logic_vector(31 downto 0);
--signal ZERO:  std_logic;
--signal MemWrite :  std_logic;
--signal MemRead :  std_logic;
--signal WriteData : std_logic_vector(31 downto 0);
--signal ReadData :  std_logic_vector(31 downto 0):= x"00000000";
--signal inA :  std_logic_vector(31 downto 0);
--signal inB :  std_logic_vector(31 downto 0);
--signal sel :  std_logic;
--signal output_mux :  std_logic_vector(31 downto 0);
--signal PCResult:  std_logic_vector (31 downto 0);
--signal PCAddResult:  std_logic_vector (31 downto 0)
--Address : in std_logic_vector(31 downto 0);
--		reset: in std_logic;
--		clk : in std_logic;
--		PCResult : out std_logic_vector(31 downto 0));





end Behavioral;
