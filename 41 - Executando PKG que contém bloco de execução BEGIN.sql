SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE('Salário mínimo: ' || pkg_empregados.gminsalary);
END;

BEGIN
    pkg_empregados.prc_insere_empregado(pfirst_name=> 'Lucas' ,plast_name=> 'Rosa',
    pemail=> 'LROSA' ,pphone_number=> '123.123.12333', phire_date=> SYSDATE, pjob_id=> 'IT_PROG',
    psalary=> 2000, pcomission_pct=> 0, pmanager_id=> 100, pdepartment_id=> 60);
END;    

ROLLBACK;

SELECT * 
FROM   employees
WHERE  salary = 2100;