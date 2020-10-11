library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity project_tb is
end project_tb;

architecture projecttb of project_tb is
constant c_CLOCK_PERIOD		: time := 100 ns;
signal   tb_done		: std_logic;
signal   mem_address		: std_logic_vector (15 downto 0) := (others => '0');
signal   tb_rst	                : std_logic := '0';
signal   tb_start		: std_logic := '0';
signal   tb_clk		        : std_logic := '0';
signal   mem_o_data,mem_i_data	: std_logic_vector (7 downto 0);
signal   enable_wire  		: std_logic;
signal   mem_we		        : std_logic;

--aggiungo questo segnale
signal numero_test : integer := 0; --aggiunto per i test
type ram_type is array (65535 downto 0) of std_logic_vector(7 downto 0);

signal RAM: ram_type :=  (
						0 => std_logic_vector(to_unsigned( 65, 8)),
						1 => std_logic_vector(to_unsigned( 53, 8)),
						2 => std_logic_vector(to_unsigned( 75, 8)),
						3 => std_logic_vector(to_unsigned( 104, 8)),
						4 => std_logic_vector(to_unsigned( 113, 8)),
						5 => std_logic_vector(to_unsigned( 15, 8)),
						6 => std_logic_vector(to_unsigned( 124, 8)),
						7 => std_logic_vector(to_unsigned( 10, 8)),
						8 => std_logic_vector(to_unsigned( 0, 8)),
						others => (others =>'0'));

component project_reti_logiche is
port (
	i_clk         : in  std_logic;
	i_start       : in  std_logic;
	i_rst         : in  std_logic;
	i_data        : in  std_logic_vector(7 downto 0);
	o_address     : out std_logic_vector(15 downto 0);
	o_done        : out std_logic;
	o_en          : out std_logic;
	o_we          : out std_logic;
	o_data        : out std_logic_vector (7 downto 0)
	);
end component project_reti_logiche;


begin
UUT: project_reti_logiche
port map (
		i_clk      	=> tb_clk,
		i_start       => tb_start,
		i_rst      	=> tb_rst,
		i_data    	=> mem_o_data,
		o_address  	=> mem_address,
		o_done      	=> tb_done,
		o_en   	=> enable_wire,
		o_we 		=> mem_we,
		o_data    	=> mem_i_data
		);

p_CLK_GEN : process is
begin
	wait for c_CLOCK_PERIOD/2;
	tb_clk <= not tb_clk;
end process p_CLK_GEN;
MEM : process(tb_clk)
begin
	if tb_clk'event and tb_clk = '1' then
		if enable_wire = '1' then
			if mem_we = '1' then
				RAM(conv_integer(mem_address))  <= mem_i_data;
				mem_o_data                      <= mem_i_data after 1 ns;
			else
				mem_o_data <= RAM(conv_integer(mem_address)) after 1 ns;
			end if;
		end if;
		--modifico ram
		if(tb_start='0') then

			if(numero_test = 1) then
				RAM(8) <= std_logic_vector(to_unsigned( 1, 8));
			elsif(numero_test = 2) then
				RAM(8) <= std_logic_vector(to_unsigned( 2, 8));
			elsif(numero_test = 3) then
				RAM(8) <= std_logic_vector(to_unsigned( 3, 8));
			elsif(numero_test = 4) then
				RAM(8) <= std_logic_vector(to_unsigned( 4, 8));
			elsif(numero_test = 5) then
				RAM(8) <= std_logic_vector(to_unsigned( 5, 8));
			elsif(numero_test = 6) then
				RAM(8) <= std_logic_vector(to_unsigned( 6, 8));
			elsif(numero_test = 7) then
				RAM(8) <= std_logic_vector(to_unsigned( 7, 8));
			elsif(numero_test = 8) then
				RAM(8) <= std_logic_vector(to_unsigned( 8, 8));
			elsif(numero_test = 9) then
				RAM(8) <= std_logic_vector(to_unsigned( 9, 8));
			elsif(numero_test = 10) then
				RAM(8) <= std_logic_vector(to_unsigned( 10, 8));
			elsif(numero_test = 11) then
				RAM(8) <= std_logic_vector(to_unsigned( 11, 8));
			elsif(numero_test = 12) then
				RAM(8) <= std_logic_vector(to_unsigned( 12, 8));
			elsif(numero_test = 13) then
				RAM(8) <= std_logic_vector(to_unsigned( 13, 8));
			elsif(numero_test = 14) then
				RAM(8) <= std_logic_vector(to_unsigned( 14, 8));
			elsif(numero_test = 15) then
				RAM(8) <= std_logic_vector(to_unsigned( 15, 8));
			elsif(numero_test = 16) then
				RAM(8) <= std_logic_vector(to_unsigned( 16, 8));
			elsif(numero_test = 17) then
				RAM(8) <= std_logic_vector(to_unsigned( 17, 8));
			elsif(numero_test = 18) then
				RAM(8) <= std_logic_vector(to_unsigned( 18, 8));
			elsif(numero_test = 19) then
				RAM(8) <= std_logic_vector(to_unsigned( 19, 8));
			elsif(numero_test = 20) then
				RAM(8) <= std_logic_vector(to_unsigned( 20, 8));
			elsif(numero_test = 21) then
				RAM(8) <= std_logic_vector(to_unsigned( 21, 8));
			elsif(numero_test = 22) then
				RAM(8) <= std_logic_vector(to_unsigned( 22, 8));
			elsif(numero_test = 23) then
				RAM(8) <= std_logic_vector(to_unsigned( 23, 8));
			elsif(numero_test = 24) then
				RAM(8) <= std_logic_vector(to_unsigned( 24, 8));
			elsif(numero_test = 25) then
				RAM(8) <= std_logic_vector(to_unsigned( 25, 8));
			elsif(numero_test = 26) then
				RAM(8) <= std_logic_vector(to_unsigned( 26, 8));
			elsif(numero_test = 27) then
				RAM(8) <= std_logic_vector(to_unsigned( 27, 8));
			elsif(numero_test = 28) then
				RAM(8) <= std_logic_vector(to_unsigned( 28, 8));
			elsif(numero_test = 29) then
				RAM(8) <= std_logic_vector(to_unsigned( 29, 8));
			elsif(numero_test = 30) then
				RAM(8) <= std_logic_vector(to_unsigned( 30, 8));
			elsif(numero_test = 31) then
				RAM(8) <= std_logic_vector(to_unsigned( 31, 8));
			elsif(numero_test = 32) then
				RAM(8) <= std_logic_vector(to_unsigned( 32, 8));
			elsif(numero_test = 33) then
				RAM(8) <= std_logic_vector(to_unsigned( 33, 8));
			elsif(numero_test = 34) then
				RAM(8) <= std_logic_vector(to_unsigned( 34, 8));
			elsif(numero_test = 35) then
				RAM(8) <= std_logic_vector(to_unsigned( 35, 8));
			elsif(numero_test = 36) then
				RAM(8) <= std_logic_vector(to_unsigned( 36, 8));
			elsif(numero_test = 37) then
				RAM(8) <= std_logic_vector(to_unsigned( 37, 8));
			elsif(numero_test = 38) then
				RAM(8) <= std_logic_vector(to_unsigned( 38, 8));
			elsif(numero_test = 39) then
				RAM(8) <= std_logic_vector(to_unsigned( 39, 8));
			elsif(numero_test = 40) then
				RAM(8) <= std_logic_vector(to_unsigned( 40, 8));
			elsif(numero_test = 41) then
				RAM(8) <= std_logic_vector(to_unsigned( 41, 8));
			elsif(numero_test = 42) then
				RAM(8) <= std_logic_vector(to_unsigned( 42, 8));
			elsif(numero_test = 43) then
				RAM(8) <= std_logic_vector(to_unsigned( 43, 8));
			elsif(numero_test = 44) then
				RAM(8) <= std_logic_vector(to_unsigned( 44, 8));
			elsif(numero_test = 45) then
				RAM(8) <= std_logic_vector(to_unsigned( 45, 8));
			elsif(numero_test = 46) then
				RAM(8) <= std_logic_vector(to_unsigned( 46, 8));
			elsif(numero_test = 47) then
				RAM(8) <= std_logic_vector(to_unsigned( 47, 8));
			elsif(numero_test = 48) then
				RAM(8) <= std_logic_vector(to_unsigned( 48, 8));
			elsif(numero_test = 49) then
				RAM(8) <= std_logic_vector(to_unsigned( 49, 8));
			elsif(numero_test = 50) then
				RAM(8) <= std_logic_vector(to_unsigned( 50, 8));
			elsif(numero_test = 51) then
				RAM(8) <= std_logic_vector(to_unsigned( 51, 8));
			elsif(numero_test = 52) then
				RAM(8) <= std_logic_vector(to_unsigned( 52, 8));
			elsif(numero_test = 53) then
				RAM(8) <= std_logic_vector(to_unsigned( 53, 8));
			elsif(numero_test = 54) then
				RAM(8) <= std_logic_vector(to_unsigned( 54, 8));
			elsif(numero_test = 55) then
				RAM(8) <= std_logic_vector(to_unsigned( 55, 8));
			elsif(numero_test = 56) then
				RAM(8) <= std_logic_vector(to_unsigned( 56, 8));
			elsif(numero_test = 57) then
				RAM(8) <= std_logic_vector(to_unsigned( 57, 8));
			elsif(numero_test = 58) then
				RAM(8) <= std_logic_vector(to_unsigned( 58, 8));
			elsif(numero_test = 59) then
				RAM(8) <= std_logic_vector(to_unsigned( 59, 8));
			elsif(numero_test = 60) then
				RAM(8) <= std_logic_vector(to_unsigned( 60, 8));
			elsif(numero_test = 61) then
				RAM(8) <= std_logic_vector(to_unsigned( 61, 8));
			elsif(numero_test = 62) then
				RAM(8) <= std_logic_vector(to_unsigned( 62, 8));
			elsif(numero_test = 63) then
				RAM(8) <= std_logic_vector(to_unsigned( 63, 8));
			elsif(numero_test = 64) then
				RAM(8) <= std_logic_vector(to_unsigned( 64, 8));
			elsif(numero_test = 65) then
				RAM(8) <= std_logic_vector(to_unsigned( 65, 8));
			elsif(numero_test = 66) then
				RAM(8) <= std_logic_vector(to_unsigned( 66, 8));
			elsif(numero_test = 67) then
				RAM(8) <= std_logic_vector(to_unsigned( 67, 8));
			elsif(numero_test = 68) then
				RAM(8) <= std_logic_vector(to_unsigned( 68, 8));
			elsif(numero_test = 69) then
				RAM(8) <= std_logic_vector(to_unsigned( 69, 8));
			elsif(numero_test = 70) then
				RAM(8) <= std_logic_vector(to_unsigned( 70, 8));
			elsif(numero_test = 71) then
				RAM(8) <= std_logic_vector(to_unsigned( 71, 8));
			elsif(numero_test = 72) then
				RAM(8) <= std_logic_vector(to_unsigned( 72, 8));
			elsif(numero_test = 73) then
				RAM(8) <= std_logic_vector(to_unsigned( 73, 8));
			elsif(numero_test = 74) then
				RAM(8) <= std_logic_vector(to_unsigned( 74, 8));
			elsif(numero_test = 75) then
				RAM(8) <= std_logic_vector(to_unsigned( 75, 8));
			elsif(numero_test = 76) then
				RAM(8) <= std_logic_vector(to_unsigned( 76, 8));
			elsif(numero_test = 77) then
				RAM(8) <= std_logic_vector(to_unsigned( 77, 8));
			elsif(numero_test = 78) then
				RAM(8) <= std_logic_vector(to_unsigned( 78, 8));
			elsif(numero_test = 79) then
				RAM(8) <= std_logic_vector(to_unsigned( 79, 8));
			elsif(numero_test = 80) then
				RAM(8) <= std_logic_vector(to_unsigned( 80, 8));
			elsif(numero_test = 81) then
				RAM(8) <= std_logic_vector(to_unsigned( 81, 8));
			elsif(numero_test = 82) then
				RAM(8) <= std_logic_vector(to_unsigned( 82, 8));
			elsif(numero_test = 83) then
				RAM(8) <= std_logic_vector(to_unsigned( 83, 8));
			elsif(numero_test = 84) then
				RAM(8) <= std_logic_vector(to_unsigned( 84, 8));
			elsif(numero_test = 85) then
				RAM(8) <= std_logic_vector(to_unsigned( 85, 8));
			elsif(numero_test = 86) then
				RAM(8) <= std_logic_vector(to_unsigned( 86, 8));
			elsif(numero_test = 87) then
				RAM(8) <= std_logic_vector(to_unsigned( 87, 8));
			elsif(numero_test = 88) then
				RAM(8) <= std_logic_vector(to_unsigned( 88, 8));
			elsif(numero_test = 89) then
				RAM(8) <= std_logic_vector(to_unsigned( 89, 8));
			elsif(numero_test = 90) then
				RAM(8) <= std_logic_vector(to_unsigned( 90, 8));
			elsif(numero_test = 91) then
				RAM(8) <= std_logic_vector(to_unsigned( 91, 8));
			elsif(numero_test = 92) then
				RAM(8) <= std_logic_vector(to_unsigned( 92, 8));
			elsif(numero_test = 93) then
				RAM(8) <= std_logic_vector(to_unsigned( 93, 8));
			elsif(numero_test = 94) then
				RAM(8) <= std_logic_vector(to_unsigned( 94, 8));
			elsif(numero_test = 95) then
				RAM(8) <= std_logic_vector(to_unsigned( 95, 8));
			elsif(numero_test = 96) then
				RAM(8) <= std_logic_vector(to_unsigned( 96, 8));
			elsif(numero_test = 97) then
				RAM(8) <= std_logic_vector(to_unsigned( 97, 8));
			elsif(numero_test = 98) then
				RAM(8) <= std_logic_vector(to_unsigned( 98, 8));
			elsif(numero_test = 99) then
				RAM(8) <= std_logic_vector(to_unsigned( 99, 8));
			elsif(numero_test = 100) then
				RAM(8) <= std_logic_vector(to_unsigned( 100, 8));
			elsif(numero_test = 101) then
				RAM(8) <= std_logic_vector(to_unsigned( 101, 8));
			elsif(numero_test = 102) then
				RAM(8) <= std_logic_vector(to_unsigned( 102, 8));
			elsif(numero_test = 103) then
				RAM(8) <= std_logic_vector(to_unsigned( 103, 8));
			elsif(numero_test = 104) then
				RAM(8) <= std_logic_vector(to_unsigned( 104, 8));
			elsif(numero_test = 105) then
				RAM(8) <= std_logic_vector(to_unsigned( 105, 8));
			elsif(numero_test = 106) then
				RAM(8) <= std_logic_vector(to_unsigned( 106, 8));
			elsif(numero_test = 107) then
				RAM(8) <= std_logic_vector(to_unsigned( 107, 8));
			elsif(numero_test = 108) then
				RAM(8) <= std_logic_vector(to_unsigned( 108, 8));
			elsif(numero_test = 109) then
				RAM(8) <= std_logic_vector(to_unsigned( 109, 8));
			elsif(numero_test = 110) then
				RAM(8) <= std_logic_vector(to_unsigned( 110, 8));
			elsif(numero_test = 111) then
				RAM(8) <= std_logic_vector(to_unsigned( 111, 8));
			elsif(numero_test = 112) then
				RAM(8) <= std_logic_vector(to_unsigned( 112, 8));
			elsif(numero_test = 113) then
				RAM(8) <= std_logic_vector(to_unsigned( 113, 8));
			elsif(numero_test = 114) then
				RAM(8) <= std_logic_vector(to_unsigned( 114, 8));
			elsif(numero_test = 115) then
				RAM(8) <= std_logic_vector(to_unsigned( 115, 8));
			elsif(numero_test = 116) then
				RAM(8) <= std_logic_vector(to_unsigned( 116, 8));
			elsif(numero_test = 117) then
				RAM(8) <= std_logic_vector(to_unsigned( 117, 8));
			elsif(numero_test = 118) then
				RAM(8) <= std_logic_vector(to_unsigned( 118, 8));
			elsif(numero_test = 119) then
				RAM(8) <= std_logic_vector(to_unsigned( 119, 8));
			elsif(numero_test = 120) then
				RAM(8) <= std_logic_vector(to_unsigned( 120, 8));
			elsif(numero_test = 121) then
				RAM(8) <= std_logic_vector(to_unsigned( 121, 8));
			elsif(numero_test = 122) then
				RAM(8) <= std_logic_vector(to_unsigned( 122, 8));
			elsif(numero_test = 123) then
				RAM(8) <= std_logic_vector(to_unsigned( 123, 8));
			elsif(numero_test = 124) then
				RAM(8) <= std_logic_vector(to_unsigned( 124, 8));
			elsif(numero_test = 125) then
				RAM(8) <= std_logic_vector(to_unsigned( 125, 8));
			elsif(numero_test = 126) then
				RAM(8) <= std_logic_vector(to_unsigned( 126, 8));
			elsif(numero_test = 127) then
				RAM(8) <= std_logic_vector(to_unsigned( 127, 8));
			end if;
		end if;
	end if;
end process;


test : process is

	begin

		wait for 100 ns;
		wait for c_CLOCK_PERIOD;
		tb_rst <= '1';
		wait for c_CLOCK_PERIOD;
		tb_rst <= '0';
		-- test numero 0

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(0 , 8)) report "TEST FALLITO. Expected  0  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 0 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 1

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(1 , 8)) report "TEST FALLITO. Expected  1  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 1 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 2

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(2 , 8)) report "TEST FALLITO. Expected  2  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 2 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 3

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(3 , 8)) report "TEST FALLITO. Expected  3  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 3 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 4

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(4 , 8)) report "TEST FALLITO. Expected  4  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 4 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 5

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(5 , 8)) report "TEST FALLITO. Expected  5  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 5 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 6

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(6 , 8)) report "TEST FALLITO. Expected  6  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 6 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 7

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(7 , 8)) report "TEST FALLITO. Expected  7  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 7 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 8

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(8 , 8)) report "TEST FALLITO. Expected  8  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 8 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 9

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(9 , 8)) report "TEST FALLITO. Expected  9  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 9 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 10

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(241 , 8)) report "TEST FALLITO. Expected  241  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 10 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 11

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(242 , 8)) report "TEST FALLITO. Expected  242  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 11 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 12

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(244 , 8)) report "TEST FALLITO. Expected  244  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 12 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 13

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(248 , 8)) report "TEST FALLITO. Expected  248  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 13 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 14

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(14 , 8)) report "TEST FALLITO. Expected  14  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 14 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 15

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(209 , 8)) report "TEST FALLITO. Expected  209  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 15 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 16

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(210 , 8)) report "TEST FALLITO. Expected  210  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 16 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 17

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(212 , 8)) report "TEST FALLITO. Expected  212  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 17 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 18

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(216 , 8)) report "TEST FALLITO. Expected  216  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 18 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 19

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(19 , 8)) report "TEST FALLITO. Expected  19  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 19 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 20

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(20 , 8)) report "TEST FALLITO. Expected  20  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 20 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 21

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(21 , 8)) report "TEST FALLITO. Expected  21  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 21 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 22

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(22 , 8)) report "TEST FALLITO. Expected  22  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 22 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 23

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(23 , 8)) report "TEST FALLITO. Expected  23  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 23 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 24

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(24 , 8)) report "TEST FALLITO. Expected  24  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 24 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 25

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(25 , 8)) report "TEST FALLITO. Expected  25  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 25 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 26

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(26 , 8)) report "TEST FALLITO. Expected  26  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 26 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 27

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(27 , 8)) report "TEST FALLITO. Expected  27  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 27 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 28

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(28 , 8)) report "TEST FALLITO. Expected  28  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 28 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 29

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(29 , 8)) report "TEST FALLITO. Expected  29  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 29 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 30

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(30 , 8)) report "TEST FALLITO. Expected  30  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 30 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 31

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(31 , 8)) report "TEST FALLITO. Expected  31  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 31 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 32

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(32 , 8)) report "TEST FALLITO. Expected  32  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 32 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 33

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(33 , 8)) report "TEST FALLITO. Expected  33  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 33 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 34

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(34 , 8)) report "TEST FALLITO. Expected  34  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 34 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 35

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(35 , 8)) report "TEST FALLITO. Expected  35  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 35 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 36

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(36 , 8)) report "TEST FALLITO. Expected  36  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 36 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 37

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(37 , 8)) report "TEST FALLITO. Expected  37  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 37 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 38

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(38 , 8)) report "TEST FALLITO. Expected  38  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 38 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 39

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(39 , 8)) report "TEST FALLITO. Expected  39  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 39 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 40

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(40 , 8)) report "TEST FALLITO. Expected  40  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 40 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 41

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(41 , 8)) report "TEST FALLITO. Expected  41  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 41 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 42

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(42 , 8)) report "TEST FALLITO. Expected  42  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 42 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 43

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(43 , 8)) report "TEST FALLITO. Expected  43  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 43 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 44

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(44 , 8)) report "TEST FALLITO. Expected  44  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 44 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 45

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(45 , 8)) report "TEST FALLITO. Expected  45  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 45 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 46

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(46 , 8)) report "TEST FALLITO. Expected  46  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 46 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 47

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(47 , 8)) report "TEST FALLITO. Expected  47  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 47 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 48

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(48 , 8)) report "TEST FALLITO. Expected  48  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 48 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 49

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(49 , 8)) report "TEST FALLITO. Expected  49  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 49 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 50

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(50 , 8)) report "TEST FALLITO. Expected  50  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 50 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 51

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(51 , 8)) report "TEST FALLITO. Expected  51  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 51 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 52

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(52 , 8)) report "TEST FALLITO. Expected  52  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 52 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 53

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(145 , 8)) report "TEST FALLITO. Expected  145  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 53 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 54

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(146 , 8)) report "TEST FALLITO. Expected  146  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 54 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 55

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(148 , 8)) report "TEST FALLITO. Expected  148  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 55 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 56

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(152 , 8)) report "TEST FALLITO. Expected  152  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 56 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 57

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(57 , 8)) report "TEST FALLITO. Expected  57  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 57 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 58

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(58 , 8)) report "TEST FALLITO. Expected  58  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 58 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 59

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(59 , 8)) report "TEST FALLITO. Expected  59  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 59 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 60

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(60 , 8)) report "TEST FALLITO. Expected  60  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 60 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 61

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(61 , 8)) report "TEST FALLITO. Expected  61  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 61 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 62

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(62 , 8)) report "TEST FALLITO. Expected  62  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 62 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 63

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(63 , 8)) report "TEST FALLITO. Expected  63  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 63 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 64

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(64 , 8)) report "TEST FALLITO. Expected  64  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 64 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 65

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(129 , 8)) report "TEST FALLITO. Expected  129  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 65 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 66

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(130 , 8)) report "TEST FALLITO. Expected  130  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 66 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 67

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(132 , 8)) report "TEST FALLITO. Expected  132  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 67 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 68

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(136 , 8)) report "TEST FALLITO. Expected  136  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 68 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 69

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(69 , 8)) report "TEST FALLITO. Expected  69  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 69 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 70

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(70 , 8)) report "TEST FALLITO. Expected  70  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 70 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 71

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(71 , 8)) report "TEST FALLITO. Expected  71  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 71 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 72

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(72 , 8)) report "TEST FALLITO. Expected  72  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 72 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 73

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(73 , 8)) report "TEST FALLITO. Expected  73  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 73 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 74

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(74 , 8)) report "TEST FALLITO. Expected  74  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 74 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 75

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(161 , 8)) report "TEST FALLITO. Expected  161  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 75 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 76

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(162 , 8)) report "TEST FALLITO. Expected  162  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 76 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 77

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(164 , 8)) report "TEST FALLITO. Expected  164  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 77 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 78

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(168 , 8)) report "TEST FALLITO. Expected  168  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 78 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 79

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(79 , 8)) report "TEST FALLITO. Expected  79  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 79 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 80

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(80 , 8)) report "TEST FALLITO. Expected  80  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 80 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 81

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(81 , 8)) report "TEST FALLITO. Expected  81  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 81 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 82

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(82 , 8)) report "TEST FALLITO. Expected  82  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 82 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 83

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(83 , 8)) report "TEST FALLITO. Expected  83  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 83 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 84

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(84 , 8)) report "TEST FALLITO. Expected  84  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 84 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 85

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(85 , 8)) report "TEST FALLITO. Expected  85  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 85 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 86

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(86 , 8)) report "TEST FALLITO. Expected  86  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 86 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 87

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(87 , 8)) report "TEST FALLITO. Expected  87  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 87 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 88

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(88 , 8)) report "TEST FALLITO. Expected  88  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 88 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 89

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(89 , 8)) report "TEST FALLITO. Expected  89  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 89 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 90

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(90 , 8)) report "TEST FALLITO. Expected  90  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 90 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 91

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(91 , 8)) report "TEST FALLITO. Expected  91  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 91 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 92

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(92 , 8)) report "TEST FALLITO. Expected  92  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 92 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 93

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(93 , 8)) report "TEST FALLITO. Expected  93  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 93 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 94

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(94 , 8)) report "TEST FALLITO. Expected  94  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 94 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 95

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(95 , 8)) report "TEST FALLITO. Expected  95  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 95 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 96

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(96 , 8)) report "TEST FALLITO. Expected  96  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 96 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 97

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(97 , 8)) report "TEST FALLITO. Expected  97  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 97 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 98

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(98 , 8)) report "TEST FALLITO. Expected  98  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 98 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 99

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(99 , 8)) report "TEST FALLITO. Expected  99  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 99 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 100

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(100 , 8)) report "TEST FALLITO. Expected  100  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 100 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 101

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(101 , 8)) report "TEST FALLITO. Expected  101  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 101 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 102

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(102 , 8)) report "TEST FALLITO. Expected  102  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 102 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 103

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(103 , 8)) report "TEST FALLITO. Expected  103  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 103 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 104

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(177 , 8)) report "TEST FALLITO. Expected  177  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 104 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 105

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(178 , 8)) report "TEST FALLITO. Expected  178  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 105 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 106

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(180 , 8)) report "TEST FALLITO. Expected  180  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 106 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 107

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(184 , 8)) report "TEST FALLITO. Expected  184  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 107 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 108

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(108 , 8)) report "TEST FALLITO. Expected  108  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 108 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 109

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(109 , 8)) report "TEST FALLITO. Expected  109  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 109 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 110

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(110 , 8)) report "TEST FALLITO. Expected  110  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 110 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 111

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(111 , 8)) report "TEST FALLITO. Expected  111  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 111 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 112

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(112 , 8)) report "TEST FALLITO. Expected  112  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 112 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 113

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(193 , 8)) report "TEST FALLITO. Expected  193  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 113 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 114

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(194 , 8)) report "TEST FALLITO. Expected  194  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 114 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 115

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(196 , 8)) report "TEST FALLITO. Expected  196  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 115 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 116

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(200 , 8)) report "TEST FALLITO. Expected  200  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 116 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 117

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(117 , 8)) report "TEST FALLITO. Expected  117  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 117 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 118

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(118 , 8)) report "TEST FALLITO. Expected  118  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 118 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 119

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(119 , 8)) report "TEST FALLITO. Expected  119  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 119 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 120

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(120 , 8)) report "TEST FALLITO. Expected  120  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 120 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 121

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(121 , 8)) report "TEST FALLITO. Expected  121  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 121 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 122

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(122 , 8)) report "TEST FALLITO. Expected  122  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 122 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 123

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(123 , 8)) report "TEST FALLITO. Expected  123  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 123 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 124

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(225 , 8)) report "TEST FALLITO. Expected  225  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 124 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 125

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(226 , 8)) report "TEST FALLITO. Expected  226  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 125 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 126

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(228 , 8)) report "TEST FALLITO. Expected  228  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 126 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		-- test numero 127

		wait for c_CLOCK_PERIOD;
		tb_start <= '1';
		wait for c_CLOCK_PERIOD;
		wait until tb_done = '1';
		wait for c_CLOCK_PERIOD;
		tb_start <= '0';
		wait until tb_done = '0';
		wait for 100 ns;

		assert RAM(9) = std_logic_vector(to_unsigned(232 , 8)) report "TEST FALLITO. Expected  232  found " & integer'image(to_integer(unsigned(RAM(9))))  severity failure;

		report "TEST 127 PASSATO sol: " & integer'image(to_integer(unsigned(RAM(9))));


		numero_test <= numero_test+1;
		assert false report "TUTTO OK"  severity failure;
	end process test;
end projecttb;
