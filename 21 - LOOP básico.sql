SET SERVEROUTPUT ON

ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
    vNumero        NUMBER(38) := 1;
    vLimite        NUMBER(38) := &pLimite;
BEGIN
    -- Usando o LOOP para imprimir os n�meros de 1 at� o limite
    LOOP
        DBMS_OUTPUT.PUT_LINE('N�mero = ' || TO_CHAR(vNumero));
        EXIT WHEN vNumero = vLimite;
        vNumero := vNUmero + 1;
    END LOOP;
END;