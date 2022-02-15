SET SERVEROUTPUT ON 
DECLARE
    vTotal NUMBER(38);
BEGIN
    -- Label para indicar o LOOP 1
    <<LOOP1>>
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('TABUADA DO: ' || i);
        -- Label para indicar o LOOP 2
        <<LOOP2>>
        FOR j IN 1..10 LOOP
        vTotal := i * j;
        DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || vTotal );
        END LOOP;
    END LOOP;
END;