library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
entity bluetoothtop is
port( clk, Rx : in std_logic;
    RxData: out std_logic_vector(7 downto 0);
    TxData: out std_logic
);
end bluetoothtop;

architecture bhv of bluetoothtop is
    component bluetooth_rx is
        generic (
            constant_number : integer := 115
);
port (
    clk : in std_logic;
    serial_bit : in std_logic;
    validation : out std_logic;
    rx_btdata : out std_logic_vector(7 downto 0)
);
end component bluetooth_rx;

    constant clock_per_bit : integer := 87;
begin
    bluetooth_rx_initial : bluetooth_rx
        generic map (
            constant_number => clock_per_bit
)
    port map (
        clk => clk,
        serial_bit => rx,
        validation => Txdata,
        rx_btdata => RxData 
);
end bhv;
