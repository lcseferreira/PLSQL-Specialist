SET SERVEROUTPUT ON

-- Usando o DELETE no PL/SQL
DECLARE
    vemployee_id employees.employee_id%TYPE := 207;
BEGIN
    -- A sintaxe e comportamento do DELETE são as mesmas
    DELETE FROM employees
    WHERE employee_id = vemployee_id;
    
    COMMIT;
END;

SELECT * FROM employees WHERE first_name = 'Lucas';

SELECT * FROM employees;