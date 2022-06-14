library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SignExtentionMux is

 Port (in1 : in std_logic_vector (31 downto 0);
       in2 : in std_logic_vector (31 downto 0);
       in3 : in std_logic_vector (31 downto 0);
       sel : in std_logic_vector(1 downto 0);
       output : out std_logic_vector (31 downto 0)
      );
      
end SignExtentionMux;

architecture Behavioral of SignExtentionMux is
begin

MUXPro: process (in1,in2,in3,sel) begin
case sel is 
    when "00" => output <=in1;
    when "01" => output <=in2;
    when "10" => output <=in3;
    when others => output <= (others => '0');
    
end case;

end process;
end Behavioral;