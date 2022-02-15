-- Variável BIND
SET SERVEROUTPUT ON

VARIABLE gMedia NUMBER;

DECLARE
    vNumero1 NUMBER(11,2) := 2000;
    vNumero2 NUMBER(11,2) := 5000;
BEGIN
    -- Para usar uma variável que está fora do bloco, precisamos usar o :
    :gmedia := (vNumero1 + vNumero2) / 2;
    DBMS_OUTPUT.PUT_LINE('Média = ' || :gMedia);
    
    EXCEPTION
        WHEN OTHERS
        THEN
            DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;
