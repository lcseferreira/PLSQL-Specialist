SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o ID do empregado: ';

DECLARE
    -- Usando uma variável RECORD com o %ROWTIPE
    employee_record     employees%ROWTYPE;
    
    vEmployee_id        employees.employee_id%TYPE := &pEmployee_Id;
BEGIN
    SELECT  * 
    INTO    employee_record
    FROM    employees
    WHERE   employee_id = vEmployee_id;
    
    DBMS_OUTPUT.PUT_LINE(employee_record.employee_id);
    DBMS_OUTPUT.PUT_LINE(employee_record.first_name);
    DBMS_OUTPUT.PUT_LINE(employee_record.last_name);
    DBMS_OUTPUT.PUT_LINE(employee_record.email);
    DBMS_OUTPUT.PUT_LINE(employee_record.phone_number);
END;  

