library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUMUX is
generic(
        bitnum : integer := 32
        );
        
 Port (
        ReadData1 : in std_logic_vector(bitnum-1 downto 0);
        ReadData2 : in std_logic_vector(bitnum-1 downto 0);
        ALUOper : in std_logic_vector(3 downto 0);
        RD1Out : out std_logic_vector(bitnum-1 downto 0)
        );

end ALUMUX;
architecture Behavioral of ALUMUX is
begin
process (ReadData1,ReadData2,ALUOper) begin
    if (ALUOper = "1000") or  (ALUOper = "1001") then  --ALUOp codes for srl sll
        RD1Out <= ReadData2;
    else
        RD1Out  <= ReadData1;
    end if;
end process;

end Behavioral;
