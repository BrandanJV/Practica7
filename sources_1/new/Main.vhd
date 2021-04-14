----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2021 11:31:06
-- Design Name: 
-- Module Name: Main - Behavioral
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

entity Main is
  Port (clk, clr, sr, sl, s0, s1: in std_logic;
        D: in std_logic_vector(7 downto 0);
        Q: buffer std_logic_vector( 7 downto 0));
end Main;

architecture Behavioral of Main is
    component shiftRegister is
        port(SR, SL, clk, clr, S0, S1: in std_logic;
            D: in std_logic_vector(3 downto 0);
            Q:buffer std_logic_vector(3 downto 0));
    end component;
signal iD, iQ: std_logic_vector(7 downto 0);
signal iQ2: std_logic_vector(0 to 7);
begin
iD <= D;


SR1: shiftregister port map(sr => Q(4), sl => sl, clk => clk, clr => clr, S0 => S0, S1 => S1, D => iD(3 downto 0), Q => Q(3 downto 0));
SR2: shiftregister port map(sr => sr, sl => Q(3), clk => clk, clr => clr, S0 => S0, S1 => S1, D => iD(7 downto 4), Q => Q(7 downto 4));
end Behavioral;
