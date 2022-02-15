-- Criando e utilizando Funções de banco de dados em comandos SQL

CREATE OR REPLACE FUNCTION fnc_consulta_titulo_cargo_empregado
    -- Parâmetros
    (pjob_id IN jobs.job_id%TYPE)
    -- Tipo de retorno
    RETURN VARCHAR2
IS
    vjob_title jobs.job_title%TYPE;
BEGIN
    SELECT  job_title
    INTO    vjob_title
    FROM    jobs
    WHERE   job_id = pjob_id;
    
    -- Retorno da Function
    RETURN (vjob_title);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Função inexistente');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || SQLERRM);
END;

ALTER FUNCTION fnc_consulta_titulo_cargo_empregado COMPILE;

-- Utilizando funções em comandos SQL
SELECT      employee_id, first_name, last_name, job_id, fnc_consulta_titulo_cargo_empregado(job_id) "JOB TITLE"
FROM        employees
ORDER BY    employee_id;

-- Utilizando funções no comando SELECT
SELECT fnc_consulta_titulo_cargo_empregado('IT_PROG')
FROM   dual;

-- Teste
SELECT      e.employee_id, e.first_name, e.last_name, e.job_id, j.job_title
FROM        employees e, jobs j
WHERE       j.job_id = e.job_id
ORDER BY    employee_id;

-- Teste
SELECT      e.employee_id, e.first_name, e.last_name, e.job_id, j.job_title
FROM        employees e
INNER JOIN  jobs j
ON          j.job_id = e.job_id
ORDER BY    employee_id;


SELECT * FROM jobs;