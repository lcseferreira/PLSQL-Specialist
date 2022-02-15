SET SERVEROUTPUT ON

-- Usando o INSERT no PL/SQL
DECLARE
    vfirst_name  employees.first_name%TYPE := 'Lucas';
    vlast_name   employees.last_name%TYPE := 'Eduardo';
    vsalary      employees.salary%TYPE := 10000;
BEGIN
    -- A sintaxe e comportamento do INSERT são as mesmas
    INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date,
    job_id, salary, commission_pct, manager_id, department_id)
    VALUES
    (employees_seq.nextval, vfirst_name, vlast_name, 'LCSEFERREIRA', '456.789.12345',
    SYSDATE, 'IT_PROG', vsalary, 0.4, 103, 60);
    
    COMMIT;
END;

SELECT * FROM employees WHERE first_name = 'Lucas';