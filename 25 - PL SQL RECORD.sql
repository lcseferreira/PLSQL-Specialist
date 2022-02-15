-- Ativa o buffer de saída da pkg DBMS_OUTPUT
SET SERVEROUTPUT ON
-- Não exibe o bloco sendo executado na saída
SET VERIFY OFF
-- Aceitando entrada via PROMPT
ACCEPT pEmployee_id PROMPT 'Digite o ID do empregado: '
DECLARE
-- Declarando uma variável do tipo RECORD
TYPE employee_record_type IS RECORD
    (employee_id    employees.employee_id%TYPE,
     first_name     employees.first_name%TYPE,
     last_name      employees.last_name%TYPE,
     email          employees.email%TYPE,
     phone_number   employees.phone_number%TYPE);
     
     employee_record employee_record_type;

BEGIN
     -- Instânciando minha variável do tipo RECORD
    SELECT employee_id, first_name, last_name, email, phone_number
    INTO   employee_record
    FROM   employees
    WHERE employee_id = &pEmployee_id;
    
    DBMS_OUTPUT.PUT_LINE(employee_record.employee_id);
    DBMS_OUTPUT.PUT_LINE(employee_record.first_name);
    DBMS_OUTPUT.PUT_LINE(employee_record.last_name);
    DBMS_OUTPUT.PUT_LINE(employee_record.email);
    DBMS_OUTPUT.PUT_LINE(employee_record.phone_number);
END;