SET SERVEROUTPUT ON

-- Bloco an�nimo com vari�veis no tipo data
DECLARE
    vDate1 DATE := SYSDATE;
    vDate2 DATE := '31/12/1997';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Date 1: ' || vDate1);
    DBMS_OUTPUT.PUT_LINE('Date 2: ' || TO_CHAR(vDate2, 'dd/mm/yy'));
END;