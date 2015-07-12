LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY Lab1D IS 
		PORT(
			CLOCK_50 			:  IN		STD_LOGIC;
			KEY					:  IN 	STD_LOGIC_VECTOR (1 DOWNTO 0);
			SW						:  IN 	STD_LOGIC_VECTOR (3 DOWNTO 0);
			LED					:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
			REDLED,GREENLED	: 	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			SWITCHES				:	IN STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
END Lab1D;

ARCHITECTURE RTL OF Lab1D IS
  
 SIGNAL    A, B, C, D	:	STD_LOGIC;
 SIGNAL    Z				:	STD_LOGIC;
  
  
BEGIN

	Z <= ((not A) or (B and C) or D);
	
	--OUTPUT
	GREENLED(0) <= Z;
	
	--INPUT
	A <= SWITCHES(0);
	B <= SWITCHES(1);
	C <= SWITCHES(2);
	D <= SWITCHES(3);

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
	

END RTL;

  






