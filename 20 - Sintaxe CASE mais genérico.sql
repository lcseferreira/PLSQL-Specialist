SET SERVEROUTPUT ON

-- Comando do SQL PLUS: recebe um valor através do PROMPT e insere na variável
ACCEPT pDepartment_id PROMPT 'Digite o ID do departamento: ';
DECLARE
    vPercentual     NUMBER(3);
    -- Referenciando a variável pDepartment_id
    vDepartment_id  employees.department_id%TYPE := &pDepartment_id;
BEGIN
    -- Usando o CASE mais genérico
    CASE 
        WHEN vDepartment_id = 80
        THEN 
            vPercentual := 10; -- Sales
        WHEN vDepartment_id = 20 OR vDepartment_id = 30
        THEN 
            vPercentual := 15; -- Marketing
        WHEN vDepartment_id = 60
        THEN 
            vPercentual := 20; -- IT
        ELSE
            vPercentual := 5;
    END CASE;
    
   DBMS_OUTPUT.PUT_LINE('ID do Departamento: ' || vDepartment_id);
   DBMS_OUTPUT.PUT_LINE('Percentual: ' || vPercentual);
   
   -- Atualizando a tabela funcionários
   UPDATE employees
   SET    salary = salary * (1 + vPercentual / 100)
   WHERE department_id = vDepartment_id;
   
   DBMS_OUTPUT.PUT_LINE('Linhas alteradas: ' || SQL%ROWCOUNT);
   -- COMMIT
END;

SELECT 
    department_id "ID DO DEPARTAMENTO", 
    COUNT(department_id) "CONTAGEM POR DEPARTAMENTO"
FROM 
    employees
GROUP BY 
    department_id
ORDER BY 
    department_id;