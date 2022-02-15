-- Criando uma package specification (HEAD)
CREATE OR REPLACE PACKAGE BODY pkg_empregados
IS
    -- Procedures da package
    PROCEDURE prc_insere_empregado
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
     
    PROCEDURE prc_aumenta_salario_empregado
    -- Parâmetros do tipo IN
    (pemployee_id   IN NUMBER,
     ppercentual    IN NUMBER)
    IS
        -- Nenhuma variável declarada
    BEGIN
        UPDATE employees
        SET    salary = salary * (1 + ppercentual / 100)
        WHERE  employee_id = pemployee_id;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle ' || SQLCODE || SQLERRM);
    END;

     -- Function da package (somente a assinatura)
    FUNCTION fnc_consulta_salario_empregado
    (pemployee_id IN employees.employee_id%TYPE)
    RETURN employees.salary%TYPE
    IS
        vsalary employees.salary%TYPE;
    BEGIN
        SELECT  salary
        INTO    vsalary
        FROM    employees
        WHERE   employee_id = pemployee_id;
    
        -- Retorno da Function
        RETURN (vsalary);
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Empregado inexistente');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || SQLERRM);
    END;
     
END pkg_empregados;