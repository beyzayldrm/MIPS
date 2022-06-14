
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity adder_2in is

 Port  (input1 : in std_logic_vector(31 downto 0)  := (others => '0');
        input2 : in std_logic_vector(31 downto 0) := (others => '0');
        summation : out std_logic_vector (31 downto 0)
        );
end adder_2in;
architecture Behavioral of adder_2in is
begin
summation <= std_logic_vector(unsigned(input1) + unsigned(input2));
end Behavioral;
