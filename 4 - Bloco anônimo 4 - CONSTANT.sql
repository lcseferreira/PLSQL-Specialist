SET SERVEROUTPUT ON

-- Bloco an�nimo com CONSTANT (constantes n�o podem ser modificadas e precisam ser declaradas no DECLARE)
DECLARE
    vPi CONSTANT NUMBER(38,15) := 3.141592653589793;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pi = ' || vPi);
END;