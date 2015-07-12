--Jonathan West
--03/05/2015
--Lab5p1.vhd (Counter)

--Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Lab5p2 IS
		PORT(
			CLOCK_50 			  :  IN		STD_LOGIC;
			KEY					    :  IN 	STD_LOGIC_VECTOR (1 DOWNTO 0);
			SW						  :  IN 	STD_LOGIC_VECTOR (3 DOWNTO 0);
			LED					    :	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
			REDLED,GREENLED	: 	OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			SWITCHES				:	IN STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
END Lab5p2;

architecture myLogic of Lab5p2 is
	--declarations
	signal D, S, R, Q, CLK	:	std_logic;
	signal temp					:	std_logic;
	signal clock_1hz, ENABLE_CLK, CLK_DIV	:	std_logic;

	begin
	
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
		
	
	
	flipflop : process (S, R, clock_1hz)
	begin
		if (S = '0' and R = '0') then
			temp <= 'Z';
		elsif (S = '0' and R = '1') then
			temp <= '1';
		elsif (S = '1' and R = '0') then
			temp <= '0';
		else
			if (rising_edge(CloCK_50)) then
				temp <= D;			--TFF "flips" the output signal
			end if;
			end if;
	end process flipflop;
	Q <= temp;




	--OUTPUT
	GREENLED(0) <= Q;
	REDLED(0)	<= clock_1hz;

	--INPUT
	D	<= SWITCHES(0);
	S	<=	SWITCHES(1);
	R 	<= SWITCHES(2);
	ENABLE_CLK	<= SWITCHES(3);



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
