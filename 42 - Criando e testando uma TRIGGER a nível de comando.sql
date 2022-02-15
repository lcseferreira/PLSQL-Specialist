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
            RAISE_APPLICATION_ERROR(-20001, 'O cadastramento s� � permitido em dias da semana e em hor�rio comercial');
        WHEN UPDATING
        THEN 
            RAISE_APPLICATION_ERROR(-20002, 'A atualiza��o s� � permitida em dias da semana e em hor�rio comercial');
        ELSE        
            RAISE_APPLICATION_ERROR(-20003, 'A remo��o cadastramento s� � permitida em dias da semana e em hor�rio comercial');
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