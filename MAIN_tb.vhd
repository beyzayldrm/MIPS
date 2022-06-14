library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

 entity MAIN_tb is 
 end MAIN_tb;
 architecture Behavioral of MAIN_tb is
component MAIN is
Port (
clk: in std_logic;
reset: in std_logic;
anode: out std_logic_vector (3 downto 0);
seven_segment : out std_logic_vector(6 downto 0);
Output: out std_logic_vector(31 downto 0)
);
end component;
signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal Output : std_logic_vector(31 downto 0) :=(others => '0');
signal anode:  std_logic_vector (3 downto 0);
signal seven_segment : std_logic_vector(6 downto 0);
constant period: time := 10ns;

begin
PortMap: MAIN 
  Port map (
clk => clk,
reset => reset,
anode => anode,
seven_segment => seven_segment,
Output => Output
);
         
clock_process : process begin
    clk <= '0';
    wait for period/2;
    clk <= '1';
    wait for period/2;
end process;

reset_process : process begin
reset <= '1';
wait for 10ns;

reset <= '0';
wait for 500ns;

end process;
end Behavioral;