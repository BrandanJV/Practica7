----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2021 15:21:45
-- Design Name: 
-- Module Name: tb_main - Behavioral
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

entity tb_main is
--  Port ( );
end tb_main;

architecture Behavioral of tb_main is
    component main is 
        port(clk, clr, sr, sl, s0, s1: in std_logic;
            D: in std_logic_vector(7 downto 0);
            Q: buffer std_logic_vector( 7 downto 0));
    end component;
signal i_sr, i_sl, i_clk, i_clr, i_S0, i_S1: std_logic;
signal i_D, i_Q: std_logic_vector(7 downto 0);
begin
DUT: main port map(
    clk => i_clk,
    clr => i_clr,
    sr => i_SR,
    sl => i_sl,
    s0 => i_s0,
    s1 => i_s1,
    D => i_D,
    Q => i_Q);
    process
    begin
    wait until i_clk'event and i_clk = '1';
            i_D <= "01010101";
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '0';
            i_s0 <= '1';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '0';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '0';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '0';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '0';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '0';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '0';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '1';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '0';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '0';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '0';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '0';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '0';
            i_sr <= '0';
            i_sl <= '0';
        wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '0';
            i_sr <= '0';
            i_sl <= '0';
       wait until i_clk'event and i_clk = '1';
            i_clr <= '1';
            i_s0 <= '1';
            i_s1 <= '0';
            i_sr <= '0';
            i_sl <= '0';
       
    end process;

end Behavioral;
