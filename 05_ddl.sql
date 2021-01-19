--DDL Criando tabela
--Criar no banco aluno
CREATE TABLE funcionario (
    matricula   INT NOT NULL PRIMARY KEY,
    nome        VARCHAR2(50) NOT NULL,
    sobrenome   VARCHAR2(50) NOT NULL,
    endereco    VARCHAR2(50),
    cidade      VARCHAR2(50),
    pais        VARCHAR(2),
    data_nasc   DATE --timestamp possível também
);

--DDL Sequencia funcionario

CREATE SEQUENCE id_func2 START WITH 1 INCREMENT BY 1 NOCACHE;

--DDL Criando tabela com chave estrangeira

CREATE TABLE salario (
    matricula   INT NOT NULL,
    salario     DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY ( matricula )
        REFERENCES funcionario ( matricula )
);

--DDL criacao de tabela com chave primaria

CREATE TABLE audit_salario (
    transacao    INT NOT NULL,
    matricula    INT NOT NULL,
    data_trans   TIMESTAMP NOT NULL,
    sal_antigo   DECIMAL(10, 2),
    sal_novo     DECIMAL(10, 2),
    usuario      VARCHAR2(20) NOT NULL,
    PRIMARY KEY ( transacao ),
    FOREIGN KEY ( matricula )
        REFERENCES funcionario ( matricula )
);

-- DDL Sequencia transação
-- Como exemplo podemos iniciar de outro valor além de incrementar de 10 em 10 por exemplo

CREATE SEQUENCE id_tran START WITH 1 INCREMENT BY 1 NOCACHE;

--DDL Criação de Index
--Indexes são utilizados afim de agilizar buscas no banco
--Pois o banco trabalha de forma mais rápida com index

CREATE INDEX ix_func1 ON
    funcionario (
        data_nasc
    );

--DDL Criação de Index

CREATE INDEX ix_func2 ON
    funcionario (
        cidade,
        pais
    );
    
    
--Adicionando um novo campo na tabela

ALTER TABLE funcionario ADD genero CHAR(1);

--select * from funcionario

--Renomeando campo/coluna da tabela

ALTER TABLE funcionario RENAME COLUMN genero TO sexo;

--Modificando tipo de campo

ALTER TABLE funcionario MODIFY
    sexo VARCHAR2(1);
    
-- Renomeando tabela

ALTER TABLE funcionario RENAME TO pessoa;

--Retornando situacao anterior

ALTER TABLE pessoa RENAME TO funcionario;

--DDL Para adicionar coluna na tabela senso

ALTER TABLE senso ADD id INT;

--DDL Para remover coluna na tabela senso

ALTER TABLE senso DROP COLUMN id;

-- select * from senso;

-- Alterando tipo da coluna

ALTER TABLE funcionario MODIFY
    endereco VARCHAR2(30);
    
--Excluindo campo da coluna

ALTER TABLE funcionario DROP COLUMN sexo;

--DDL Criação da database

CREATE DATABASE
teste;

--Excluindo database

DROP TABLE salario;

--Criação de view

CREATE VIEW v_funcionario AS
    SELECT
        *
    FROM
        funcionarios;
--Modificando view
--alter view
CREATE OR REPLACE VIEW v_funcionario AS
    SELECT id, nome FROM
funcionarios;
        
-- Excluindo view

DROP VIEW v_funcionario;

--Excluindo index

DROP INDEX ix_func1;

--Criando index

CREATE INDEX ix_func1 ON
    funcionarios (
        nome
    );
    
--Criando procedure

CREATE OR REPLACE PROCEDURE proc_quadrado (
    v_num1 NUMBER
) IS
    v_num2 NUMBER;
BEGIN
    v_num2 := v_num1 * v_num1;
    dbms_output.put_line('Retorno:' || v_num2);
END;

--Executando procedure

SET SERVEROUTPUT ON; --Habilita a saída das procedures

EXECUTE proc_quadrado(7);

--Excluindo procedure

DROP PROCEDURE proc_quadrado;

--Excluindo trigger

DROP TRIGGER trig_func_salario;

--DDL Truncate

TRUNCATE TABLE senso;

--DDL truncate verificando registros

SELECT
    *
FROM
    funcionarios;

--Criando tabela temporária BK
--Tabelas tempor[arias são utilizadas em transações

CREATE GLOBAL TEMPORARY TABLE tmp_funcionarios (
    id        INT,
    nome      VARCHAR2(50),
    salario   DECIMAL(10, 2),
    setor     VARCHAR2(30)
);

--Fazendo bk nas tabelas temporarias
--Estamos inserindo na tabela tmp_funcionarios o resultado da consulta abaixo

INSERT INTO tmp_funcionarios
    SELECT
        *
    FROM
        funcionarios;
        
--Verificando BK na tabela temporária

SELECT
    *
FROM
    tmp_funcionarios;