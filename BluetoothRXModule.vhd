library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
entity bluetooth_rx is
    generic (
        constant_number : integer := 115
    );
port (
    clk : in std_logic;
    serial_bit : in std_logic;
    validation : out std_logic;
    rx_btdata : out std_logic_vector(7 downto 0)
);
end bluetooth_rx;
architecture rtl of bluetooth_rx is
    type fsm_bt is (before_start, start_bit, data_bits,
        stop_bit, clear_all);
    signal state_next : fsm_bt := before_start;
    signal number_cycles : integer range 0 to constant_number-1 := 0;
    signal index_num : integer range 0 to 7 := 0;
    signal data_temp : std_logic_vector(7 downto 0) := (others => '0');
    signal valid_temp : std_logic := '0';
    signal connection : std_logic := '0';
begin
    btprocess : process (clk)
    begin
        if rising_edge(clk) then
            case state_next is
                when before_start =>
                    valid_temp <= '0';
                    number_cycles <= 0;
                    index_num <= 0;
                    if serial_bit = '0' then -- Start bit
                        state_next <= start_bit;
                    else
                        state_next <= before_start;
                    end if;
-- Check middle point
                when start_bit =>
                    if number_cycles = (constant_number-1)/2 then
                    if serial_bit = '0' then
                        number_cycles <= 0; -- middle is detected
                        state_next <= data_bits;
                    else
                        state_next <= before_start;
                    end if;
                    else
                        number_cycles <= number_cycles + 1;
                        state_next <= start_bit;
                    end if;
               when data_bits =>
                    if number_cycles < constant_number-1 then
                        number_cycles <= number_cycles + 1;
                        state_next <= data_bits;
                    else
                        number_cycles <= 0;
                        data_temp(index_num) <= serial_bit;
                        if index_num < 7 then 
                            index_num <= index_num + 1;
                            state_next <= data_bits;
                        else 
                            index_num <= 0;
                            state_next <= stop_bit;
                        end if;
                    end if;
-- Receive Stop bit. Stop bit = 1
                when stop_bit =>
                    if number_cycles < constant_number-1 then
                        number_cycles <= number_cycles + 1;
                        state_next <= stop_bit;
                    else 
                        valid_temp <= '1';
                        number_cycles <= 0;
                        state_next <= clear_all;
                    end if;
                when clear_all =>
                    state_next <= before_start;
                    valid_temp <= '0';
                when others =>
                    state_next <= before_start;
             end case;
            end if;
    end process btprocess;
validation <= valid_temp;
rx_btdata <= data_temp;
end rtl;
