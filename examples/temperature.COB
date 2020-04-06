       IDENTIFICATION DIVISION.
       PROGRAM-ID. temperature.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Temperature-Fahrenheit PIC S999V9.
       01 Temperature-Celsius PIC S999V9.
       01 Input-Temperature PIC X(5).
       01 Input-From-Type PIC X(10).
       PROCEDURE DIVISION.
           perform Prompt-Input.
           perform Handle-Conversion.
           goback.

       Prompt-Input.
           display "What unit should we convert from?"
           display "Pick one of: Fahrenheit, Celsius."
           accept Input-From-Type
           display "Enter a temperature."
           accept Input-Temperature.

       Handle-Conversion.
           evaluate function lower-case(Input-From-Type(1:1))
             when "f"
               move function numval(Input-Temperature) to
               Temperature-Fahrenheit
               perform Fahrenheit-To-Celsius
               perform Display-Conversions
             when "c"
               move function numval(Input-Temperature) to
               Temperature-Celsius
               perform Celsius-to-Fahrenheit
               perform Display-Conversions
             when other
               display "Error, unsupported conversion: " Input-From-Type
           end-evaluate.

       Celsius-to-Fahrenheit.
           compute Temperature-Fahrenheit rounded
           = (Temperature-Celsius * 1.8) + 32.0.

       Fahrenheit-to-Celsius.
           compute Temperature-Celsius rounded
           = (Temperature-Fahrenheit - 32.0) / (1.8).

       Display-Conversions.
           display "Temperature in Fahrenheit: " Temperature-Fahrenheit
           display "Temperature in Celsius   : " Temperature-Celsius.

       END PROGRAM temperature.
