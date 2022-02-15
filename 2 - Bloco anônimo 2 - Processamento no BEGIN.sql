SET SERVEROUTPUT ON 

DECLARE
    vNumber1 NUMBER(10,2) := 100;
    vNumber2 NUMBER(10,2) := 150;
    vSum NUMBER(10,2);
BEGIN
    vSum := vNumber1 + vNumber2;
    DBMS_OUTPUT.PUT_LINE(vNumber1 || ' + ' || vNumber2 || ' = ' || vSum);
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;