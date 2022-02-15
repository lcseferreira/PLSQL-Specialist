-- Tabela de log pra usar a trigger
DROP TABLE employees_log;

CREATE TABLE employees_log
    (employees_log_id   NUMBER(11) NOT NULL,
     dt_log             DATE DEFAULT SYSDATE NOT NULL,
     usuario            VARCHAR2(30),
     evento             CHAR(1) NOT NULL,
     employee_id        NUMBER(6) NOT NULL,
     salary_old         NUMBER(8,2),
     salary_new         NUMBER(8,2));
     
ALTER TABLE employees_log
ADD CONSTRAINT employees_log_pk PRIMARY KEY (employees_log_id);

CREATE SEQUENCE employees_log_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE NOMAXVALUE;


-- Criando uma trigger que gera log de auditoria para a tabela employees na coluna salary
CREATE OR REPLACE TRIGGER A_IUD_EMPLOYEES_R_TRG
    AFTER INSERT OR UPDATE OF salary OR DELETE
    ON employees
    FOR EACH ROW
DECLARE
    vevento         employees_log.evento%TYPE;
    vemployee_id    employees_log.employee_id%TYPE;
BEGIN
    CASE
        WHEN INSERTING THEN
            vevento         := 'I';
            vemployee_id    := :NEW.employee_id;
        WHEN UPDATING THEN
            vevento         := 'U';
            vemployee_id    := :NEW.employee_id;
        ELSE
            vevento         := 'D';
            vemployee_id    := :OLD.employee_id;
    END CASE;
    INSERT INTO employees_log
        (employees_log_id, dt_log, usuario, evento, employee_id, salary_old, salary_new)
    VALUES 
        (employees_log_seq.nextval,
         SYSDATE,
         USER,
         vevento,
         vemployee_id,
         :OLD.salary,
         :NEW.SALARY);
END A_IUD_EMPLOYEES_R_TRG;

-- Testando o disparo da trigger
BEGIN
    pkg_empregados.prc_aumenta_salario_empregado(pemployee_id=> 208, ppercentual=> 10);
END;

SELECT * FROM employees_log;

UPDATE employees 
SET    salary = salary * 1.1
WHERE  employee_id = 100;