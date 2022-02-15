SET SERVEROUTPUT ON

ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
    vNumero        NUMBER(38) := 1;
    vLimite        NUMBER(38) := &pLimite;
BEGIN
    -- Usando o FOR LOOP para imprimir os números de 1 até o limite
    FOR i IN vNumero..vLimite LOOP
        DBMS_OUTPUT.PUT_LINE('Número = ' || TO_CHAR(i));
    END LOOP;
END;