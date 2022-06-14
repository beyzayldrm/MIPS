library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Controller is
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
end Controller;

architecture Behavioral of Controller is

begin

process(Op,Func)
            begin
                    
            case (Op) is when  "000000" =>
            if (Func)= "100000" then --add
             AluSrc <='0';  
             RegDst<='1';   
             AluOp <="0000";
             
             elsif (Func)="100010" then --sub
             AluSrc <='0';  
             RegDst<='1';   
             AluOp <="0001";
            
             elsif (Func)="100100" then --and
             AluSrc <='0';  
             RegDst<='1';   
             AluOp <="0011";
             
             elsif (Func)="100101" then --or
             AluSrc <='0';  
             RegDst<='1';   
             AluOp <="0100";
             
             elsif (Func)="101010" then --less than
             AluSrc <='0';  
             RegDst<='1';   
             AluOp <="0101";
             
             elsif (Func)="000000" then --shift left
             AluSrc <='1';  
             RegDst<='1';   
             AluOp <="1000";
             
             elsif (Func)="000010" then --shift right
             AluSrc <='1';  
             RegDst<='1';   
             AluOp <="1001";
             
             elsif (Func)="000110" then --rotate right
             AluSrc <='0';  
             RegDst<='1';   
             AluOp <="1010";     
             end if;
                                
when  "011100" =>
             if (Func)= "100001" then --count ones
             AluSrc <='0';  
             RegDst<='1';   
             AluOp <="1011";
    
             elsif (Func)="100000" then --count zeros
             AluSrc <='0';  
             RegDst<='1';   
             AluOp <="1100";
             
             elsif (Func)="000010" then --mul
             AluSrc <='0';  
             RegDst<='1';   
             AluOp <="0010";
             end if;
when "001000" =>
             AluSrc <='1';  
             RegDst<='0';   
             AluOp <="0000";
when "001101" =>
             AluSrc <='1';  
             RegDst<='0';   
             AluOp <="0100";            
when others =>  
             AluSrc <='0';  
             RegDst<='0';   
             AluOp <="0000";        
 end case;  
 end process;  
 end Behavioral;