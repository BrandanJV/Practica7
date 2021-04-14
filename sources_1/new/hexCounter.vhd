----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2021 15:45:32
-- Design Name: 
-- Module Name: hexCounter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;	-- add to do arithmetic operations


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hexCounter is
    Port (clk, ld, ud, ent, enp: in std_logic;
            D: in std_logic_vector( 3 downto 0);
            Rco: out std_logic;
            Q: buffer std_logic_vector(3 downto 0));
end hexCounter;

architecture Behavioral of hexCounter is
signal sD: std_logic_vector(3 downto 0):= (others => '0');
begin
Q   <= sD;
Rco <= '1' when (ud = '0' and sD = x"0") or (ud = '1' and sD = x"F")
        else '0';
    process(clk)
    begin
        if clk'event and clk = '1' then
            if ld = '0' then
                sD <= D;
            else
                if (ent = '0' and enp = '0') then
                    if(ud = '0') then 
                        sD <= sD - '1';
                    elsif(ud = '1') then
                        sD <= sD + '1';
                    end if;
                else 
                    sD <= sD;
                end if;
            end if;            
        end if;                            
    end process;
end Behavioral;








