-- Consultando objetos do usu�rio
DESC user_objects;

SELECT object_name, object_type, last_ddl_time, timestamp, status 
FROM   user_objects
WHERE  object_type IN ('PROCEDURE', 'FUNCTION');

-- Verificando os objetos inv�lidos
SELECT object_name, object_type, last_ddl_time, timestamp, status 
FROM   user_objects
WHERE  status = 'INVALID';

-- Consulta do c�digo fontede Procedures e Functions do seu usu�rio
SELECT line, text
FROM   user_source
WHERE  name = 'PRC_INSERE_EMPREGADO' AND type ='PROCEDURE';

-- Consultando a lista de par�metros de uma Procedure ou Function
DESC PRC_INSERE_EMPREGADO;

-- Consultando erros de compila��o
SHOW ERRORS PROCEDURE PRC_INSERE_EMPREGADO;

DESC USER_ERRORS

COLUMN   position FORMAT a4
COLUMN   text FORMAT a60
SELECT   line || '/' || position position, text
FROM     user_errors
WHERE    name = 'PRC_INSERE_EMPREGADO'
ORDER BY line;

-- Consultando depend�ncias de objetos
DESC user_dependencies

SELECT *
FROM user_dependencies
WHERE referenced_name = 'EMPLOYEES' AND 
      referenced_type = 'TABLE';

-- Consultando depend�ncias diretas e indiretas de objetos
SELECT              *
FROM                user_dependencies START WITH referenced_name = 'EMPLOYEES' AND 
                    referenced_type = 'TABLE'
CONNECT BY PRIOR    name = referenced_name AND
                    type = referenced_name;

-- Consultando todos os objetos do usu�rio e os que ele tem privil�gio
DESC all_objects;

SELECT object_name, object_type, last_ddl_time, timestamp, status 
FROM   all_objects
WHERE  object_type IN ('PROCEDURE', 'FUNCTION');

-- Consultando todos os objetos 
SELECT * FROM DBA_OBJECTS;