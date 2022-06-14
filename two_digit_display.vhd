library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity two_digit_display is
Port (
BCDin: in std_logic_vector (15 downto 0);
clk: in std_logic;
seven_segment : out std_logic_vector (6 downto 0);
anode: out std_logic_vector (3 downto 0)
);
end two_digit_display;


architecture Behavioral of two_digit_display is
signal an_number: std_logic_vector(3 downto 0) := (others => '0');
signal count: std_logic_vector (18 downto 0):= (others => '0');
signal sel: std_logic_vector(1 downto 0) := (others => '0');
begin
process(clk)
begin

if clk'event and clk = '1' then
count <= count + 1;
end if;
end process;

process(count(18))
    begin
        if count(18)'event and count(18) = '1' then
            sel <= sel + 1;
        end if;
    end process;
    

process(sel)
    begin
        case sel is
            when "00" => anode <= "1110";
                         an_number <= BCDin(3 downto 0);
            when "01" => anode <= "1101";
                         an_number <= BCDin(7 downto 4);
            when "10" => anode <= "1011";
                         an_number <= BCDin(11 downto 8);
            when "11" => anode <= "0111";
                         an_number <= BCDin(15 downto 12);
            when others => null;
        end case;
    end process;


 process(BCDin)
    begin
        case an_number is
            when "0000" => seven_segment <= "1000000"; -- 0
            when "0001" => seven_segment <= "1111001"; -- 1
            when "0010" => seven_segment <= "0100100"; -- 2
            when "0011" => seven_segment <= "0110000"; -- 3
            when "0100" => seven_segment <= "0011001"; -- 4
            when "0101" => seven_segment <= "0010010"; -- 5
            when "0110" => seven_segment <= "0000010"; -- 6
            when "0111" => seven_segment <= "1111000"; -- 7
            when "1000" => seven_segment <= "0000000"; -- 8
            when others => seven_segment <= "0010000"; -- 9
        end case;
    end process;
end Behavioral;