SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    -- Tipo NESTED TABLE � uma vari�vel do tipo...
    TYPE numero_nested_table IS TABLE OF INTEGER(2);
    
    -- NESTED TABLE � obrigat�rio inicializar
    numero_table numero_nested_table := numero_nested_table();
BEGIN
    FOR i IN 1..10
    LOOP
        -- Primeiro � preciso alocar a ocorr�ncia
        numero_table.EXTEND;
        numero_table(i) := i;
    END LOOP;
    
    -- L� a NESTED TABLE e imprime os valores armazenados
    FOR i IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE('�ndice: ' || i || ', Valor: ' || numero_table(i));
    END LOOP;
END;