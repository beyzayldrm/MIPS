library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use ieee.numeric_bit;

entity ALU32Bit is
Port (
 ALUControl: in std_logic_vector (3 downto 0);
 A: in std_logic_vector (31 downto 0) := x"00000000";
 B: in std_logic_vector (31 downto 0):= x"00000000";
 ALUOut : out std_logic_vector(31 downto 0);
 ZERO: out std_logic
 );
end ALU32Bit;

architecture Behavioral of ALU32Bit is
signal ALUResult: std_logic_vector(31 downto 0);
signal Num: integer;
begin

process (A,B,ALUControl,Num)
  variable count0,count1 : unsigned(31 downto 0) := x"00000000";
   begin
   
case (conv_integer(B(10 downto 6)))>31 is
when true => 
Num<= conv_integer(B(10 downto 6)) rem 32;
when others => Num <=conv_integer(B(10 downto 6));
end case;

case (ALUControl) is 
when ("0000") =>
      ALUResult <= A + B;
      
when ("0001") => 
      ALUResult <= A - B;
      
when ("0010")=>
     ALUResult <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),32));
     
when ("0011") =>
     ALUResult <= A and B;
     
when ("0100") =>
     ALUResult <= A or B;
     
when ("0101") =>
     if (A<B) then
     ALUResult <= x"00000001";
     elsif (A>B) then ALUResult <= x"00000000";
 end if;
 
when ("0110") =>
  if (A = B) then ALUResult <= x"00000001";
end if;

when ("0111") =>
 if (A /= B) then ALUResult <= x"00000000";
 end if;
 
when ("1000") =>
-- left shift
if (to_integer(unsigned(B(4 downto 0))) < 32) then
 ALUResult(to_integer(unsigned(B(4 downto 0))) - 1 downto 0) <= (others => '0');
 ALUResult(31 downto to_integer(unsigned(B(4 downto 0)))) <= A(31 - to_integer(unsigned(B(4 downto 0))) downto 0);
else
 ALUResult <= (others => '0');
end if;

when ("1001") =>
--right shift
 if (to_integer(unsigned(B(4 downto 0))) < 32) then
  ALUResult(31 downto 32 - to_integer(unsigned(B(4 downto 0)))) <= (others => '0');
  ALUResult(31 - to_integer(unsigned(B(4 downto 0))) downto 0) <= A(31 downto to_integer(unsigned(B(4 downto 0))));
 else
  ALUResult <= (others => '0');
 end if;
 
when ("1010") =>
---- rotate right

ALUResult <= std_logic_vector(unsigned(A) ror to_integer(unsigned(B)));

 when "1011" => -- count ones
   count1 := x"00000000";  
    for i in 0 to 31 loop  
        if(A(i) = '1') then
            count1 := count1 + 1;
        end if;
    end loop;
    ALUResult <= std_logic_vector(count1);
   
  when "1100" => -- count zeros
   count0 := x"00000000";  
    for i in 0 to 31 loop  
        if(A(i) = '0') then
            count0 := count0 + 1;
        end if;
    end loop;
    ALUResult <= std_logic_vector(count0);
      
      
when others => ALUResult <= A + B ; 
end case;
end process;

 ALUOut <= ALUResult; -- ALU out
 
 process(ALUResult)
 begin
 if ALUResult = x"00000000" then
 Zero <= '1';
 else Zero <= '0';
 end if;
 end process;
 
end Behavioral;