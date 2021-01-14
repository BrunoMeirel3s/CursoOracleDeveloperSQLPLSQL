--Criar no tablespace aluno
--Criação da tabela senso
CREATE TABLE senso (
    ano             INT NOT NULL,
    cod_uf          CHAR(2) NOT NULL,
    estado          VARCHAR2(50) NOT NULL,
    cod_mun         CHAR(7) NOT NULL,
    nome_mun        VARCHAR2(50) NOT NULL,
    regiao          VARCHAR2(150),
    cod_meso_reg    CHAR(4),
    nome_meso_reg   VARCHAR2(100) NOT NULL,
    cod_mic_reg     CHAR(5) NOT NULL,
    nome_min_reg    VARCHAR2(50) NOT NULL,
    pib             DECIMAL(12, 3) NOT NULL,
    populacao       INTEGER NOT NULL,
    pib_per_cap     DECIMAL(12, 3) NOT NULL
);

CREATE TABLE uf (
    cod_uf     CHAR(2) NOT NULL PRIMARY KEY,
    sigla_uf   CHAR(2) NOT NULL,
    estado     VARCHAR2(50) NOT NULL
);

SELECT
    *
FROM
    senso;

SELECT
    *
FROM
    uf;

-- Operador Where

SELECT
    *
FROM
    senso
WHERE
    nome_mun = 'Jundiaí'
    AND ano = '2014';
    
-- Operador And

SELECT
    *
FROM
    senso
WHERE
    cod_uf = '35'
    AND populacao > 50000
    AND ano = '2014';
    
-- Operador Between

SELECT
    *
FROM
    senso
WHERE
    cod_uf = '35'
    AND populacao BETWEEN 5000 AND 10000
    AND ano = '2014'
ORDER BY
    populacao DESC;
    
-- Operador In

SELECT
    *
FROM
    senso
WHERE
    cod_uf IN (
        '35',
        '12'
    ) -- In é utilizado como and e irá ignorar os demais, no exemplo trará somente as uf 35 e 12
    AND ano = '2014';

-- Operador Not In

SELECT
    *
FROM
    senso
WHERE
    cod_uf NOT IN (
        '35',
        '12'
    ) -- Not nega o comando seguinte, neste caso traria todas as uf exceto '35' e '12'
    AND ano = '2014';
    
-- Like localiza valores que contenham "or" em qualquer lugar

SELECT
    *
FROM
    senso
WHERE
    nome_mun LIKE ( '%or%' )
    AND ano = '2014';
    
-- Like Encontra quaisquer valores que tenham "r" na segunda posição

SELECT
    *
FROM
    senso
WHERE
    nome_mun LIKE '_r%'
    AND ano = '2014';
    
--Like localiza valores que começam com 'A' e termina com 'o'

SELECT
    *
FROM
    senso
WHERE
    nome_mun LIKE 'A%o';
    
-- Like localiza valores que começam com 'A'

SELECT
    *
FROM
    senso
WHERE
    nome_mun LIKE 'A%'
    AND ano = '2014';
    
--Operador Like coringa ' _ '

SELECT
    *
FROM
    senso
WHERE
    nome_mun LIKE '_ra%'
    AND ano = '2014';
    

--Operador not

SELECT
    ano,
    cod_uf,
    estado,
    nome_mun,
    populacao
FROM
    senso
WHERE
    nome_mun NOT LIKE ( 'A%' )
    AND cod_uf = '35'
    AND NOT populacao < 40000
    AND ano = '2014';

SELECT
    ano,
    cod_uf,
    estado,
    nome_mun,
    populacao
FROM
    senso
WHERE
    nome_mun NOT LIKE ( 'A%' )
    AND cod_uf = '35'
    AND NOT populacao > 400000
    AND ano = '2014';
    
    
-- Operador 'or'

SELECT
    *
FROM
    senso
WHERE
    nome_mun LIKE ( 'A%' )
    AND ( cod_uf = '35'
          OR cod_uf = '15' );
          

-- Evidência de erro

SELECT
    *
FROM
    senso
WHERE
    nome_mun LIKE ( 'A%' )
    AND cod_uf = '35' -- Não podemos utilizar and e and neste caso deveríamos usar o 'OR'
    AND cod_uf = '15';


-- Operador is not null

SELECT
    *
FROM
    senso
WHERE
    regiao IS NOT NULL;
    
-- Operador is null

SELECT
    *
FROM
    senso
WHERE
    regiao IS NULL;

-- Preparando cenário is null

SELECT
    *
FROM
    senso
WHERE
    regiao = " ";

UPDATE senso
SET
    regiao = NULL
WHERE
    regiao = "";

UPDATE senso
SET
    regiao = ""
WHERE
    regiao IS NULL;
    
    
-- Operador Having

SELECT
    cod_uf,
    estado,
    COUNT(*) qtd
FROM
    senso
WHERE
    ano = '2014'
GROUP BY
    cod_uf,
    estado
HAVING -- Having é utilizado como filtro, neste caso filtramos os estados que contém cod_mun > 500
    COUNT(cod_mun) > 500;
    
    
-- Operador Having

SELECT
    cod_uf,
    estado,
    COUNT(*) qtd
FROM
    senso
WHERE
    ano = '2014'
GROUP BY
    cod_uf,
    estado
HAVING
    COUNT(cod_mun) <= 500
ORDER BY
    3 DESC; -- Podemos ordenar pelo número específico do elemento, neste caso 3 representa count(*)
    
-- Operador Having

SELECT
    cod_uf,
    estado,
    COUNT(cod_mun) qtd,
    SUM(populacao)
FROM
    senso
WHERE
    ano = '2014'
GROUP BY
    cod_uf,
    estado
HAVING
    SUM(populacao) > 5000000;
    
    
SELECT
    cod_uf,
    estado,
    COUNT(cod_mun) qtd,
    SUM(populacao)
FROM
    senso
WHERE
    ano = '2014'
GROUP BY
    cod_uf,
    estado
HAVING
    SUM(populacao) < 5000000;