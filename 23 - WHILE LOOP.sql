SET SERVEROUTPUT ON

ACCEPT pLimite PROMPT 'Digite o valor do limite: ';
DECLARE
    vNumero NUMBER(38) := 1;
    vLimite NUMBER(38) := &pLimite;
BEGIN
    WHILE vNumero <= vLimite LOOP
        DBMS_OUTPUT.PUT_LINE('Número = ' || TO_CHAR(vNumero));
        vNumero := vNumero + 1;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Fora do WHILE');
END;