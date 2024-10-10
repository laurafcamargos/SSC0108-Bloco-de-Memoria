library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Biblioteca necessária para to_unsigned

entity counter is
    Port (
        CLOCK_50 : in STD_LOGIC;              -- Clock de 50 MHz
        RESET : in STD_LOGIC;                 -- Reset do sistema
        read_addr : out STD_LOGIC_VECTOR(4 downto 0)  -- Endereço de leitura (5 bits para 32 endereços)
    );
end counter;

architecture Behavioral of counter is
    signal count : INTEGER := 0;
    signal addr : INTEGER := 0;
begin
    process(CLOCK_50, RESET)
    begin
        if RESET = '0' then
            count <= 0;
            addr <= 0;
        elsif rising_edge(CLOCK_50) then
            count <= count + 1;

            -- A cada 50 milhões de ciclos (1 segundo), incrementa o endereço
            if count = 50000000 then
                count <= 0;
                addr <= (addr + 1) mod 32; -- Circular para 32 endereços
            end if;
        end if;
    end process;

    read_addr <= std_logic_vector(to_unsigned(addr, 5)); -- Converte o endereço para std_logic_vector
end Behavioral;
