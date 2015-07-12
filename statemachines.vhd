--Jonathan West
--Lab 6 (Mealy and Moore - Check for letter "J")

--THIS CODE DOESNT HAVE SEVEN SEG OR BINARY OUTPUT LEDS--

--library declaration
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Lab6 IS 
    PORT(
        CLOCK_50 		:     IN STD_LOGIC;
        SWITCHES 		:     IN STD_LOGIC_VECTOR  (7 DOWNTO 0);
        REDLED   		:     OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        GREENLED 		:     OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		SEVENSEG		:		OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
          );
END Lab6;

 ARCHITECTURE RTL OF Lab6  IS 

  type hexMealyState is ( mealy_s0, mealy_s1, mealy_s2, mealy_s3, mealy_s4, mealy_s5, mealy_s6, mealy_s7, mealy_s8,
									mealy_s9, mealy_s10, mealy_s11, mealy_s12, mealy_s13, mealy_s14, mealy_s15, mealy_s16);
  
  type hexMooreState is (moore_s0, moore_s1, moore_s2, moore_s3, moore_s4, moore_s5, moore_s6, moore_s7, moore_s8,
									moore_s9, moore_s10, moore_s11, moore_s12, moore_s13, moore_s14, moore_s15, moore_s16);
  
    signal moore_PS, moore_NS : hexMooreState;
    signal mealy_PS, mealy_NS : hexMealyState;
  
    signal ENABLE_CLK, CLK_DIV, CLR, mooreOut : std_logic; 
    signal mealyOut : std_logic_vector (7 downto 0);
    
BEGIN
----Clock Dividing Process
--process (Clock_50,ENABLE_CLK)
--  variable COUNT:NATURAL:=0;
--  begin
--  if ENABLE_CLK = '0' then
--    COUNT :=0;
--    CLK_DIV <= '0';
--  elsif (CLOCK_50 'EVENT and CLOCK_50 = '1')
--    then COUNT := COUNT +1;
--  if COUNT = 54000000 then
--    CLK_DIV <= not CLK_DIV;
--    COUNT := 0;
--  end if;
--  end if;
--end process;

process(CLK_DIV,moore_NS,mealy_NS, CLR)
begin
  if (CLR = '1') then 
         moore_PS <= moore_s0;
         mealy_PS <= mealy_s0;
  elsif (falling_edge(clock_50)) then 
          moore_PS <= moore_NS;
          mealy_PS <= mealy_NS;
  end if;
end process;
------------------MOORE MACHINE-----------------------
mooreMachine: process(moore_PS,switches(0))
begin
  mooreOut <= '0';
 case moore_PS is 
    when moore_s0  => mooreOut <= '0'; SEVENSEG <= "0000000";
                  if ( switches(0) = '0') then
                      moore_NS <= moore_s1;
					
                  else 
                      moore_NS <= moore_s9;
                  end if;
      when moore_s1  => mooreOut <= '0'; SEVENSEG <= "0000000";
                  if ( switches(0) = '1') then
                      moore_NS <= moore_s2;
							  
                  else 
                      moore_NS <= moore_s10;
                  end if;
     when moore_s2  => mooreOut <= '0'; SEVENSEG <= "0000000";
                  if ( switches(0) = '0') then
                      moore_NS <= moore_s3;
							  
                  else 
                      moore_NS <= moore_s11;
                  end if;
      when moore_s3  => mooreOut <= '0'; SEVENSEG <= "0000000";
                  if ( switches(0) = '0') then
                      moore_NS <= moore_s4;
						else 
                      moore_NS <= moore_s12;
                  end if;
		when moore_s4  => mooreOut <= '0'; SEVENSEG <= "0000000";
                  if ( switches(0) = '1') then
                      moore_NS <= moore_s5;
                  else 
                      moore_NS <= moore_s13;
                  end if;
      when moore_s5  => mooreOut <= '0'; SEVENSEG <= "0000000";
                  if ( switches(0) = '0') then
                      moore_NS <= moore_s6;
                  else 
                      moore_NS <= moore_s14;
                  end if;
     when moore_s6  => mooreOut <= '0'; SEVENSEG <= "0000000";
                  if ( switches(0) = '1') then
                      moore_NS <= moore_s7;
                  else 
                      moore_NS <= moore_s15;
                  end if;
      when moore_s7  => mooreOut <= '0' ;SEVENSEG <= "1111100"; 
					if ( switches(0) = '0') then
                      moore_NS <= moore_s8;
                   else 
                      moore_NS <= moore_s16; 
                  end if;	
							
     when moore_s8 => mooreOut <= '1'; SEVENSEG <= "1111100";
                  moore_NS <= moore_s8;
                  
                  when moore_s9 => mooreOut <= '0'; SEVENSEG <= "0000000";
						moore_NS <= moore_s10;
                  when moore_s10 => mooreOut <= '0'; SEVENSEG <= "0000000";
						moore_NS <= moore_s11;
                  when moore_s11 => mooreOut <= '0'; SEVENSEG <= "0000000";
						moore_NS <= moore_s12;
				  when moore_s12 => mooreOut <= '0'; SEVENSEG <= "0000000";
						moore_NS <= moore_s13;
			      when moore_s13 => mooreOut <= '0'; SEVENSEG <= "0000000";
						moore_NS <= moore_s14;
			      when moore_s14 => mooreOut <= '0'; SEVENSEG <= "0000000";
						moore_NS <= moore_s15;
				  when moore_s15 => mooreOut <= '0'; SEVENSEG <= "0000000";
						moore_NS <= moore_s16; 
				  when moore_s16 => mooreOut <= '0'; SEVENSEG <= "1111001";
						moore_NS <= moore_s16;
 end case;
	end process;
	-----------------MEALY MACHINE--------------------
mealyMachine: process(mealy_PS,switches(0))
begin
--  mealyOut <= "00000000";
  case mealy_PS is
    --****STATE1****
    when mealy_s0 =>
        if (switches(0) = '0') then
            mealy_NS <= mealy_s1;
            mealyOut <= "00000000";
        else
            mealy_NS <= mealy_s9;
            mealyOut <= "00000000";
        end if;
    --****STATE2****
    when mealy_s1 =>
        if (switches(0) = '1') then
            mealy_NS <= mealy_s2;
            mealyOut <= "00000000";
        else
            mealy_NS <= mealy_s10;
            mealyOut <= "00000000";
        end if;
    --****STATE3****
    when mealy_s2 =>
        if (switches(0) = '0') then
            mealy_NS <= mealy_s3;
            mealyOut <= "00000000";
        else
            mealy_NS <= mealy_s11;
            mealyOut <= "00000000";
        end if;
    --****STATE4****
    when mealy_s3 =>
        if (switches(0) = '0') then
            mealyOut <= "00000000";
            mealy_NS <= mealy_s4;
        else
            mealyOut <= "00000000";
            mealy_NS <= mealy_s12;
        end if;
	 --****STATE5****
    when mealy_s4 =>
        if (switches(0) = '1') then
            mealyOut <= "00000000";
            mealy_NS <= mealy_s5;
        else
            mealyOut <= "00000000";
            mealy_NS <= mealy_s13;
        end if;
    --****STATE6****
    when mealy_s5 =>
        if (switches(0) = '0') then
            mealyOut <= "00000000";
            mealy_NS <= mealy_s6;
        else
            mealyOut <= "00000000";
            mealy_NS <= mealy_s14;
        end if;
    --****STATE7****
    when mealy_s6 =>
        if (switches(0) = '1') then
            mealyOut <= "00000000";
            mealy_NS <= mealy_s7;
        else
            mealyOut <= "00000000";
            mealy_NS <= mealy_s15;
        end if;
    --****STATE8****
    when mealy_s7 =>
        if (switches(0) = '0') then
            mealyOut <= "01001010";
            mealy_NS <= mealy_s8;
        else
            mealyOut <= "00000000";
            mealy_NS <= mealy_s16;
        end if;
    --****STATE9****
    when mealy_s8 => mealyOut <= "01001010";
        mealy_NS <= mealy_s8;
    --****ERROR STATES****
    when mealy_s9 => mealyOut <= "00000000";
        mealy_NS <= mealy_s10;
    when mealy_s10 => mealyOut <= "00000000";
        mealy_NS <= mealy_s11;
    when mealy_s11 => mealyOut <= "00000000";
        mealy_NS <= mealy_s12;
    when mealy_s12 => mealyOut <= "00000000";
        mealy_NS <= mealy_s13;
    when mealy_s13 => mealyOut <= "00000000";
        mealy_NS <= mealy_s14;
    when mealy_s14 => mealyOut <= "00000000";
        mealy_NS <= mealy_s15;
    when mealy_s15 => mealyOut <= "00000000";
        mealy_NS <= mealy_s16;
	 when mealy_s16 => mealyOut <= "01000101";
        mealy_NS <= mealy_s16;
end case;
end process;

--OUTPUT

REDLED(7) <= CLK_DIV;
GREENLED <= mealyOut;

--INPUT
CLR <= SWITCHES(2);
ENABLE_CLK <= SWITCHES(3);

end RTL;
        