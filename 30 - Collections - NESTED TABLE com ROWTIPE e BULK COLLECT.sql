SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    -- Tipo NESTED TABLE é uma variável do tipo...
    TYPE employees_nested_table IS TABLE OF employees%ROWTYPE;
    
    -- NESTED TABLE é obrigatório inicializar
    employees_table employees_nested_table := employees_nested_table();
BEGIN
    SELECT * 
        BULK COLLECT INTO employees_table -- BULK COLLECT de todos (order_id) para a Collection
    FROM employees;

    FOR i IN employees_table.first..employees_table.last
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                             employees_table(i).first_name || ' - ' || 
                             employees_table(i).last_name || ' - ' || 
                             employees_table(i).job_id || ' - ' || 
                             employees_table(i).salary);
    END LOOP;
END;