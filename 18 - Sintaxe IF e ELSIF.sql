SET SERVEROUTPUT ON

-- Comando do SQL PLUS: recebe um valor através do PROMPT e insere na variável
ACCEPT pDepartment_id PROMPT 'Digite o ID do departamento: ';
DECLARE
    vPercentual     NUMBER(3);
    -- Referenciando a variável pDepartment_id
    vDepartment_id  employees.department_id%TYPE := &pDepartment_id;
BEGIN
    -- IF com ELSIF
    IF vDepartment_id = 80
    THEN 
        vPercentual := 10; -- Sales
    ELSIF vDepartment_id = 20
    THEN
        vPercentual := 15; -- Marketing
    ELSIF vDepartment_id = 60
    THEN
        vPercentual := 20; -- IT
    ELSE vPercentual := 5;
    END IF;
   
   DBMS_OUTPUT.PUT_LINE('ID do Departamento: ' || vDepartment_id);
   DBMS_OUTPUT.PUT_LINE('Percentual: ' || vPercentual);
   
   -- Atualizando a tabela funcionários
   UPDATE employees
   SET    salary = salary * (1 + vPercentual / 100)
   WHERE department_id = vDepartment_id;
   
   DBMS_OUTPUT.PUT_LINE('Linhas alteradas: ' || SQL%ROWCOUNT);
   -- COMMIT
END;

SELECT * FROM employees ORDER BY department_id ASC;