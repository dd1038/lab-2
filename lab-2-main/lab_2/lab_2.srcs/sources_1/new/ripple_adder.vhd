----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2024 11:36:19 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

entity ripple_adder is
    Port (A,B: in std_logic_vector(3 downto 0);
         Cin: in std_logic;
         S: out std_logic_vector(3 downto 0);
         Cout: out std_logic
        );
end ripple_adder;

architecture ripple_adder_structural of ripple_adder is
    signal Cout1, Cout2, Cout3, Cout4: std_logic;
    signal S0, S1, S2, S3: std_logic;
begin

    S0 <= A(0) xor B(0) xor Cin;
    Cout1 <= (A(0) and B(0)) xor (A(0) and Cin) xor (B(0) and Cin);

    S1 <= A(1) xor B(1) xor Cout1;
    Cout2 <= (A(1) and B(1)) xor (A(1) and Cout1) xor (B(1) and Cout1);


    S2 <= A(2) xor B(2) xor Cout2;
    Cout3 <= (A(2) and B(2)) xor (A(2) and Cout2) xor (B(2) and Cout2);

    S3 <= A(3) xor B(3) xor Cout3;
    Cout4 <= (A(3) and B(3)) xor (A(3) and Cout3) xor (B(3) and Cout3);


    Cout <= Cout4;
    S <= (S0&S1&S2&S3);

end ripple_adder_structural;
