--Jonathan West
--02/26/2015
--Lab3Pt1.vhd (Counter using DE0-nano Push Buttons)

--Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Lab3Part1 IS 
		PORT(
			CLOCK_50 			  :  IN		STD_LOGIC;
			KEY					    :  IN 	STD_LOGIC_VECTOR (1 DOWNTO 0);
			SW						  :  IN 	STD_LOGIC_VECTOR (3 DOWNTO 0);
			LED					    :	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
			REDLED,GREENLED	: 	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			SWITCHES				:	IN STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
END Lab3Part1;

architecture myLogic of Lab3Part1 is
	--declarations
	signal bcdValue : std_logic_vector(3 downto 0);
	signal clk_1hz, temp_clock, updown, count, enable, reset, clock_en  : std_logic;
begin
  process(bcdValue, updown, count, enable, reset) is

  begin
    if (enable = '1') then					--start of enable
      if (reset = '1') then					--allows for a 'clear' function
        if (falling_edge(count)) then
          if (updown = '0') then			--controls the counting direction

            case bcdValue is				--all counting values from 0 to 9
              when "0000" => bcdValue <= "0001";
              when "0001" => bcdValue <= "0010";
			  when "0010" => bcdValue <= "0011";
			  when "0011" => bcdValue <= "0100";
			  when "0100" => bcdValue <= "0101";
			  when "0101" => bcdValue <= "0110";
			  when "0110" => bcdValue <= "0111";
			  when "0111" => bcdValue <= "1000";
			  when "1000" => bcdValue <= "1001";
			  when others => bcdValue <= "0000";
            end case;

          else
            case bcdValue is
              when "1001" => bcdValue <= "1000";
              when "1000" => bcdValue <= "0111";
				  when "0111" => bcdValue <= "0110";
				  when "0110" => bcdValue <= "0101";
				  when "0101" => bcdValue <= "0100";
				  when "0100" => bcdValue <= "0011";
				  when "0011" => bcdValue <= "0010";
				  when "0010" => bcdValue <= "0001";
				  when "0001" => bcdValue <= "0000";
				  when others => bcdValue <= "1001";
            end case;
          end if;		--end of updown
        else	`		-- end of count
        end if;
      else				--end of reset
        bcdValue <= "0000";
      end if;
    else				-- end of enable
    end if;
  end process;

	--OUTPUT
	REDLED(0) <= bcdValue(0);
	REDLED(1) <= bcdValue(1);
	REDLED(2) <= bcdValue(2);
	REDLED(3) <= bcdValue(3);
	
	--INPUT
	enable		<= SWITCHES(0);
	updown		<= SWITCHES(1);
	count			<= KEY(1);
	reset 		<= KEY(0);
	

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
