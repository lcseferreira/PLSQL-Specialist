-- Criando Funções de banco de dados

CREATE OR REPLACE FUNCTION fnc_consulta_salario_empregado
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


-- Executando a Função

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o ID do empregado: '

DECLARE
    vemployee_id employees.employee_id%TYPE := &pemployee_id;
    vsalary employees.salary%TYPE;
BEGIN
    -- Utilizando a function
    vsalary := fnc_consulta_salario_empregado(pemployee_id => vemployee_id);
    DBMS_OUTPUT.PUT_LINE('Salário: ' || vsalary);
END;