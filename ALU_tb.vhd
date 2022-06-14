library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
--use ieee.numeric_bit;

entity ALU_tb is
end ALU_tb;

architecture test_gate of ALU_tb is
component ALU32bit is
port(
ALUControl: in std_logic_vector (3 downto 0);
 A: in std_logic_vector (31 downto 0) := x"00000000";
 B: in std_logic_vector (31 downto 0):= x"00000000";
 ALUOut : out std_logic_vector(31 downto 0);
 ZERO: out std_logic
 );
 end component;
signal ALUControl: std_logic_vector (3 downto 0);
signal A: std_logic_vector (31 downto 0);
signal B: std_logic_vector (31 downto 0);
signal ALUOut: std_logic_vector (31 downto 0);
signal ZERO: std_logic;
begin
uu: ALU32Bit port map(
A => A,
B => B, 
ALUControl => ALUControl,
ALUOut => ALUOut,
ZERO => ZERO
);

 uuu: process begin
 A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "0000";
 wait for 10ns;

 A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "0001";
 wait for 10ns;
 
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "0010";
 wait for 10ns;
 
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "0011";
 wait for 10ns;
 
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "0100";
 wait for 10ns;
 
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "0101";
 wait for 10ns;
 
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "0110";
 wait for 10ns;
 
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "0111";
 wait for 10ns;
 
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "1100";
 
 wait for 10ns;
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "1011";

 A <= x"FFFF0000";
 B <= x"0000000F";
 ALUControl <= "0000"; 
  wait for 10ns;
  
 A <= x"FFFF0000";
 B <= x"0000000F";
 ALUControl <= "0001";
  wait for 10ns;
  
 A <= x"FFFF0000";
 B <= x"0000000F";
 ALUControl <= "0010";
  wait for 10ns;
  
 A <= x"FFFF0000";
 B <= x"0000000F";
 ALUControl <= "0011";
  wait for 10ns;
  
 A <= x"FFFF0000";
 B <= x"0000000F";
 ALUControl <= "0100";
  
 A <= x"FFFFFFFF";
 B <= x"00000001";
 ALUControl <= "0000";
  wait for 10ns; 
   
 A <= x"FFFFFFFF";
 B <= x"00000001";
 ALUControl <= "0001";
  wait for 10ns;
     
 A <= x"FFFFFFFF";
 B <= x"FFFFFFFF";
 ALUControl <= "0000";
  wait for 10ns;
     
 A <= x"FFFFFFFF";
 B <= x"FFFFFFFF";
 ALUControl <= "0001";
  wait for 10ns;
     
 A <= x"FFFFFFFF";
 B <= x"FFFFFFFF";
 ALUControl <= "0010";
  wait for 10ns;
       
 A <= x"FFFFFFFF";
 B <= x"FFFFFFFF";
 ALUControl <= "0100";
  wait for 10ns;
       
 A <= x"FFFFFFFF";
 B <= x"FFFFFFFF";
 ALUControl <= "0110";
  wait for 10ns;
       
 A <= x"FFFFFFFF";
 B <= x"FFFFFFFF";
 ALUControl <= "0111";
  wait for 10ns;
  
      
 A <= x"00000FED";
 B <= x"00000005";
 ALUControl <= "1000";
  wait for 10ns;
       
 A <= x"00000FED";
 B <= x"00000005";
 ALUControl <= "1001";
  wait for 10ns;
       
 A <= x"00000FED";
 B <= x"00000005";
 ALUControl <= "1010";
  wait for 10ns;
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "1100";
 
 wait for 10ns;
  A <= x"00000064";
 B <= x"00000056";
 ALUControl <= "1011";
 wait;
 end process;
 end test_gate;