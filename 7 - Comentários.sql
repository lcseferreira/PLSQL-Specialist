SET SERVEROUTPUT ON 

DECLARE
    -- Declara��o de vari�veis
    vNumber1 NUMBER(13, 2);
    vNumber2 NUMBER(13, 2);
    vAverage NUMBER(13, 2);
BEGIN
    /*
    C�lculo do valor da m�dia entre dois n�meros
    Autor: Lucas Ferreira
    Data: 08/02/2022
    */
    
    vNumber1 := 30;
    vNumber2 := 60;
    vAverage := (vNumber1 + vNumber2) / 2;
    
    DBMS_OUTPUT.PUT_LINE('A m�dia entre ' || vNumber1 || ' e ' || vNumber2 || ' � ' || vAverage);
END;