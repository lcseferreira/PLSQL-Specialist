SELECT * FROM employees e ORDER BY e.employee_id;
SELECT * FROM jobs j;

SET SERVEROUTPUT ON

DECLARE
    -- Declaração de variáveis com o tipo do campo que eu quero de retorno
    vFirstName employees.first_name%TYPE;
    vLastName  employees.last_name%TYPE;
    vJobTitle  jobs.job_title%TYPE;
BEGIN
    -- Fazendo um SELECT com JOIN para retornar dados de duas tabelas
    SELECT e.first_name, e.last_name, j.job_title
    INTO vFirstName, vLastName, vJobTitle
    FROM employees e, jobs j
    WHERE e.employee_id = 100
    AND e.job_id = j.job_id;
    
    DBMS_OUTPUT.PUT_LINE('First name: ' || vFirstName);
    DBMS_OUTPUT.PUT_LINE('Last name: ' || vLastName);
    DBMS_OUTPUT.PUT_LINE('Job title: ' || vJobTitle);
END;