SET SERVEROUTPUT ON

-- Atributos de Cursor Implícito
DECLARE
    vdepartment_id employees.department_id%TYPE := 60;
    vpercentual     NUMBER(3) := 10;
BEGIN 
    UPDATE employees
    SET    salary = salary * (1 + vpercentual / 100)
    WHERE  department_id = vdepartment_id;
    
    -- Mostrando quantas linhas foram atualizadas
    DBMS_OUTPUT.PUT_LINE('Número de empregados atualizados: ' || SQL%ROWCOUNT);
    -- COMMIT
END;

ROLLBACK;