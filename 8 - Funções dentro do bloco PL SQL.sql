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
    
    vNumber1 := 30.1124;
    vNumber2 := 60.4441;
    -- Fun��o ROUND dentro do PL/SQL 
    vAverage := ROUND((vNumber1 + vNumber2) / 2, 2);
    
    -- Fun��o TO_CHAR dentro PL/SQL
    DBMS_OUTPUT.PUT_LINE('A m�dia entre ' || vNumber1 || ' e ' || vNumber2 || ' � ' || TO_CHAR(vAverage));
END;