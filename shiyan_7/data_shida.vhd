library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity data_shida is 
port ( 	clk:in std_logic;
		dotout:out std_logic_vector(15 downto 0);
		dotadd:out std_logic_vector(3 downto 0);
		doten:out std_logic;
		dotclk:out std_logic);
end;

architecture a of data_shida is
type dot_type is array (0 to 31) of std_logic_vector(7 downto 0);
constant dotout_tmp0:dot_type:=    
(
x"00",x"00",x"20",x"00",x"17",x"FC",x"10",x"40",x"80",x"40",x"40",x"40",x"48",x"40",x"08",x"40",
x"10",x"40",x"10",x"40",x"E0",x"40",x"20",x"40",x"20",x"40",x"2F",x"FE",x"20",x"00",x"00",x"00");--江0

constant dotout_tmp1:dot_type:=    
(
x"00",x"00",x"FF",x"FE",x"04",x"40",x"04",x"40",x"04",x"40",x"3F",x"F8",x"24",x"48",x"24",x"48",
x"24",x"48",x"24",x"48",x"28",x"38",x"30",x"08",x"20",x"08",x"20",x"08",x"3F",x"F8",x"20",x"08");--西1

constant dotout_tmp2:dot_type:=    
(
x"08",x"00",x"0B",x"FE",x"48",x"20",x"48",x"20",x"48",x"20",x"49",x"FC",x"49",x"24",x"49",x"24",
x"49",x"24",x"49",x"24",x"49",x"24",x"09",x"34",x"11",x"28",x"10",x"20",x"20",x"20",x"40",x"20");--师2

constant dotout_tmp3:dot_type:=    
(
x"01",x"00",x"01",x"00",x"01",x"00",x"01",x"00",x"01",x"00",x"FF",x"FE",x"01",x"00",x"01",x"00",
x"02",x"80",x"02",x"80",x"04",x"40",x"04",x"40",x"08",x"20",x"10",x"10",x"20",x"08",x"C0",x"06");--大3

constant dotout_tmp4:dot_type:=    
(
x"00",x"00",x"01",x"FC",x"FD",x"24",x"11",x"24",x"11",x"FC",x"11",x"24",x"11",x"24",x"7D",x"FC",
x"10",x"20",x"10",x"20",x"11",x"FC",x"10",x"20",x"1C",x"20",x"E0",x"20",x"43",x"FE",x"00",x"00");--理4

constant dotout_tmp5:dot_type:=    
(
x"01",x"00",x"01",x"00",x"01",x"00",x"3F",x"F8",x"21",x"08",x"21",x"08",x"21",x"08",x"3F",x"F8",
x"21",x"08",x"21",x"08",x"21",x"08",x"3F",x"F8",x"21",x"0A",x"01",x"02",x"01",x"02",x"00",x"FE");--电5

constant dotout_tmp6:dot_type:=    
(
x"22",x"08",x"11",x"08",x"11",x"10",x"00",x"20",x"7F",x"FE",x"40",x"02",x"80",x"04",x"1F",x"E0",
x"00",x"40",x"01",x"80",x"FF",x"FE",x"01",x"00",x"01",x"00",x"01",x"00",x"05",x"00",x"02",x"00");--学6

constant dotout_tmp7:dot_type:=    
(
x"00",x"40",x"78",x"20",x"4B",x"FE",x"52",x"02",x"54",x"04",x"61",x"F8",x"50",x"00",x"48",x"00",
x"4B",x"FE",x"48",x"90",x"68",x"90",x"50",x"90",x"41",x"12",x"41",x"12",x"42",x"0E",x"44",x"00");--院7
Signal 	Q	: STD_LOGIC_VECTOR(40 DOWNTO 0);
--Signal 	S 	: STD_LOGIC;
Signal 	S 	: STD_LOGIC_VECTOR(2 DOWNTO 0);
Signal 	S1 	: STD_LOGIC_VECTOR(3 DOWNTO 0);
Signal  dottemp : STD_LOGIC_VECTOR(15 DOWNTO 0);
begin
--S <= Q(25);
S <= Q(28 DOWNTO 26);
S1 <= Q(7 DOWNTO 4);
dotadd <= S1;
dotout <= dottemp;
doten <= '1';
dotclk <= Q(3);
PROCESS (clk)
	Begin
		IF clk'Event AND clk='1' then
			Q <= Q+1;			
		END IF;	
end process;
process(S,S1)
begin
 CASE S IS
WHEN "000"=> dottemp<=dotout_tmp0(conv_integer(S1)*2)& dotout_tmp0(conv_integer(S1)*2+1);
WHEN "001" => dottemp<=dotout_tmp1(conv_integer(S1)*2)& dotout_tmp1(conv_integer(S1)*2+1);
WHEN "010"=> dottemp<=dotout_tmp2(conv_integer(S1)*2)& dotout_tmp2(conv_integer(S1)*2+1);
WHEN "011" => dottemp<=dotout_tmp3(conv_integer(S1)*2)& dotout_tmp3(conv_integer(S1)*2+1);
WHEN "100"=> dottemp<=dotout_tmp4(conv_integer(S1)*2)& dotout_tmp4(conv_integer(S1)*2+1);
WHEN "101" => dottemp<=dotout_tmp5(conv_integer(S1)*2)& dotout_tmp5(conv_integer(S1)*2+1);
WHEN "110" => dottemp<=dotout_tmp6(conv_integer(S1)*2)& dotout_tmp6(conv_integer(S1)*2+1);
WHEN "111" => dottemp<=dotout_tmp7(conv_integer(S1)*2)& dotout_tmp7(conv_integer(S1)*2+1);
WHEN OTHERS => NULL;
END CASE; 
end process;
end;