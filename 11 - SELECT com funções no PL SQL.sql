SET SERVEROUTPUT ON 

DECLARE
    -- Declara��o de vari�veis
    vJob_id       employees.job_id%TYPE := 'IT_PROG';
    vAvg_Salary   employees.salary%TYPE;
    vSum_Salary   employees.salary%TYPE;
BEGIN
    -- SELECT para inserir a m�dia e soma dos sal�rios nas vari�veis
    SELECT ROUND(AVG(e.salary), 2), ROUND(SUM(e.salary), 2)
    INTO   vAvg_Salary, vSum_Salary
    FROM   employees e
    WHERE  e.job_id = vJob_id;
    
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || vJob_id);
    DBMS_OUTPUT.PUT_LINE('M�dia de sal�rios: R$ ' || vAvg_Salary);
    DBMS_OUTPUT.PUT_LINE('Soma de sal�rios: R$ ' || vSum_Salary);
END;