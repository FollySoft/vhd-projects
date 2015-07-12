--Jonathan West
--03/05/2015
--Lab5p1.vhd (Counter)

--Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Lab5p4 IS
		PORT(
			CLOCK_50 			  :  IN		STD_LOGIC;
			KEY					    :  IN 	STD_LOGIC_VECTOR (1 DOWNTO 0);
			SW						  :  IN 	STD_LOGIC_VECTOR (3 DOWNTO 0);
			LED					    :	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
			REDLED,GREENLED	: 	OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			SWITCHES				:	IN STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
END Lab5p4;

architecture myLogic of Lab5p4 is
	--declarations
	signal enable0, enable1, Q0, Q1, Q2, Q3	:	std_logic;
	signal D0, D1, D2, D3					:	std_logic;
--	signal clock_1hz, ENABLE_CLK, CLK_DIV	:	std_logic;

begin
--	
--		process (CLOCK_50, ENABLE_CLK) is		--process for clock division
--		variable counter  : integer := 0;		--declares counter as a variable rather than signal
--		begin
--		  if ENABLE_CLK = '0' then				--won't count if enable is low
--			 counter := 0;
--			 clock_1hz <= '0';
--		  elsif (rising_edge(CLOCK_50)) then	--counts based upon the rising edge of the clock
--			 counter :=  counter + 1;
--			if counter = 24999999 then			--keeps speed to 1 hz
--			 clock_1hz <= not clock_1hz;
--			 counter :=  0;
--		  end if;
--		  end if;
--	end process;
		
	
	
	flipflop : process (enable0, enable1)
	begin
		if (enable0 = '1') then
			Q0 <= D0;
			Q1 <= D1;
		else
			Q0 <= Q0;
			Q1 <= Q1;
		end if;
		if (enable1 = '1') then
			Q2 <= D2;
			Q3 <= D3;
		else
			Q2 <= Q2;
			Q3 <= Q3;
		end if;
			
	end process flipflop;




	--OUTPUT
	GREENLED(0) <= Q0;
	GREENLED(1) <= Q1;
	GREENLED(2) <= Q2;
	GREENLED(3) <= Q3;

	--INPUT
	D0	<= SWITCHES(0);
	D1	<=	SWITCHES(1);
	D2	<= SWITCHES(2);
	D3	<= SWITCHES(3);
	enable0 <= SWITCHES(4);
	enable1 <= SWITCHES(5);




------------  TEST LED connections -----------------
--GPIO_1_D(0) <= KEY(1);

------------  TEST BOARD connections -----------------
--LED(0) <= SW(0);
--LED(7) <= '1';

--
--------------  GREEN LED connections -----------------
--GPIO_1_D(2) 	<=  	GREENLED(0);
--GPIO_1_D(4) 	<= 	GREENLED(1);
--GPIO_1_D(6) 	<= 	GREENLED(2);
--GPIO_1_D(8) 	<= 	GREENLED(3);
--GPIO_1_D(10) 	<= 	GREENLED(4);
--GPIO_1_D(12) 	<= 	GREENLED(5);
--GPIO_1_D(14) 	<= 	GREENLED(6);
--GPIO_1_D(16) 	<= 	GREENLED(7);
--
--------------  RED LED connections -------------------
--GPIO_1_D(1) 	<= 	REDLED(0);
--GPIO_1_D(3) 	<= 	REDLED(1);
--GPIO_1_D(5) 	<= 	REDLED(2);
--GPIO_1_D(7) 	<= 	REDLED(3);
--GPIO_1_D(9) 	<= 	REDLED(4);
--GPIO_1_D(11) 	<=	  	REDLED(5);
--GPIO_1_D(13) 	<= 	REDLED(6);
--GPIO_1_D(15) 	<= 	REDLED(7);
--
--------------  Switch connections ----------------
--SWITCHES(0) 	<= 	GPIO_1_D(17);
--SWITCHES(1)		<=		GPIO_1_D(19);
--SWITCHES(2)		<=		GPIO_1_D(21);
--SWITCHES(3)		<=		GPIO_1_D(23);
--SWITCHES(4)		<=		GPIO_1_D(25);
--SWITCHES(5)		<=		GPIO_1_D(27);
--SWITCHES(6)		<=		GPIO_1_D(29);
--SWITCHES(7)		<=		GPIO_1_D(31);


end myLogic;
