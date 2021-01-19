--DDL Cria��o da tabela para exerc�cios
--Criar no banco Aluno
CREATE TABLE funcionarios (
    id        INT NOT NULL,
    nome      VARCHAR(50) NOT NULL,
    salario   DECIMAL(10, 2),
    setor     VARCHAR(30),
    PRIMARY KEY ( id )
)
--Cria��o de atributo com autoincremento
--Neste caso usamos o id_func como valor a ser utilizado no id
CREATE SEQUENCE id_func START WITH 1 INCREMENT BY 1 NOCACHE;

--DML SELECT
--Exemplo Select

SELECT
    *
FROM
    funcionarios;
    
--Exemplo Select

SELECT
    id,
    nome,
    salario,
    setor AS depto
FROM
    funcionarios;
    
--DML INSERT

INSERT INTO funcionarios (
    id,
    nome,
    salario
) VALUES (
    id_func.NEXTVAL,
    'Pedro',
    1000
);

INSERT INTO funcionarios (
    id,
    nome,
    salario
) VALUES (
    id_func.NEXTVAL,
    'Cleiton',
    1000
);

INSERT INTO funcionarios (
    id,
    nome,
    salario,
    setor
) VALUES (
    id_func.NEXTVAL,
    'Jo�o',
    1000,
    ''
);

INSERT INTO funcionarios (
    id,
    nome,
    salario,
    setor
) VALUES (
    id_func.NEXTVAL,
    'Alexandre',
    3000,
    ''
);

INSERT INTO funcionarios (
    id,
    nome,
    salario,
    setor
) VALUES (
    id_func.NEXTVAL,
    'Jos�',
    2000,
    ''
);

-- Simulando erro
-- Caso seja tentado inserir um tipo de dados icosistente com a coluna o oracle ir� informar
-- erro ORA-00984

INSERT INTO funcionarios (
    id,
    nome,
    salario
) VALUES (
    id_func.next_val,
    'Pedro',
    'asasasa'
);


-- DML UPDATE

UPDATE funcionarios
SET
    salario = 1500
WHERE -- sempre use where 
    id = 1;
    
-- Ou aumento de 50% sobre sal�rio atual.

UPDATE funcionarios
SET
    salario = salario * 1.5
WHERE
    id = '2';
    
--Exemplo update com mais de um campo
--Neste exemplo estamos atualizando mais de um atributo ao mesmo tempo
UPDATE funcionarios
SET
    salario = salario * 1.5,
    setor = 'TI'
WHERE
    id <> '1';
    
-- DML Delete
-- delete registro espec�fico
DELETE FROM funcionarios
WHERE
    id = '1';
    

-- DML Select evidencia da exclus�o
SELECT
    *
FROM
    funcionarios;