-- Criando uma Procedure de Banco de Dados

CREATE OR REPLACE PROCEDURE prc_insere_empregado
    -- Declaração de parâmetros
    (pfirst_name    IN employees.first_name%TYPE, 
     plast_name     IN employees.last_name%TYPE,
     pemail         IN employees.email%TYPE,
     pphone_number  IN employees.phone_number%TYPE,
     phire_date     IN employees.hire_date%TYPE DEFAULT SYSDATE,
     pjob_id        IN employees.job_id%TYPE,
     psalary        IN employees.salary%TYPE,
     pcomission_pct IN employees.commission_pct%TYPE,
     pmanager_id    IN employees.manager_id%TYPE,
     pdepartment_id IN employees.department_id%TYPE)
IS
    -- Declaração de variáveis
BEGIN
    -- Ações
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id)
    VALUES (
        employees_seq.nextval,
        pfirst_name,
        plast_name,
        pemail,
        pphone_number,
        phire_date,
        pjob_id,
        psalary,
        pcomission_pct,
        pmanager_id,
        pdepartment_id);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle' || SQLCODE || SQLERRM);
END;


-- Executando a PROCEDURE
BEGIN
    prc_insere_empregado('Lucas', 'Ferreira', 'LCSEFERREIRA', '123.456.7890',
                         SYSDATE, 'IT_PROG', 6000, NULL, 103, 60);
    COMMIT;
END;

-- Consultando o empregado inserido com a PROCEDURE
SELECT *
FROM   employees
WHERE  first_name = 'Lucas';

-- Execuando a PROCEDURE com o comando EXECUTE do SQL*PLUS
EXEC prc_insere_empregado('Lucas', 'Ferreira', 'LCSEFERREIRA2', '123.456.7890', SYSDATE, 'IT_PROG', 6000, NULL, 103, 60)
                         
SELECT *
FROM   employees
WHERE  first_name = 'Lucas';

ROLLBACK;