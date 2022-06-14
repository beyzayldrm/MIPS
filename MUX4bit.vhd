library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MUX4bit is
Port (     
           inA   : in  STD_LOGIC_VECTOR (4 downto 0);
           inB   : in  STD_LOGIC_VECTOR (4 downto 0);
           sel : in  STD_LOGIC;
           output  : out STD_LOGIC_VECTOR (4 downto 0)
 );
end MUX4bit;

architecture Behavioral of MUX4bit is
begin
mx : process (inA,inB,sel) begin
case sel is 
    when '0' => output <= inA;
    when '1' => output <= inB;
    when others => output <= (others => '0');
end case;

end process;
end Behavioral;