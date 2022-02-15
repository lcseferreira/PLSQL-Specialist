SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT psalary PROMPT 'Digite o ID do empregado: '

-- Vari�vel BIND
VARIABLE gsalary NUMBER

-- Referenciando componentes de uma pkg
BEGIN
    :gsalary := pkg_empregados.fnc_consulta_salario_empregado(pemployee_id=> &psalary);
    DBMS_OUTPUT.PUT_LINE('Sal�rio: ' || :gsalary);
END;