-- Criando uma TRIGGRE
CREATE OR REPLACE TRIGGER B_IUD_EMPLOYEES_S_TRG
-- Antes de fazer um INSERT no employees
    BEFORE INSERT OR UPDATE OR DELETE
    ON employees
BEGIN
    IF (TO_CHAR(SYSDATE, 'DAY') IN ('SABADO', 'DOMINGO') OR
        TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 18)
    THEN 
        CASE 
        WHEN INSERTING
        THEN 
            RAISE_APPLICATION_ERROR(-20001, 'O cadastramento só é permitido em dias da semana e em horário comercial');
        WHEN UPDATING
        THEN 
            RAISE_APPLICATION_ERROR(-20002, 'A atualização só é permitida em dias da semana e em horário comercial');
        ELSE        
            RAISE_APPLICATION_ERROR(-20003, 'A remoção cadastramento só é permitida em dias da semana e em horário comercial');
        END CASE;
    END IF;
END;

-- Testando a TRIGGER - OK 
BEGIN
    pkg_empregados.prc_insere_empregado('Bob', 'Dylan', 'BDYLAN', '123.123.12334', 
    SYSDATE, 'IT_PROG', 26000, NULL, 103, 60);
END;

ROLLBACK;

SELECT * FROM employees ORDER BY employee_id;

SELECT TO_CHAR(TO_DATE('13/02/2022', 'DD/MM/YYYY'), 'DAY') FROM DUAL;

DROP TRIGGER  B_I_EMPLOYEES_S_TRG;