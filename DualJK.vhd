--Jonathan West
--03/05/2015
--Lab5p1.vhd (Counter)

--Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Lab5p5 IS
		PORT(
			CLOCK_50 			  :  IN		STD_LOGIC;
			KEY					    :  IN 	STD_LOGIC_VECTOR (1 DOWNTO 0);
			SW						  :  IN 	STD_LOGIC_VECTOR (3 DOWNTO 0);
			LED					    :	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
			REDLED,GREENLED	: 	OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			SWITCHES				:	IN STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
END Lab5p5;

architecture myLogic of Lab5p5 is
	--declarations
	signal J0, J1, K0, K1, S0, S1, R, Q0, Q1, CLK	:	std_logic;
	signal temp					:	std_logic;
	signal clock_1hz, ENABLE_CLK, CLK_DIV	:	std_logic;

begin
	
		process (CLOCK_50, ENABLE_CLK) is		--process for clock division
		variable counter  : integer := 0;		--declares counter as a variable rather than signal
		begin
		  if ENABLE_CLK = '0' then				--won't count if enable is low
			 counter := 0;
			 clock_1hz <= '0';
		  elsif (rising_edge(CLOCK_50)) then	--counts based upon the rising edge of the clock
			 counter :=  counter + 1;
			if counter = 24999999 then			--keeps speed to 1 hz
			 clock_1hz <= not clock_1hz;
			 counter :=  0;
		  end if;
		  end if;
	end process;
		
	
	
	flipflop0 : process (S0, R, clock_1hz)
	begin
		if (S0 = '0' and R = '0') then
			Q0 <= 'Z';
		elsif (S0 = '0' and R = '1') then
			Q0 <= '1';
		elsif (S0 = '1' and R = '0') then
			Q0 <= '0';
		elsif (S0 = '1' and R = '1') then
			if (rising_edge(clock_1hz)) then
				--FF ONE--
				if (J0 = '0' and K0 = '0') then
					Q0 <= Q0;
				elsif (J0 = '1' and K0 = '0') then
					Q0 <= '1';
				elsif (J0 = '0' and K0 = '1') then
					Q0 <= '0';
				elsif (J0 = '1' and K0 = '1') then
					Q0 <= not Q0;
				end if;
			end if;
		end if;			
		if (S1 = '0' and R = '0') then
			Q1 <= 'Z';
		elsif (S1 = '0' and R = '1') then
			Q1 <= '1';
		elsif (S1 = '1' and R = '0') then
			Q1 <= '0';
		elsif (S1 = '1' and R = '1') then
			if (rising_edge(clock_1hz)) then
				--FF TWO--
				if (J1 = '0' and K1 = '0') then
					Q1 <= Q1;
				elsif (J1 = '1' and K1 = '0') then
					Q1 <= '1';
				elsif (J1 = '0' and K1 = '1') then
					Q1 <= '0';
				elsif (J1 = '1' and K1 = '1') then
					Q1 <= not Q1;
				end if;
			end if;
		end if;			
	end process flipflop0;




		--OUTPUT
	GREENLED(0) <= Q0;
	GREENLED(1) <= Q1;
	REDLED(0)	<= clock_1hz;

	--INPUT
	R	<= SWITCHES(0);
	S0	<=	SWITCHES(1);
	S1	<=	SWITCHES(2);
	J0	<= SWITCHES(3);
	K0	<= SWITCHES(4);
	J1 <= SWITCHES(5);
	K1 <= switches(6);
	ENABLE_CLK	<= SWITCHES(7);




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
