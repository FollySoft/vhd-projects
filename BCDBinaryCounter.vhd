--Jonathan West
--03/05/2015
--Lab4.vhd (Counter)

--Takes a BCD input, passes it through full adders and returns a binary output.

--Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Lab4 IS
		PORT(
			CLOCK_50 			  :  IN		STD_LOGIC;
			KEY					    :  IN 	STD_LOGIC_VECTOR (1 DOWNTO 0);
			SW						  :  IN 	STD_LOGIC_VECTOR (3 DOWNTO 0);
			LED					    :	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
			REDLED,GREENLED	: 	OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			SWITCHES				:	IN STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
END Lab4;

architecture myLogic of Lab4 is
	--declarations
	signal A0, A1, A2, A3, B0, B1, B2, B3	:	std_logic;
	signal COut0, COut1, COut2, COut3, Sum0, Sum1, Sum2, Sum3	:	std_logic;
	signal COut4, COut5, COut6, COut7, Sum4, Sum5, Sum6, Sum7	:	std_logic;

	begin

		--CHIP1
		--FA0
		COut0 <=  ((A1 and B0) or ((A1 xor B0) and '0')); --and '0' because it is grounded
		Sum0  <=  ((A1 xor B0) xor '0');

		--FA1
		COut1 <=  ((A2 and B1) or ((A2 xor B1) and COut0));
		Sum1  <=  ((A2 xor B1) xor COut0);

		--FA2
		COut2 <=  (A3 and B0) or ((A3 xor B0) and COut1);
		Sum2  <=  ((A3 xor B0) xor COut1);

		--FA3
		COut3 <=  (B1 and '0') or ((B1 xor '0') and COut2);
		Sum3  <=  ((B1 xor '0') xor COut2);

		--CHIP2
		--FA0
		COut4 <=  ((Sum2 and B2) or ((Sum2 xor B2) and '0')); --and '0' because it is grounded
		Sum4  <=  ((Sum2 xor B2) xor '0');

		--FA1
		COut5 <=  ((Sum3 and B3) or ((Sum3 xor B3) and COut4));
		Sum5  <=  ((Sum3 xor B3) xor COut4);

		--FA2
		COut6 <=  (COut3 and B2) or ((COut3 xor B2) and COut5);
		Sum6  <=  ((COut3 xor B2) xor COut5);

		--FA3
		COut7 <=  (B3 and '0') or ((B3 xor '0') and COut6);
		Sum7  <=  ((B3 xor '0') xor COut6);

	--OUTPUT
	GREENLED(0) <= A0;
	GREENLED(1) <= Sum0;
	GREENLED(2) <= Sum1;
	GREENLED(3) <= Sum4;
	GREENLED(4) <= Sum5;
	GREENLED(5) <= Sum6;
	GREENLED(6) <= Sum7;

	--INPUT
	A0	<=  SWITCHES(0);
	A1	<=	SWITCHES(1);
	A2	<=	SWITCHES(2);
	A3	<=	SWITCHES(3);
	B0	<=	SWITCHES(4);
	B1 <=	SWITCHES(5);
	B2	<=	SWITCHES(6);
	B3	<=	SWITCHES(7);



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
