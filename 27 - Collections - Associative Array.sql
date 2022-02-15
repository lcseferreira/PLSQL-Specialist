SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE 
    -- Declarando um Associative Array
    TYPE Numero_Table_Type IS TABLE OF NUMBER(2)
    INDEX BY BINARY_INTEGER;
    
    Numero_Table Numero_Table_Type;
BEGIN
    -- Armazena números de 1 a 10 em um Associative Array
    FOR I IN 1..10
    LOOP
        Numero_Table(I) := I;
    END LOOP;
    
    -- Lê o Associative Array e imprime os números armazenados
    FOR I IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE('Associative Array: Índice = ' || I || ', Valor = ' || Numero_Table(I));
    END LOOP;
END;