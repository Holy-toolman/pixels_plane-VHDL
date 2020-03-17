library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pixel_plane is
    port(
        x_p,y_p: in std_logic_vector(5 downto 0); --the xy for the plane
        x_s,y_s:in std_logic_vector(3 downto 0); --for shooting
        d_p,d_s: out std_logic 
    );
end pixel_plane;

architecture Behav of pixel_plane is
    type d_block is array(0 to 31) of std_logic_vector(31 downto 0);
    type md_block is array(0 to 15) of std_logic_vector(15 downto 0);
    constant s_block: md_block :=
    ("1111111111111111",
     "1111111111111111",
     "1111111111111111",
     "1111111001111111",
     "1111110000111111",
     "1111100000011111",
     "1111000000001111",
     "1111000000001111",
     "1111000000001111",
     "1110000000000111",
     "1110000000000111",
     "1110011001100111",
     "1110111111110111",
     "1111111111111111",
     "1111111111111111",
     "1111111111111111"
      );
    constant p_block: d_block :=
    ("11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111100111111111111111",
     "11111111111111000011111111111111",
     "11111111111110000001111111111111",
     "11111111111110000001111111111111",
     "11111111111110011001111111111111",
     "11111111111110011001111111111111",
     "11111111111100111100111111111111",
     "11111111111100111100111111111111",
     "11111011111000000000011111011111",
     "11111011111000000000011111011111",
     "11110001110000000000001110001111",
     "11100000000000000000000000000111",
     "10000000000011111111000000000001",
     "10000000000011111111000000000001",
     "11100000000011111111000000000111",
     "11000000000000000000000000000011",
     "10000111111111111111111111100001",
     "11110000000000000000000000001111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111",
     "11111111111111111111111111111111" );



signal tmp_p:std_logic_vector(31 downto 0);
signal tmp_s:std_logic_vector(15 downto 0);
begin 
tmp_p<=p_block(conv_integer(y_p));
d_p<=not tmp_p(conv_integer(x_p));
tmp_s<=s_block(conv_integer(y_s));
d_s<=not tmp_s(conv_integer(x_s));

end Behav;