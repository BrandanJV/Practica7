----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2021 11:53:04
-- Design Name: 
-- Module Name: mainCounter - Behavioral
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

entity mainCounter is
    Port (clk, ud, ent, enp: in std_logic;
            D: in std_logic_vector( 7 downto 0);
            Dan, Dca: out std_logic_vector(7 downto 0);  -- Dan: Habilitador de anodos, Dca: Habilitador catodos
            TC: out std_logic;
            Q: buffer std_logic_vector(7 downto 0));
end mainCounter;

architecture Behavioral of mainCounter is

    component hexCounter is 
        Port (clk, ld, ud, ent, enp: in std_logic;
            D: in std_logic_vector( 3 downto 0);
            Rco: out std_logic;
            Q: buffer std_logic_vector(3 downto 0));
    end component;
    
    component displayDriver is
        port(ck : in  std_logic;                          -- 100MHz system clock
			number : in  std_logic_vector (63 downto 0); -- eight digit number to be displayed
			seg : out  std_logic_vector (7 downto 0);    -- display cathodes
			an : out  std_logic_vector (7 downto 0));    -- display anodes (active-low, due to transistor complementing));
    end component;
    
signal d7s: std_logic_vector(63 downto 0):= "1111111111111111111111111111111111111111111111110000000000000000";  
signal rco, internal_clk, ld1, ld2, ent_enp, nor1, nor2, and1, and2: std_logic; 
signal internalD: std_logic_vector(3 downto 0);
signal internalQ: std_logic_vector(7 downto 0);
signal cnt: integer := 0;
begin
--Divisor de frecuencia
process(clk)
begin
    if clk'event and clk ='1' then
        cnt <= cnt + 1;
        if(cnt = 10000000) then 
            cnt <= 0;
        end if;
        case (internalQ(3 downto 0)) is
            when "0000" => d7s(7 downto 0) <= "11000000";
            when "0001" => d7s(7 downto 0) <= "11111001";
            when "0010" => d7s(7 downto 0) <= "10100100";
            when "0011" => d7s(7 downto 0) <= "10110000";
            when "0100" => d7s(7 downto 0) <= "10011001";
            when "0101" => d7s(7 downto 0) <= "10010010";
            when "0110" => d7s(7 downto 0) <= "10000010";
            when "0111" => d7s(7 downto 0) <= "11111000";
            when "1000" => d7s(7 downto 0) <= "10000000";
            when "1001" => d7s(7 downto 0) <= "10010000";
            when others => d7s(7 downto 0) <= "11111111";
        end case;
        case (internalQ(7 downto 4)) is
            when "0000" => d7s(15 downto 8) <= "11000000";
            when "0001" => d7s(15 downto 8) <= "11111001";
            when "0010" => d7s(15 downto 8) <= "10100100";
            when "0011" => d7s(15 downto 8) <= "10110000";
            when "0100" => d7s(15 downto 8) <= "10011001";
            when "0101" => d7s(15 downto 8) <= "10010010";
            when "0110" => d7s(15 downto 8) <= "10000010";
            when "0111" => d7s(15 downto 8) <= "11111000";
            when "1000" => d7s(15 downto 8) <= "10000000";
            when "1001" => d7s(15 downto 8) <= "10010000";
            when others => d7s(15 downto 8) <= "11111111";
        end case;
    end if;
end process;

internal_clk <= '1' when cnt = 10000000
        else '0'; 

Q <= internalQ;

internalD(0) <= ud xor D(0);
internalD(3) <= ud xor D(0);
internalD(1) <= D(1);
internalD(2) <= D(1);

TC <= '1' when (internalQ = "10011001" and ud = '1') 
                or (internalQ = "00000000" and ud = '0')
    else '0';

nor1 <= not(internalQ(3) or internalQ(2) or internalQ(1) or internalQ(0));
nor2 <= not(internalQ(7) or internalQ(6) or internalQ(5) or internalQ(4));
and1 <= internalQ(3) and internalQ(0);
and2 <= internalQ(7) and internalQ(4);

ld1 <= not( (nor1 and (not (ud))) or ( ud and and1 ));
ld2 <= not(((nor2 and (not (ud))) and nor1) or (and1 and and2));
ent_enp <= not( (nor1 and (not (ud))) or ( ud and and1 ));

HC1: hexCounter port map(clk => clk, ld => ld1, ud => ud, ent => ent, enp => enp, D => internalD, Rco => Rco, Q => internalQ(3 downto 0));
HC2: hexCounter port map(clk => clk, ld => ld2, ud => ud, ent => ent_enp, enp => ent_enp, D => internalD, Rco => Rco, Q => internalQ(7 downto 4));
Disp7: displayDriver port map(ck => clk, number => d7s, seg => Dca, an => Dan);

end Behavioral;
