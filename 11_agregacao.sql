-- AVG - Retorna a média dos valores em um grupo. Valores nulos serão ignorados
SELECT
    *
FROM
    senso;

--AVG Retorna a média dos valores em um grupo, Valores nulos são ignorados

SELECT
    AVG(populacao) AS media
FROM
    senso
WHERE
    ano = '2014';

--AVG Média por estado

SELECT
    estado,
    AVG(populacao) AS media_da_populacao
FROM
    senso
WHERE
    ano = '2014'
GROUP BY
    estado
ORDER BY
    2;

--AVG Média por estado com sigla estado

SELECT
    a.cod_uf,
    b.sigla_uf,
    AVG(populacao) media
FROM
    senso   a
    INNER JOIN uf      b ON a.cod_uf = b.cod_uf
WHERE
    a.ano = '2014'
GROUP BY
    a.cod_uf,
    b.sigla_uf
ORDER BY
    3 DESC;

--AVG Por Região
-- AVG Média por região

SELECT
    a.regiao,
    AVG(populacao)
FROM
    senso a
WHERE
    a.ano = '2014'
GROUP BY
    a.regiao
ORDER BY
    2 DESC;
    
-- Min retorna o valor mínimo na expressão. Pode ser seguido pela cláusula OVER

SELECT
    MIN(a.populacao)
FROM
    senso a
WHERE
    a.ano = '2014';

--Min Por Estado

SELECT
    a.estado,
    MIN(a.populacao)
FROM
    senso a
WHERE
    a.ano = '2014'
GROUP BY
    estado;
    
-- Min por região

SELECT
    a.regiao,
    MIN(a.populacao)
FROM
    senso a
WHERE
    a.ano = '2014'
GROUP BY
    regiao
ORDER BY
    2;
    
-- script 135
--Max retorna o valor máximo na expressão

SELECT
    MAX(populacao)
FROM
    senso
WHERE
    ano = '2014';

--Max por estado

SELECT
    a.estado,
    MAX(a.populacao)
FROM
    senso a
WHERE
    a.ano = '2014'
GROUP BY
    estado
ORDER BY
    2 DESC;
    
-- Max por sigla estado

SELECT
    b.sigla_uf,
    MAX(a.populacao) AS maximo
FROM
    senso   a
    INNER JOIN uf      b ON a.cod_uf = b.cod_uf
WHERE
    ano = '2014'
GROUP BY
    b.sigla_uf
ORDER BY
    2;
    
-- SUM Por estado

SELECT
    a.cod_uf,
    SUM(a.populacao)
FROM
    senso a
WHERE
    ano = '2014'
GROUP BY
    a.cod_uf
ORDER BY
    2 DESC;
    
-- Sum por região

SELECT
    b.sigla_uf,
    SUM(a.populacao) AS maximo
FROM
    senso   a
    INNER JOIN uf      b ON a.cod_uf = b.cod_uf
WHERE
    ano = 2014
GROUP BY
    b.sigla_uf
ORDER BY
    2;
 -- COUNT

SELECT
    COUNT(*)
FROM
    senso a
WHERE
    a.ano = '2014';

--Count retornando o número de cidades por ano

SELECT
    a.ano,
    COUNT(*) qtq_cidades
FROM
    senso a
GROUP BY
    ano
ORDER BY
    ano;
    
--Descobrindo quantidade de estados

SELECT
    COUNT(DISTINCT cod_uf)
FROM
    senso;

--Exemplo 

SELECT
    COUNT(cod_uf)
FROM
    senso;

--Count por estado

SELECT
    a.estado,
    COUNT(*)
FROM
    senso a
WHERE
    ano = '2014'
GROUP BY
    a.estado
ORDER BY
    2 DESC;
    
--Count por região

SELECT
    a.regiao,
    COUNT(*)
FROM
    senso a
WHERE
    ano = '2014'
GROUP BY
    a.regiao
ORDER BY
    2 DESC;
    
--Usando varias funções de agregação

SELECT
    AVG(a.populacao) media_pop,
    MIN(a.populacao) min_pop,
    MAX(a.populacao) max_populacao,
    SUM(a.populacao) total_pop,
    COUNT(*) qtd_cidades
FROM
    senso a
WHERE
    a.ano = '2014';
    
--Apresentar nome da cidade com maior populacao de cada estado

SELECT
    a.estado,
    a.nome_mun,
    a.populacao
FROM
    (
        SELECT
            b.estado,
            MAX(b.populacao) AS populacao
        FROM
            senso b
        WHERE
            b.ano = '2014'
        GROUP BY
            b.estado
    ) b
    JOIN senso a ON a.estado = b.estado
                    AND a.populacao = b.populacao
WHERE
    a.ano = '2014'
ORDER BY
    a.populacao DESC;
    
--Apresentar nome da cidade com menor populacao de cada estado

SELECT
    a.estado,
    a.nome_mun,
    a.populacao
FROM
    (
        SELECT
            b.estado,
            MIN(b.populacao) AS populacao
        FROM
            senso b
        WHERE
            b.ano = '2014'
        GROUP BY
            b.estado
    ) b
    JOIN senso a ON a.estado = b.estado
                    AND a.populacao = b.populacao
WHERE
    a.ano = '2014'
ORDER BY
    a.populacao DESC;
    
--STDDEV Retorna o desvio padrão estatístico de todos os valores da expressão especificada

SELECT
    STDDEV(a.populacao)
FROM
    senso a
WHERE
    a.ano = '2014';


--Comparando crescimento pop da cidades ref anos 2010 a 2014
--select cod_uf, cod_mun, cod_uf=cod_mun as concatenado from cidades
--Usando exemplo

SELECT
    a.nome_mun,
    a.populacao   AS senso_2010,
    b.populacao   AS senso_2014,
    ( 100 / a.populacao ) * ( b.populacao ) - 100 AS percentual
FROM
    senso   a
    INNER JOIN senso   b ON a.cod_mun = b.cod_mun
WHERE
    a.ano = '2010'
    AND b.ano = '2014';

--Comparando crescimento populacional por estado ref anos 2010 e 2014

SELECT
    a.estado,
    SUM(a.populacao) AS senso_2010,
    SUM(b.populacao) AS senso_2014,
    ( 100 / SUM(a.populacao) ) * ( SUM(b.populacao) ) - 100 AS percentual
FROM
    senso   a
    INNER JOIN senso   b ON a.cod_mun = b.cod_mun
WHERE
    a.ano = '2010'
    AND b.ano = '2014'
GROUP BY
    a.estado;