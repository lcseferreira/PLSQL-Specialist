SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE 
    -- Declarando um Associative Array com RECORD
    TYPE employees_table_type IS TABLE OF employees%ROWTYPE
    INDEX BY BINARY_INTEGER; -- INDEX BY obrigatório para Associative Array
    
    -- Variável Associative Array
    employees_table employees_table_type;
BEGIN
    SELECT * 
        BULK COLLECT INTO employees_table -- BULK COLLECT de todos (order_id) para a Collection
    FROM employees;
    
    -- Fazendo um for da primeira até a última linha
    FOR i IN employees_table.first..employees_table.last
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                             employees_table(i).first_name || ' - ' ||
                             employees_table(i).last_name || ' - ' ||
                             employees_table(i).phone_number || ' - ' ||
                             employees_table(i).job_id || ' - ' ||
                             TO_CHAR(employees_table(i).salary, '99G999G999G999GD99'));
    END LOOP;
END;