library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
entity top is
port(   clk1, Rx1 : in std_logic;
        RxData1: out std_logic_vector(7 downto 0);
        Tx1Data: out std_logic;
        Trigger1 : out std_logic;
        Echo : in std_logic;
        rst : in std_logic;
        sensordistance : out std_logic_vector (7 downto 0);
        output1: out std_logic_vector (1 downto 0);
        output2: out std_logic_vector (1 downto 0);
        red: out std_logic ;
        blue: out std_logic ;
        green: out std_logic ;
        bluetoothmode : in std_logic
);
end top;


architecture Behavioral of top is
signal temp1 : std_logic_vector (7 downto 0) := (others => '0');
signal temp2 : std_logic_vector ( 1 downto 0);
signal temp3: std_logic_vector (1 downto 0);
signal temp4: std_logic_vector (7 downto 0);
signal temp5: std_logic_vector ( 1 downto 0);
signal temp6: std_logic_vector ( 1 downto 0);
signal temp7: std_logic_vector ( 7 downto 0);

    COMPONENT bluetoothtop is
        port (
            clk, Rx : in std_logic;
            RxData: out std_logic_vector(7 downto 0);
            TxData: out std_logic );
    end component bluetoothtop;
    COMPONENT motordriver is
        port (
            bluetoothData : in STD_LOGIC_VECTOR (7 downto 0) ;
            rightmotor : out STD_LOGIC_VECTOR (1 downto 0);
            leftmotor : out std_logic_vector (1 downto 0)
--            distance : in std_logic_vector ( 7 downto 0)
        );
    end component;
    component ultrasonicsensor is
        Port ( sensordistance : out std_logic_vector(7 downto 0);
             Trigger : out std_logic;
             Echo : in std_logic;
             clk : in std_logic;
             stop : in std_logic);
    end component;
    COMPONENT dcmotor is 
          Port (
        clk : in std_logic;
        rightmotor : out STD_LOGIC_VECTOR (1 downto 0) := "00";
        leftmotor : out std_logic_vector (1 downto 0) := "00";
        distance : in std_logic_vector ( 7 downto 0)
        );
     end component;
begin
    
    bluetooth: bluetoothtop Port map(
        clk => clk1,
        rx=> rx1,
        rxdata => temp1,
        txData => tx1Data );
    motor_driver : motordriver Port map(
        bluetoothData => temp1,
        rightmotor => temp2,
        leftmotor => temp3
        );
    sensorr: ultrasonicsensor port map(
        sensordistance => sensordistance,
        echo => echo,
        clk => clk1,
        stop => rst,
        trigger => Trigger1);

     nonbluetoothmotor : dcmotor Port map(
        clk => clk1,
        rightmotor => temp5,
        leftmotor => temp6,
        distance => temp7
        );
    process
    begin
        if (bluetoothmode = '1') then
            output1<=temp2;
            output2<=temp3;
        else
            output1<= temp5;
            output2<= temp6;
        end if;        
        rxdata1 <= temp1;
        sensordistance <= temp7;
        if (temp7 < "00011001") then -- if distance is smaller than 25cm red led will light
            red <= '1';
            blue <= '0';
            green <= '1';
        elsif (temp7 < "00110010") then -- if distance is smaller than 50cm blue led will light
            blue <= '1';
            green <= '1';
            red <= '0';
        else
            green <= '0'; -- if distance is smaller than 75cm green led will light
            red <= '1';
            blue <= '1';
        end if;

    end process;
end Behavioral;
