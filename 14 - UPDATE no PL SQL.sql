SET SERVEROUTPUT ON

-- Usando o UPDATE no PL/SQL
DECLARE
    vsalary employees.salary%TYPE := 20000;
BEGIN
    -- A sintaxe e comportamento do UPDATE s�o as mesmas
    UPDATE employees
    SET salary = vsalary
    WHERE first_name = 'Lucas';
    
    COMMIT;
END;

SELECT * FROM employees WHERE first_name = 'Lucas';

SELECT * FROM employees;