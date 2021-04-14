----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2021 11:30:12
-- Design Name: 
-- Module Name: ShiftRegister - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ShiftRegister is
  Port (SR, SL, clk, clr, S0, S1: in std_logic;
        D: in std_logic_vector(3 downto 0);
        Q:buffer std_logic_vector(3 downto 0));
end ShiftRegister;

architecture Behavioral of ShiftRegister is
signal iD, iQ: std_logic_vector(3 downto 0);
signal iQ2: std_logic_vector(0 to 2);
begin
iD  <= D;
Q   <= iQ;
iQ2(0) <= iQ(3);
iQ2(1) <= iQ(2);
iQ2(2) <= iQ(1);
    process(clk, clr)
        begin
            if clr = '0' then
                iQ <= "0000";
                else 
                    if clk'event and clk = '1' then
                        if (S0 = '1' and S1 = '1') then
                            iQ <= iD;
                        elsif (S0 = '1' and S1 = '0') then
                            iQ <= sr & iQ2;
                        elsif(S0 = '0' and S1 = '1') then 
                            iQ <= iQ(2 downto 0) & sl;
                        else
                            iQ <= iQ;
                        end if;
                    end if; 
            end if;
    end process;
end Behavioral;





