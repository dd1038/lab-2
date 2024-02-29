----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2024 02:00:40 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
Port (A, B: in std_logic_vector (3 downto 0);
Output: out std_logic_vector (3 downto 0);

);
end my_alu;

architecture Behavioral of my_alu is


begin
Process(alu) is
begin

case alu is
when "0000" =>  --0
Output <= std_logic_vector(unsigned(A) + unsigned(B));
when "0001" =>  --1
Output <= std_logic_vector(unsigned(A) - unsigned(B));
when "0010" =>  --2
Output <= std_logic_vector(unsigned(A) + "0001");
when "0011" =>  --3
Output <= std_logic_vector(unsigned(A) - "0001");
when "0100" =>  --4
Output <= std_logic_vector("0000" - unsigned(A));
when "0101" =>  --5

when "0110" =>  --6
Output <= A(2 downto 0) & '0';
when "0111" =>  --7
Output <= '0' & A(3 downto 1);
when "1000" =>  --8
Output <= std_logic_vector(shift_right(signed(A), 1));
when "1001" =>  --9
Output <= not(A);
when "1010" =>  --A
Output <= (A and B);
when "1011" =>  --B
Output <= (A or B);
when "1100" =>  --C
Output <= (A xor B);
when "1101" =>  --D
Output <= (A xnor B);
when "1110" =>  --E
Output <= (A nand B);
when "1111" =>  --F
Output <= (A nor B);

end case;

end Behavioral;
