-- Criando uma package specification (HEAD)
CREATE OR REPLACE PACKAGE pkg_empregados
IS
    -- Variável pública e global
    gMinSalary  employees.salary%TYPE;
    
    -- Procedures da package (somente a assinatura)
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
     pdepartment_id IN employees.department_id%TYPE);
     
     PROCEDURE prc_aumenta_salario_empregado
    -- Parâmetros do tipo IN
    (pemployee_id   IN NUMBER,
     ppercentual    IN NUMBER);
     
     -- Function da package (somente a assinatura)
     FUNCTION fnc_consulta_salario_empregado
    (pemployee_id IN employees.employee_id%TYPE)
    RETURN employees.salary%TYPE;
     
END pkg_empregados;