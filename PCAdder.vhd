library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity PCAdder is
 Port (
--PCResult: in std_logic_vector (31 downto 0) := x"00000000";
--PCAddResult: out std_logic_vector (31 downto 0) := x"00000000"
PCResult: in std_logic_vector (31 downto 0);
PCAddResult: out std_logic_vector (31 downto 0)
);
end PCadder;

architecture Behavioral of PCadder is

begin
   PCAddResult <= PCResult + 4;

end Behavioral;
