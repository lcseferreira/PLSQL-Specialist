SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    -- Tipo NESTED TABLE é uma variável do tipo...
    TYPE numero_nested_table IS TABLE OF INTEGER(2);
    
    -- NESTED TABLE é obrigatório inicializar
    numero_table numero_nested_table := numero_nested_table();
BEGIN
    FOR i IN 1..10
    LOOP
        -- Primeiro é preciso alocar a ocorrência
        numero_table.EXTEND;
        numero_table(i) := i;
    END LOOP;
    
    -- Lê a NESTED TABLE e imprime os valores armazenados
    FOR i IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE('Índice: ' || i || ', Valor: ' || numero_table(i));
    END LOOP;
END;