SET SERVEROUTPUT ON

-- Comando SELECT no PL/SQL
DECLARE
    -- Criando uma variável do mesmo tipo da coluna country_name
    vBrazil countries.country_name%TYPE;
BEGIN
    -- SELECT para colocar o resultado na variável
    SELECT c.country_name
    INTO vBrazil
    FROM countries c
    WHERE country_id = 'BR';
    
    DBMS_OUTPUT.PUT_LINE('vBrazil: ' || vBrazil);
END; 

