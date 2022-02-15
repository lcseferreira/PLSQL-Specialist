-- Utilizando parâmetros do tipo OUT

CREATE OR REPLACE PROCEDURE prc_consulta_empregado
    -- Declaração de parâmetros
    (pemployee_id   IN  employees.employee_id%TYPE,
     pfirst_name    OUT employees.first_name%TYPE, 
     plast_name     OUT employees.last_name%TYPE,
     pemail         OUT employees.email%TYPE,
     pphone_number  OUT employees.phone_number%TYPE,
     phire_date     OUT employees.hire_date%TYPE,
     pjob_id        OUT employees.job_id%TYPE,
     psalary        OUT employees.salary%TYPE,
     pcomission_pct OUT employees.commission_pct%TYPE,
     pmanager_id    OUT employees.manager_id%TYPE,
     pdepartment_id OUT employees.department_id%TYPE)
IS
    -- Declaração de variáveis
BEGIN
    -- Ações
    SELECT 
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
    INTO
        pfirst_name,
        plast_name,
        pemail,
        pphone_number,
        phire_date,
        pjob_id,
        psalary,
        pcomission_pct,
        pmanager_id,
        pdepartment_id        
    FROM 
        employees
    WHERE 
        employee_id = pemployee_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Empregado não existe: ' || pemployee_id);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle' || SQLCODE || SQLERRM);
END;


-- Executando a PROCEDURE
SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    employees_record employees%ROWTYPE;
BEGIN
    prc_consulta_empregado(208, employees_record.first_name, employees_record.last_name,
    employees_record.email, employees_record.phone_number, employees_record.hire_date, employees_record.job_id,
    employees_record.salary, employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);
    
    DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' - ' ||
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));  
END;
