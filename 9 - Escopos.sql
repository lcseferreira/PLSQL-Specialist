SET SERVEROUTPUT ON 

DECLARE 
    vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Vari�vel do Bloco 1: ' || vbloco1);
    -- Se voc� referencia o vbloco2 aqui ocorrer� um erro

    DECLARE
        vbloco2 VARCHAR(20) := 'Bloco 2';
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('Vari�vel do Bloco 1: ' || vbloco1);
        DBMS_OUTPUT.PUT_LINE('Vari�vel do Bloco 2: ' || vbloco2);
    END;
    
    DBMS_OUTPUT.PUT_LINE('Vari�vel do Bloco 1: ' || vbloco1);
    -- Se voc� referencia o vbloco2 aqui ocorrer� um erro
END;