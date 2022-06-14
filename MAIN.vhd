library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity MAIN is
generic(
        bitnum : integer :=32
        );
Port (
clk: in std_logic;
reset: in std_logic;
anode: out std_logic_vector (3 downto 0);
seven_segment : out std_logic_vector(6 downto 0);
Output: out std_logic_vector(31 downto 0)
);
end MAIN;

architecture Behavioral of MAIN is

component InstructionMemory is
port (
 clk: in std_logic;
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

component signExtention_5Bit is
generic(shifti5Bit : integer := 5;
        bitnum : integer :=32
        );

 Port (in_shift5 : in std_logic_vector(shifti5Bit -1 downto 0) ;
       out_shift5 : out std_logic_vector(bitnum -1 downto 0) 
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

component two_digit_display 
Port (
BCDin: in std_logic_vector (15 downto 0);
clk: in std_logic; 
seven_segment : out std_logic_vector (6 downto 0);
anode: out std_logic_vector (3 downto 0)
);
end component;

component clkdiv is
Port (
  clk: in std_logic;
  rst: in std_logic; 
  clk_out: out std_logic
     );
end component;

component Controller is
   Port (
    FUNC ,OP :   in  STD_LOGIC_VECTOR(5 downto 0); 
    ALUSrc   : out  STD_LOGIC_VECTOR(1 downto 0);
    RegDst   : out  STD_LOGIC; 
    RegWrite   : out  STD_LOGIC  :='1'; 
    MemRead    : out  STD_LOGIC := '0';
    MemWrite   : out  STD_LOGIC := '0';
    MemtoReg   : out  STD_LOGIC := '0'; 
    PCSrc       : out std_logic := '0';
    ALUOp :    out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

--component clkdiv is
--Port (
--  clk: in std_logic;
--  rst: in std_logic; 
--  clk_out: out std_logic
--     );
--end component;

component adder_2in is
 Port  (input1 : in std_logic_vector(31 downto 0)  := (others => '0');
        input2 : in std_logic_vector(31 downto 0) := (others => '0');
        summation : out std_logic_vector (31 downto 0)
        );
end component;

 component SignExtentionMux is
 port (in1 : in std_logic_vector (31 downto 0);
       in2 : in std_logic_vector (31 downto 0);
       in3 : in std_logic_vector (31 downto 0);
       sel : in std_logic_vector(1 downto 0);
       output : out std_logic_vector (31 downto 0)
      );
      
end component;

component ALUMUX is
generic(
        bitnum : integer := 32
        );
        
 Port (
        ReadData1 : in std_logic_vector(bitnum-1 downto 0);
        ReadData2 : in std_logic_vector(bitnum-1 downto 0);
        ALUOper : in std_logic_vector(3 downto 0);
        RD1Out : out std_logic_vector(bitnum-1 downto 0)
        );

end component;
component shifting_2 is

  Port (
        shifting_in : in std_logic_vector(31 downto 0);
        shifting_out : out std_logic_vector(31 downto 0)
        );
end component;

signal PCAddress: std_logic_vector(31 downto 0);
signal PCResult: std_logic_vector(31 downto 0);
signal Instruction_rom:  std_logic_vector(31 downto 0);
signal RegDst: std_logic;
signal RegisterWriteAddress:  std_logic_vector(4 downto 0);
signal RegisterWriteData:  std_logic_vector(31 downto 0);
signal Reg_Read_Write:std_logic;
signal RegiRead1, RegiRead2:  std_logic_vector(31 downto 0);
signal SignExtOut, SigExtShift:  std_logic_vector(31 downto 0);
signal ALUSrc: std_logic_vector (1 downto 0);
signal ALUInput1, ALUInput2:  std_logic_vector(31 downto 0);
signal ALUSignedInput:  std_logic_vector(31 downto 0);
signal ALUControl:  std_logic_vector(31 downto 0);
signal ALUOut:  std_logic_vector(31 downto 0);
signal ZERO: std_logic;
signal MemWrite, MemRead: std_logic;
signal MemoryOut:  std_logic_vector(31 downto 0); 
signal MemorytoRegister: std_logic;
signal PCSrc: std_logic;
signal PCAddOut: std_logic_vector(31 downto 0);
signal PCAddALUOut: std_logic_vector(31 downto 0);
signal ALUOp : std_logic_vector(3 downto 0);
--signal shiftingcontrol: std_logic;
signal FOUR : std_logic_vector(2 downto 0):= "100";
--signal shiftingextend: std_logic_vector(31 downto 0):= x"00000000";
signal out_7: std_logic_vector(6 downto 0);
signal s4: std_logic_vector(5 downto 0);
--signal anode: std_logic_vector (3 downto 0);
signal sum_out : std_logic_vector(31 downto 0) := (others => '0');
signal signextmuxout: std_logic_vector(31 downto 0);
signal clkout: std_logic;
signal SignExtded : std_logic_vector(31 downto 0);
signal RD1Out : std_logic_vector(31 downto 0);
signal ALUIN2 : std_logic_vector(31 downto 0);

begin

--PCAddMuxModule: MUX port map(
ControllerModule: Controller port map (FUNC => Instruction_rom (5 downto 0),OP => Instruction_rom(31 downto 26), ALUSrc=> ALUSrc, RegDst => RegDst, RegWrite => Reg_Read_Write, MemRead => MemRead, MemWrite => MemWrite, MemToReg => MemoryToRegister, PCSrc => PCSrc, ALUOp => ALUOp);
--shiftingby2: SigExtShift <= SignExtOut(29 downto 0) & "00";
shitfmodule: shifting_2 port map (shifting_in => SignExtOut, shifting_out => SigExtShift);
addder_2inmodule: adder_2in Port map ( input1 => PCAddOut, input2 => SigExtShift, summation => sum_out);
MUXPCModule: MUX32BitTo1 port map (inA => PCAddOut, inB => sum_out, sel => PCSrc, output => PCAddress);
PCModule: ProgramCounter port map (Address => PCAddress, reset => reset, clk => clk, PCResult =>PCResult);
PCAdderMod: PCAdder port map (PCResult => PCResult, PCAddResult => PCAddOut);
--sum4: PCResult <= PCResult + 4;
--sum4: PCAddALUOut <= SigExtShift + 4;
ROM: InstructionMemory port map ( clk => clk, Address => PCResult, Instruction => Instruction_rom);
muxRegistermodule: MUX4bit port map (inA => Instruction_rom(20 downto 16), inB => Instruction_rom(15 downto 11), sel => RegDst, output => RegisterWriteAddress);
registerModule: register_file port map (ReadRegister1 => Instruction_rom(25 downto 21), ReadRegister2 => Instruction_rom(20 downto 16), WriteRegister => RegisterWriteAddress, WriteData => RegisterWriteData, RegWrite => Reg_Read_Write, ReadData1 => RegiRead1, ReadData2 => RegiRead2, clk => clk);
signExtenmodule: SignExtension port map(input => Instruction_rom(15 downto 0), output => SignExtOut);
--signextregister: SignExtension port map(input => Instruction_rom(15 downto 0), output => SignExtOut);

SignExtentionforMUX: signExtention_5Bit
generic map( shifti5Bit => 5, bitnum => bitnum)
 Port map(in_shift5 => Instruction_rom(10 downto 6),out_shift5 => SignExtded);
 
--signextMUX: MUX32BitTo1 port map (inA => RegiRead2, inB => SignExtOut, sel => PCSrc, output => signextmuxout);
SignExtentMx: SignExtentionMux port map(in1 => RegiRead2,in2 => SignExtOut,in3 => SignExtded,sel => ALUSrc,output => ALUIN2);
 
--ALUshiftedModule: Mux32BitTo1 port map(inA => ALUSignedInput, inB => shiftingextend, sel => ControlShift, output => ALUBinput);
--ALURegMuxModule: MUX32BitTO1 port map (inA => RegiRead1, inB=> signextmuxout, sel => ALUSrc, output => ALUSignedInput );
--ShftMux: ALUMUX generic map( bitnum => bitnum) Port map (ReadData1 => RegiRead1,ReadData2 => RegiRead2,ALUOper => ALUOp,RD1Out => RD1Out);
ALUModule: ALU32Bit port map (A => RegiRead1, B => ALUIN2, ALUControl => ALUOp, ALUOut => ALUOut, ZERO => ZERO);
DataMemoryModule:  DataMemory port map (Address => ALUOut, WriteData => RegiRead2, MemWrite => MemWrite, MemRead=> MemRead, ReadData => MemoryOut, clk => clk);
DataMemoryMux: MUX32BitTo1 port map (inA => ALUOut, inB => MemoryOut, sel => MemorytoRegister, output => RegisterWriteData);
CLKD: clkdiv port map(clk => clk, rst => reset, clk_out => clkout );
Twodigitdisplay: two_digit_display port map(BCDin => RegisterWriteData(15 downto 0), clk => clkout, seven_segment => seven_segment, anode => anode);
--clkdividermodule: clkdiv port map (clk => clk, rst => reset, clk_out=> clk_out);
--clk <= clk_out;
Output <= RegisterWriteData;
end Behavioral;