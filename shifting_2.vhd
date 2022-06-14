library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shifting_2 is

  Port (
        shifting_in : in std_logic_vector(31 downto 0);
        shifting_out : out std_logic_vector(31 downto 0)
        );
end shifting_2;

architecture Behavioral of shifting_2 is
begin
shifting_out <=  shifting_in(29 downto 0) & "00";

end Behavioral;
