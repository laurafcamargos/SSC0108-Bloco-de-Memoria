LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ram32bits IS
    PORT (
        address  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- 5-bit address for 32 locations
        clock    : IN  STD_LOGIC;
        dataIn   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input data
        wrt      : IN  STD_LOGIC; -- write enable signal
        --dataOut  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit output data
        hex0     : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- data out
        hex1     : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- data in
        hex2     : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- mem digit 1
        hex3     : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)  -- mem digit 2
    );
END ram32bits;

ARCHITECTURE Behavior OF ram32bits IS
    TYPE mem IS ARRAY(0 TO 31) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL memory_array : mem := (others => (others => '0'));

    FUNCTION to_7_segment(data : STD_LOGIC_VECTOR(3 DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS
    BEGIN
        CASE data IS
            WHEN "0000" => RETURN "0000001"; -- 0
            WHEN "0001" => RETURN "1001111"; -- 1
            WHEN "0010" => RETURN "0010010"; -- 2
            WHEN "0011" => RETURN "0000110"; -- 3
            WHEN "0100" => RETURN "1001100"; -- 4
            WHEN "0101" => RETURN "0100100"; -- 5
            WHEN "0110" => RETURN "0100000"; -- 6
            WHEN "0111" => RETURN "0001111"; -- 7
            WHEN "1000" => RETURN "0000000"; -- 8
            WHEN "1001" => RETURN "0001100"; -- 9
            WHEN "1010" => RETURN "0001000"; -- A
            WHEN "1011" => RETURN "1100000"; -- B
            WHEN "1100" => RETURN "0110001"; -- C
            WHEN "1101" => RETURN "1000010"; -- D
            WHEN "1110" => RETURN "0110000"; -- E
            WHEN "1111" => RETURN "0111000"; -- F
            WHEN OTHERS => RETURN "1111111"; -- Blank or error
        END CASE;
    END FUNCTION;

    FUNCTION bit_to_7_segment(data : STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
    BEGIN
        CASE data IS
            WHEN '0' => RETURN "0000001"; -- 0
            WHEN '1' => RETURN "1001111"; -- 1
            WHEN OTHERS => RETURN "1111111"; -- Blank or error
        END CASE;
    END FUNCTION;

BEGIN
    PROCESS (clock)
    BEGIN
        IF rising_edge(clock) THEN
            IF wrt = '1' THEN
                memory_array(CONV_INTEGER(address)) <= dataIn;
            END IF;
            --dataOut <= memory_array(CONV_INTEGER(address)); -- Update the dataOut with the read value
            hex0 <= to_7_segment(memory_array(CONV_INTEGER(address))); -- data out
				hex1 <= to_7_segment(dataIn); -- data in
				hex2 <= to_7_segment(address(3 DOWNTO 0)); -- Display lower 4 bits of address
				hex3 <= bit_to_7_segment(address(4)); -- Display highest bit of address as a single bit
        END IF;
		  
    END PROCESS;
END Behavior;
