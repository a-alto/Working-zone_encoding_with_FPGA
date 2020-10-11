----------------------------------------------------------------------------------
-- Company: Politecnico di Milano
-- Student: Andrea Altomare - 891365
-- 
-- Create Date: 03.2020
-- Design Name: FSM and Datapath
-- Module Name: project_reti_logiche - Behavioral
-- Project Name: Project Reti Logiche
-- Target Devices: FPGA xc7a200tfbg484-1
-- Tool Versions: Vivado 2019.2
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

-- Libraries declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Module entity
entity project_reti_logiche is
    Port ( 
           i_clk : in STD_LOGIC;
           i_start : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_data : in STD_LOGIC_VECTOR (7 downto 0);
           o_address : out STD_LOGIC_VECTOR (15 downto 0);
           o_done : out STD_LOGIC;
           o_en : out STD_LOGIC;
           o_we : out STD_LOGIC;
           o_data : out STD_LOGIC_VECTOR (7 downto 0)
    );
end project_reti_logiche;

-- FSM implementation
architecture Behavioral of project_reti_logiche is
-- Datapath declaration
component datapath is
    Port (
           i_clk : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_data : in STD_LOGIC_VECTOR (7 downto 0);
           o_data : out STD_LOGIC_VECTOR (7 downto 0);
           r1_load : in STD_LOGIC;
           r2_load : in STD_LOGIC;
           r3_load : in STD_LOGIC;
           r4_load : in STD_LOGIC;
           r5_load : in STD_LOGIC;
           r6_load : in STD_LOGIC;
           r7_load : in STD_LOGIC;
           r8_load : in STD_LOGIC;
           rAddressRaw_load : in STD_LOGIC;
           rEncoding_load : in STD_LOGIC
    );
end component;
-- signals declaration
signal r1_load : STD_LOGIC := '0';
signal r2_load : STD_LOGIC := '0';
signal r3_load : STD_LOGIC := '0';
signal r4_load : STD_LOGIC := '0';
signal r5_load : STD_LOGIC := '0';
signal r6_load : STD_LOGIC := '0';
signal r7_load : STD_LOGIC := '0';
signal r8_load : STD_LOGIC := '0';
signal rAddressRaw_load : STD_LOGIC := '0';
signal rEncoding_load : STD_LOGIC := '0';
--type DONE is (YES,NO);
--signal cur_DONE : DONE; -- used as a variable
--signal next_DONE : DONE; -- used as a variable
-- FSM status definition
type S is (
            idle,
            ready,
            ftch1,
            ftch2,
            ftch3,
            ftch4,
            ftch5,
            ftch6,
            ftch7,
            ftch8,
            ftchAddr,
            encode,
            output,
            finish
          );
signal cur_status, next_status : S;
begin
    -- datapath port mapping
    DATAPATH0: datapath port map(
        i_clk => i_clk,
        i_rst => i_rst,
        i_data => i_data,
        o_data => o_data,
        r1_load => r1_load,
        r2_load => r2_load,
        r3_load => r3_load,
        r4_load => r4_load,
        r5_load => r5_load,
        r6_load => r6_load,
        r7_load => r7_load,
        r8_load => r8_load,
        rAddressRaw_load => rAddressRaw_load,
        rEncoding_load => rEncoding_load
    );
    
    -- DONE ragister (used as a variable)
    --DONE_register: process(i_clk, i_rst)
    --begin
    --    if(i_rst = '1') then
    --        cur_DONE <= NO;
    --    elsif i_clk'event and i_clk = '1' then
    --        cur_DONE <= next_DONE;
    --    end if;
    --end process;
    
    -- current status register
    Status: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            cur_status <= idle;
        elsif falling_edge(i_clk) then
            cur_status <= next_status;
        end if;
    end process;
    
    -- next status function
    Delta: process(cur_status, i_start)
    begin
        next_status <= cur_status;
        case cur_status is
            when idle => 
                if i_start = '1' then 
                    next_status <= ftch1;
                end if;
            when ready => 
                if i_start = '1' then 
                    next_status <= ftchAddr;
                end if;
            when ftch1 => 
                next_status <= ftch2;
            when ftch2 => 
                next_status <= ftch3;
            when ftch3 => 
                next_status <= ftch4;
            when ftch4 => 
                next_status <= ftch5;
            when ftch5 => 
                next_status <= ftch6;
            when ftch6 => 
                next_status <= ftch7;
            when ftch7 => 
                next_status <= ftch8;
            when ftch8 => 
                next_status <= ftchAddr;
            when ftchAddr => 
                next_status <= encode;
            when encode => 
                next_status <= output;
            when output => 
                next_status <= finish;
            when finish => 
                if i_start = '0' then
                    next_status <= ready;
                end if;
        end case;
    end process;
    
    -- output function (Moore FSM)
    Lambda: process(cur_status)
    variable DONE : STD_LOGIC := '0';
    begin
        r1_load <= '0';
        r2_load <= '0';
        r3_load <= '0';
        r4_load <= '0';
        r5_load <= '0';
        r6_load <= '0';
        r7_load <= '0';
        r8_load <= '0';
        rAddressRaw_load <= '0';
        rEncoding_load <= '0';
        o_address <= "0000000000000000";
        o_en <= '0';
        o_we <= '0';
        o_done <= '0';
        case cur_status is
            when idle => 
                -- waiting to start a new encoding process
                --if DONE = '1' then
                --    o_done <= '0';
                --    DONE := '0';
                --end if;
                o_done <= '0';
            when ready => 
                -- waiting to start a new encoding process
                --if DONE = '1' then
                --    o_done <= '0';
                --    DONE := '0';
                --end if;
                o_done <= '0';
            when ftch1 => 
                -- read 1st WZ base address from RAM
                o_address <= "0000000000000000";
                o_en <= '1';
                o_we <= '0';
                r1_load <= '1';
            when ftch2 => 
                -- read 2nd WZ base address from RAM
                o_address <= "0000000000000001";
                o_en <= '1';
                o_we <= '0';
                r2_load <= '1';
            when ftch3 => 
                -- read 3rd WZ base address from RAM
                o_address <= "0000000000000010";
                o_en <= '1';
                o_we <= '0';
                r3_load <= '1';
            when ftch4 => 
                -- read 4th WZ base address from RAM
                o_address <= "0000000000000011";
                o_en <= '1';
                o_we <= '0';
                r4_load <= '1';
            when ftch5 => 
                -- read 5th WZ base address from RAM
                o_address <= "0000000000000100";
                o_en <= '1';
                o_we <= '0';
                r5_load <= '1';
            when ftch6 => 
                -- read 6th WZ base address from RAM
                o_address <= "0000000000000101";
                o_en <= '1';
                o_we <= '0';
                r6_load <= '1';
            when ftch7 => 
                -- read 7th WZ base address from RAM
                o_address <= "0000000000000110";
                o_en <= '1';
                o_we <= '0';
                r7_load <= '1';
            when ftch8 => 
                -- read 8th WZ base address from RAM
                o_address <= "0000000000000111";
                o_en <= '1';
                o_we <= '0';
                r8_load <= '1';
            when ftchAddr => 
                -- read address to encode (raw address) from RAM
                o_address <= "0000000000001000";
                o_en <= '1';
                o_we <= '0';
                rAddressRaw_load <= '1';
            when encode => 
                -- save partial encoding into registers
                rEncoding_load <= '1';
            when output => 
                -- once the final encoded address is calculated
                -- write it into RAM
                o_address <= "0000000000001001";
                o_en <= '1';
                o_we <= '1';
            when finish => 
                -- assert o_done signal to '1', then
                -- wait for the i_start signal to go '0'
                -- to eventually terminate the execution
                --if DONE = '0' then
                --    o_done <= '1';
                --    DONE := '1';
                --end if;
                o_done <= '1';
        end case;
    end process;

end Behavioral;




-- Libraries declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Datapath entity
entity datapath is
    Port ( 
           i_clk : in STD_LOGIC; -- input for clock signal
           i_rst : in STD_LOGIC; -- input for reset signal
           i_data : in STD_LOGIC_VECTOR (7 downto 0); -- input from RAM memory
           o_data : out STD_LOGIC_VECTOR (7 downto 0); -- output to RAM memory
           r1_load : in STD_LOGIC; -- inputs to control correct data load into registers
           r2_load : in STD_LOGIC;
           r3_load : in STD_LOGIC;
           r4_load : in STD_LOGIC;
           r5_load : in STD_LOGIC;
           r6_load : in STD_LOGIC;
           r7_load : in STD_LOGIC;
           r8_load : in STD_LOGIC;
           rAddressRaw_load : in STD_LOGIC;
           rEncoding_load : in STD_LOGIC
    );
end datapath;

-- Datapath implementation
architecture Behavioral of datapath is
-- signals declaration
-- registers
signal o_reg1 : STD_LOGIC_VECTOR (7 downto 0); -- base address registers
signal o_reg2 : STD_LOGIC_VECTOR (7 downto 0);
signal o_reg3 : STD_LOGIC_VECTOR (7 downto 0);
signal o_reg4 : STD_LOGIC_VECTOR (7 downto 0);
signal o_reg5 : STD_LOGIC_VECTOR (7 downto 0);
signal o_reg6 : STD_LOGIC_VECTOR (7 downto 0);
signal o_reg7 : STD_LOGIC_VECTOR (7 downto 0);
signal o_reg8 : STD_LOGIC_VECTOR (7 downto 0);
signal o_regAddressRaw : STD_LOGIC_VECTOR (7 downto 0); -- raw address register
signal o_regEncoding1 : STD_LOGIC_VECTOR (7 downto 0); -- registers for datapath stage two: encoding
signal o_regEncoding2 : STD_LOGIC_VECTOR (7 downto 0);
signal o_regEncoding3 : STD_LOGIC_VECTOR (7 downto 0);
signal o_regEncoding4 : STD_LOGIC_VECTOR (7 downto 0);
signal o_regEncoding5 : STD_LOGIC_VECTOR (7 downto 0);
signal o_regEncoding6 : STD_LOGIC_VECTOR (7 downto 0);
signal o_regEncoding7 : STD_LOGIC_VECTOR (7 downto 0);
signal o_regEncoding8 : STD_LOGIC_VECTOR (7 downto 0);
-- arithmetic
signal sub1 : STD_LOGIC_VECTOR (7 downto 0);
signal sub2 : STD_LOGIC_VECTOR (7 downto 0);
signal sub3 : STD_LOGIC_VECTOR (7 downto 0);
signal sub4 : STD_LOGIC_VECTOR (7 downto 0);
signal sub5 : STD_LOGIC_VECTOR (7 downto 0);
signal sub6 : STD_LOGIC_VECTOR (7 downto 0);
signal sub7 : STD_LOGIC_VECTOR (7 downto 0);
signal sub8 : STD_LOGIC_VECTOR (7 downto 0);
-- multiplexers
signal mux1 : STD_LOGIC_VECTOR (7 downto 0);
signal mux2 : STD_LOGIC_VECTOR (7 downto 0);
signal mux3 : STD_LOGIC_VECTOR (7 downto 0);
signal mux4 : STD_LOGIC_VECTOR (7 downto 0);
signal mux5 : STD_LOGIC_VECTOR (7 downto 0);
signal mux6 : STD_LOGIC_VECTOR (7 downto 0);
signal mux7 : STD_LOGIC_VECTOR (7 downto 0);
signal mux8 : STD_LOGIC_VECTOR (7 downto 0);
-- selection signal
signal encoding_sel : STD_LOGIC_VECTOR (7 downto 0);
begin
    -- load Working Zone base address to registers
    WZ1_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg1 <= "00000000";
        elsif falling_edge(i_clk) then
            if(r1_load = '1') then
                o_reg1 <= i_data;
            end if;
        end if;
    end process;
    
    WZ2_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg2 <= "00000000";
        elsif falling_edge(i_clk) then
            if(r2_load = '1') then
                o_reg2 <= i_data;
            end if;
        end if;
    end process;
    
    WZ3_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg3 <= "00000000";
        elsif falling_edge(i_clk) then
            if(r3_load = '1') then
                o_reg3 <= i_data;
            end if;
        end if;
    end process;
    
    WZ4_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg4 <= "00000000";
        elsif falling_edge(i_clk) then
            if(r4_load = '1') then
                o_reg4 <= i_data;
            end if;
        end if;
    end process;
    
    WZ5_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg5 <= "00000000";
        elsif falling_edge(i_clk) then
            if(r5_load = '1') then
                o_reg5 <= i_data;
            end if;
        end if;
    end process;
    
    WZ6_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg6 <= "00000000";
        elsif falling_edge(i_clk) then
            if(r6_load = '1') then
                o_reg6 <= i_data;
            end if;
        end if;
    end process;
    
    WZ7_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg7 <= "00000000";
        elsif falling_edge(i_clk) then
            if(r7_load = '1') then
                o_reg7 <= i_data;
            end if;
        end if;
    end process;
    
    WZ8_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg8 <= "00000000";
        elsif falling_edge(i_clk) then
            if(r8_load = '1') then
                o_reg8 <= i_data;
            end if;
        end if;
    end process;
    
    Raw_address_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_regAddressRaw <= "00000000";
        elsif falling_edge(i_clk) then
            if(rAddressRaw_load = '1') then
                o_regAddressRaw <= i_data;
            end if;
        end if;
    end process;
    
    -- perform subtraction in order to check if
    -- the raw address is in one Working Zone
    sub1 <= std_logic_vector(signed(o_regAddressRaw) - signed(o_reg1));
    sub2 <= std_logic_vector(signed(o_regAddressRaw) - signed(o_reg2));
    sub3 <= std_logic_vector(signed(o_regAddressRaw) - signed(o_reg3));
    sub4 <= std_logic_vector(signed(o_regAddressRaw) - signed(o_reg4));
    sub5 <= std_logic_vector(signed(o_regAddressRaw) - signed(o_reg5));
    sub6 <= std_logic_vector(signed(o_regAddressRaw) - signed(o_reg6));
    sub7 <= std_logic_vector(signed(o_regAddressRaw) - signed(o_reg7));
    sub8 <= std_logic_vector(signed(o_regAddressRaw) - signed(o_reg8));
    
    -- foreach base address, check eventually if
    -- the raw address either belongs to one Working Zone
    -- or not, then choose partial encoding.
    -- Format is: WZ_BIT := 1 & WZ_NUM & WZ_OFFSET or
    -- "00000000" thus to be able to correctly choose
    -- the address encoding in the next stage of
    -- the FSM computation
    with sub1 select
        mux1 <= "10000001" when "00000000",
                "10000010" when "00000001",
                "10000100" when "00000010",
                "10001000" when "00000011",
                "00000000" when others;
                
    with sub2 select
        mux2 <= "10010001" when "00000000",
                "10010010" when "00000001",
                "10010100" when "00000010",
                "10011000" when "00000011",
                "00000000" when others;
                
    with sub3 select
        mux3 <= "10100001" when "00000000",
                "10100010" when "00000001",
                "10100100" when "00000010",
                "10101000" when "00000011",
                "00000000" when others;
                
    with sub4 select
        mux4 <= "10110001" when "00000000",
                "10110010" when "00000001",
                "10110100" when "00000010",
                "10111000" when "00000011",
                "00000000" when others;
                
    with sub5 select
        mux5 <= "11000001" when "00000000",
                "11000010" when "00000001",
                "11000100" when "00000010",
                "11001000" when "00000011",
                "00000000" when others;
                
    with sub6 select
        mux6 <= "11010001" when "00000000",
                "11010010" when "00000001",
                "11010100" when "00000010",
                "11011000" when "00000011",
                "00000000" when others;
                
    with sub7 select
        mux7 <= "11100001" when "00000000",
                "11100010" when "00000001",
                "11100100" when "00000010",
                "11101000" when "00000011",
                "00000000" when others;
                
    with sub8 select
        mux8 <= "11110001" when "00000000",
                "11110010" when "00000001",
                "11110100" when "00000010",
                "11111000" when "00000011",
                "00000000" when others;
                
    -- load partial encoding to registers
    Encoding1_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_regEncoding1 <= "00000000";
        elsif falling_edge(i_clk) then
            if(rEncoding_load = '1') then
                o_regEncoding1 <= mux1;
            end if;
        end if;
    end process;
    
    Encoding2_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_regEncoding2 <= "00000000";
        elsif falling_edge(i_clk) then
            if(rEncoding_load = '1') then
                o_regEncoding2 <= mux2;
            end if;
        end if;
    end process;
    
    Encoding3_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_regEncoding3 <= "00000000";
        elsif falling_edge(i_clk) then
            if(rEncoding_load = '1') then
                o_regEncoding3 <= mux3;
            end if;
        end if;
    end process;
    
    Encoding4_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_regEncoding4 <= "00000000";
        elsif falling_edge(i_clk) then
            if(rEncoding_load = '1') then
                o_regEncoding4 <= mux4;
            end if;
        end if;
    end process;
    
    Encoding5_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_regEncoding5 <= "00000000";
        elsif falling_edge(i_clk) then
            if(rEncoding_load = '1') then
                o_regEncoding5 <= mux5;
            end if;
        end if;
    end process;
    
    Encoding6_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_regEncoding6 <= "00000000";
        elsif falling_edge(i_clk) then
            if(rEncoding_load = '1') then
                o_regEncoding6 <= mux6;
            end if;
        end if;
    end process;
    
    Encoding7_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_regEncoding7 <= "00000000";
        elsif falling_edge(i_clk) then
            if(rEncoding_load = '1') then
                o_regEncoding7 <= mux7;
            end if;
        end if;
    end process;
    
    Encoding8_load: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_regEncoding8 <= "00000000";
        elsif falling_edge(i_clk) then
            if(rEncoding_load = '1') then
                o_regEncoding8 <= mux8;
            end if;
        end if;
    end process;
    
    -- selection signal (one-hot encoding)
    encoding_sel <= o_regEncoding8(7) & 
                    o_regEncoding7(7) & 
                    o_regEncoding6(7) & 
                    o_regEncoding5(7) & 
                    o_regEncoding4(7) & 
                    o_regEncoding3(7) & 
                    o_regEncoding2(7) & 
                    o_regEncoding1(7);
    
    -- select correct address encoding and put it
    -- onto output bus to memory
    with encoding_sel select
        o_data <= o_regEncoding1 when "00000001",
                  o_regEncoding2 when "00000010",
                  o_regEncoding3 when "00000100",
                  o_regEncoding4 when "00001000",
                  o_regEncoding5 when "00010000",
                  o_regEncoding6 when "00100000",
                  o_regEncoding7 when "01000000",
                  o_regEncoding8 when "10000000",
                  o_regAddressRaw when others;

end Behavioral;
