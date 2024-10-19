library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_tb is
end top_tb;

architecture structural of top_tb is
    component top
                    port (
                         tdi, tms, tck, trst : in std_logic;
  device_input : in std_logic_vector(15 downto 0);
  device_output : out std_logic_vector( 15 downto 0);
  tdo : out std_logic);
    end component;
	
	signal tdi, tms, tck, trst: std_logic;
	signal device_input : std_logic_vector(15 downto 0);
	signal device_output : std_logic_vector( 15 downto 0);
	signal tdo: std_logic;
	
	constant clk_period: time :=10ns;	
	
begin

toptb: top port map(tdi, tms, tck, trst, device_input, device_output, tdo);

----------setting clk
clock: process
    begin
        tck <= '0';
        wait for clk_period/2;
        tck <= '1';
        wait for clk_period/2; 
    end process;

stimulus: process
        begin
		
		--device_input<= (others=>'0');
		--tdi <= '0';
		-- tms<='0';
		-- tms<='1';
		--wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
	-- tms<='0'; -- run test idle
	-- wait for clk_period;
	-- tms<='1'; -- select dr scan
	-- wait for clk_period;
	-- tms<='0'; -- select ir scan
	-- wait for clk_period;
	-- tms<='0'; -- capture ir
	-- wait for clk_period;
	-- tms<='0'; -- shift ir
	-- wait for clk_period;
	-- tdi<='1';
	-- tms<='1'; -- shift ir

	-- wait for clk_period;
	-- tdi<='0';
	-- tms<='0'; -- exit-1 ir
	-- wait for clk_period;
	-- tms<='0'; -- update ir
	-- wait for clk_period;
	-- run test idle
			
		
		
		
		
		--------------------------enable the line 80 only in case of bypass------------------
		
		--device_input<="0001001000001101";
		
		
		
		----------------------------------------------for ectest, normal, scanin, update and scanout enable bottom code--------------------------
		
		                              -----------EXTEST----------------
		--initialize jtag------
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		--- load intruction ------
		-- tms<='0'; -----idle
		-- wait for clk_period;
		-- tms<='1'; ----selectdr
		-- wait for clk_period;
		-- tms<='1'; -----selectir
		-- wait for clk_period;
		-- tms<='0'; -----captureir
		-- wait for clk_period;
		-- tms<='0'; 
		-- wait for clk_period;
		-- tms<='0'; ----- in shift ir state-
		-- tdi<='0';
		-- wait for clk_period;		
		
		
		
		-- tms<='0'; -----as it is extest tdi=0 for next two cycle---
		
		----wait for clk_period;
		-----tms<='0';
		-- tdi<='1';     ---now mode=0 sel=0
		-- wait for clk_period;
		
		
		
		----wait for clk_period;
		
		------ scan in & update-----------
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='0';---idle
		-- wait for clk_period;
		
		-- tms<='1';
        -- wait for clk_period;
        -- tms<='0';
        -- wait for clk_period;
        -- tms<='0';---shiftdr
        -----wait for clk_period;
		
		
		
		---in shift dr state----  
		             ----for next 32 cycle tms=0 and load any deried value to tdi----
		 -- for i in 1 to 10 loop
		-- wait for clk_period;
		-- tms<='0';
		-- tdi<='1';
		-- end loop;
		-- for i in 1 to 10 loop
		-- wait for clk_period;
		-- tms<='0';
		-- tdi<='0';
		-- end loop;
		-- for i in 1 to 12 loop
		-- wait for clk_period;
		-- tms<='0';
		-- tdi<='1';
		-- end loop;
		
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		---now capture  and scan out--------
		 -- wait for clk_period;
		-- tms<='0';
		 -- wait for clk_period;
		-- tms<='0';
		-- for i in 1 to 32 loop
		 -- wait for clk_period;
		-- tms<='0'; ------tdo should have got updated
		-- end loop;
		
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='1';
		-- wait for clk_period;
		-- tms<='0';  -----total 86 cycles till now
		
		
		
		wait;
        end process;

end structural;	