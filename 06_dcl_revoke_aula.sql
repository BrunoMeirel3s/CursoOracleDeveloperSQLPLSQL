--Parte 2 nega-revoke
SELECT
    user
FROM
    dual;

--Analisando

SELECT
    *
FROM
    dba_sys_privs
WHERE
    grantee LIKE 'aluno';

--Revogando

REVOKE
    CREATE VIEW,
    CREATE PROCEDURE,
    CREATE SESSION,
    CREATE TABLE
FROM aluno;

--Concedendo

GRANT
    CREATE VIEW,
    CREATE PROCEDURE,
    CREATE SESSION,
    CREATE TABLE
TO aluno;

--analisando

SELECT
    *
FROM
    dba_role_privs
WHERE
    grantee LIKE 'aluno';

--Revogando

REVOKE resource FROM aluno;

--concedendo

GRANT resource TO aluno;

--Analisando

SELECT
    *
FROM
    user_tab_privs
WHERE
    grantee LIKE 'aluno';

REVOKE UPDATE ON help FROM aluno;