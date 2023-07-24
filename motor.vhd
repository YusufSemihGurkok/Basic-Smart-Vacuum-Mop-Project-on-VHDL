library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity dcmotor is
    Port (
        clk : in std_logic;
        rightmotor : out STD_LOGIC_VECTOR (1 downto 0) := "00";
        leftmotor : out std_logic_vector (1 downto 0) := "00";
        distance : in std_logic_vector ( 7 downto 0)
    );
end dcmotor;
architecture Behavioral of dcmotor is
begin
    process
    begin
        wait on clk;
        if distance < "00011001" then
            rightmotor <= "10";
            leftmotor <= "01" ;
        else --others
            rightmotor <= "10";
            leftmotor <= "10";
     end if;
    end process;
end Behavioral;
