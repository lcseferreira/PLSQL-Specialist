SET SERVEROUTPUT ON 

DECLARE
    -- Declaração de variáveis
    vNumber1 NUMBER(13, 2);
    vNumber2 NUMBER(13, 2);
    vAverage NUMBER(13, 2);
BEGIN
    /*
    Cálculo do valor da média entre dois números
    Autor: Lucas Ferreira
    Data: 08/02/2022
    */
    
    vNumber1 := 30.1124;
    vNumber2 := 60.4441;
    -- Função ROUND dentro do PL/SQL 
    vAverage := ROUND((vNumber1 + vNumber2) / 2, 2);
    
    -- Função TO_CHAR dentro PL/SQL
    DBMS_OUTPUT.PUT_LINE('A média entre ' || vNumber1 || ' e ' || vNumber2 || ' é ' || TO_CHAR(vAverage));
END;