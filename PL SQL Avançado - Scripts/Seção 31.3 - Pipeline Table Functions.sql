--
-- Oracle PL/SQL Avançado 
--
-- Seção 33 - Table Functions
--
-- Aula 3 - Pipeline Table Functions

-- Pipeline Functions

CREATE OR REPLACE FUNCTION FNC_FETCH_EMPLOYEES_TABLE_PIPELINE
  (pdepartment_id IN NUMBER)
   RETURN employees_table
   PIPELINED
IS 
  v_employees_table  employees_table := employees_table();
BEGIN
  FOR e IN 
    (SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, 
            salary, commission_pct, manager_id, department_id
     FROM   employees
     WHERE  department_id = pdepartment_id)
  LOOP
    PIPE ROW(employees_row(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                           e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id, 
                           e.department_id));
  END LOOP;
END;

-- Utilizando a Pipelined Function

SELECT *
FROM   TABLE(FNC_FETCH_EMPLOYEES_TABLE_PIPELINE(60));
  