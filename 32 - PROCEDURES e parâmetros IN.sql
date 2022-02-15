-- Parâmetros do tipo IN

CREATE OR REPLACE PROCEDURE prc_aumenta_salario_empregado
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

SELECT employee_id, salary
FROM   employees
WHERE  first_name = 'Lucas';

-- Executando a PROCEDURE
BEGIN
    prc_aumenta_salario_empregado(pemployee_id => 208, ppercentual => 10);
END;

-- Executando a PROCEDURE
ACCEPT pemployee_id PROMPT 'Digite o ID do empregado';
DECLARE
    vemployee_id employees.employee_id%TYPE := &pemployee_id;
BEGIN
    prc_aumenta_salario_empregado(pemployee_id => vemployee_id, ppercentual => 10);
END;

ROLLBACK;