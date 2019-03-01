----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2019 04:28:16 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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
--use UNISIM.VComponents.all;;

entity divider_top is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR(3 downto 0));
end divider_top;

architecture divider_top of divider_top is

component clock_div is
    Port ( clk_in : in STD_LOGIC;
           div : out STD_LOGIC);
end component;
    
    signal inv : std_logic := '0';
    signal div_out : std_logic;
    
    begin 
        top: clock_div port map (clk_in => clk, div => div_out);
    led_reg: process (clk) begin
        if (rising_edge(clk)) then
            if (div_out = '1') then
                inv <= not inv;
                led(0) <= inv;
            end if;
        end if;
    end process led_reg;
    
end divider_top;