library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_arith.all;
entity ultrasonicsensor is
    Port ( sensordistance : out std_logic_vector(7 downto 0);
         Trigger : out std_logic;
         Echo : in std_logic;
         clk : in std_logic;
         stop : in std_logic);
end ultrasonicsensor;
architecture Behavioral of ultrasonicsensor is
    signal go_back: integer:=0;
    signal clk_new: std_logic;
begin
    process(clk, stop)
        variable cont: integer:=0;
    begin
        if (stop='1') then
            cont:=0;
            clk_new <= '0';
        elsif rising_edge(clk) then
            cont := cont + 1;
            if cont = 100 then
                cont:=0;
            end if;
            if cont < 50 then
                clk_new <= '1';
            else
                clk_new <= '0';
            end if;
        end if;
    end process;
    process(clk_new)
        variable count1,count2: integer:=0;
        variable controller :std_logic:='1';
    begin
        if rising_edge(clk_new) then
            if(count1=0) then
                Trigger<='1';
            elsif(count1=10) then
                Trigger<='0';
                controller:='1';
            elsif(count1=100000) then
                count1:=0;
                Trigger<='1';
            end if;
            count1:=count1+1;
            if(Echo = '1') then
                count2:=count2+1;
            elsif(Echo = '0' and controller='1')then
                go_back <= count2;
                count2 :=0 ;
                controller :='0';
            end if;
            sensordistance <= CONV_STD_LOGIC_VECTOR((go_back/58),8); ---(340*10^2)/10^6= 0.034= 1/29 approximately, 1/29*1/2=1/58
        end if;
    end process;
end Behavioral;
