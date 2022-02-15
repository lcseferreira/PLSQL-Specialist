SET SERVEROUTPUT ON

-- Tipos de dados do PL/SQL
DECLARE
    vNumber         NUMBER(10,2) := 1200.50;
    vChar           CHAR(100) := 'Texto de tamanho fixo até 32767 bytes';
    vVarchar        VARCHAR2(100) := 'Texto de tamanho variável até 32767 bytes';
    vBoolean        BOOLEAN := TRUE;
    vDate           DATE := SYSDATE;
    vLong           LONG := 'Texto de tamanho variável universal até 32760 bytes';
    vRowID          ROWID;
    vTimestamp      TIMESTAMP := SYSTIMESTAMP;
    vTimestampZ     TIMESTAMP WITH TIME ZONE := SYSTIMESTAMP;
    vCharUni        NCHAR(100) := 'Texto de tamanho fixo universal';
    vVarcharUni     NVARCHAR2(100) := 'Texto de tamanho variável universal';
    vNumeroInt      BINARY_INTEGER := 1200;
    vNumeroFloat    BINARY_FLOAT := 15000000;
    vNumeroDouble   BINARY_DOUBLE := 15000000;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Número = ' || vNumber);
    DBMS_OUTPUT.PUT_LINE('Char = ' || vChar);
    DBMS_OUTPUT.PUT_LINE('Varchar = ' || vVarchar);
    
    IF vBoolean = TRUE
    THEN
        DBMS_OUTPUT.PUT_LINE('Boolean = ' || 'TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Boolean = ' || 'FALSE OR NULL');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Data = ' || vDate);
    DBMS_OUTPUT.PUT_LINE('Long = ' || vLong);
    
    SELECT ROWID
    INTO   vRowID
    FROM   employees
    WHERE  first_name = 'Steven' AND last_name = 'King';
    
    DBMS_OUTPUT.PUT_LINE('RowID = ' || vRowID);
    DBMS_OUTPUT.PUT_LINE('Timestamp = ' || vTimestamp);
    DBMS_OUTPUT.PUT_LINE('Timestampz = ' || vTimestampz);
    DBMS_OUTPUT.PUT_LINE('Char Uni = ' || vCharUni);
    DBMS_OUTPUT.PUT_LINE('Varchar Uni = ' || vVarcharUni);
    DBMS_OUTPUT.PUT_LINE('Numero Int  = ' || vNumeroInt);
    DBMS_OUTPUT.PUT_LINE('Numero Float  = ' || vNumeroFloat);
    DBMS_OUTPUT.PUT_LINE('Numero Double = ' || vNumeroDouble);
END;