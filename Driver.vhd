library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity motordriver is
Port (
    bluetoothData : in STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    rightmotor : out STD_LOGIC_VECTOR (1 downto 0);
    leftmotor : out std_logic_vector (1 downto 0)   
);
end motordriver;


architecture Behavioral of motordriver is
begin
process
begin
wait on bluetoothData;
if(bluetoothData = "00000000") then --forward
    rightmotor <= "10";
    leftmotor <= "10";
elsif(bluetoothData = "11111000") then --left
    rightmotor <= "01";
    leftmotor <= "10";
elsif(bluetoothData = "10000000") then --right
    rightmotor <= "10";
    leftmotor <= "01";
elsif(bluetoothData = "11111111") then --backward
    rightmotor <= "01";
    leftmotor <= "01";
else --others
    rightmotor <= "00";
    leftmotor <= "00";
end if;
end process;
end Behavioral;
