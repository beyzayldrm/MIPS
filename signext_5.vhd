library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signExtention_5Bit is
generic(shifti5Bit : integer := 5;
        bitnum : integer :=32
        );

 Port (in_shift5 : in std_logic_vector(shifti5Bit -1 downto 0) ;
       out_shift5 : out std_logic_vector(bitnum -1 downto 0) 
        );
end signExtention_5Bit;

architecture Behavioral of signExtention_5Bit is

begin
out_shift5 <= (bitnum-shifti5Bit-1  downto 0 => '0') & in_shift5;
end Behavioral;