--Exemplos de union all
--Operador union all retorna todos os registros dos dois selects, desde que
--as tabelas possuam o mesmo número de colunas bem como dos mesmos tipos
SELECT
    employee_id,
    first_name,
    salary
FROM
    hr.employees
UNION ALL
SELECT
    employee_id,
    first_name,
    salary
FROM
    hr.employees
ORDER BY
    1;
    
--Exemplo de union    
--Union realiza um distinct na busca, desta forma o mesmo não retorna valores repetidos
SELECT
    employee_id,
    first_name,
    salary
FROM
    hr.employees
UNION
SELECT
    employee_id,
    first_name,
    salary
FROM
    hr.employees
ORDER BY
    1;
    
--Simulando erro 1

SELECT
    employee_id,
    first_name,
    salary
FROM
    hr.employees
UNION
SELECT
    employee_id,
    first_name
FROM
    hr.employees
ORDER BY
    1;
    
-- Simulando erro 2

SELECT
    employee_id,
    salary,
    first_name
FROM
    hr.employees
UNION
SELECT
    employee_id,
    first_name,
    salary
FROM
    hr.employees
ORDER BY
    1;
    
--Campos diferentes mas mesmos tipos

SELECT
    employee_id,
    first_name,
    salary
FROM
    hr.employees
UNION
SELECT
    employee_id,
    last_name,
    salary
FROM
    hr.employees
ORDER BY
    1;

-- Exemplo union all

SELECT
    'A' AS campo1,
    'B' AS campo2
FROM
    dual
UNION ALL
SELECT
    'A' AS campo3,
    'B' AS campo4
FROM
    dual;

--Exemplo union

SELECT
    'A' AS campo1,
    'B' AS campo2
FROM
    dual
UNION
SELECT
    'A' AS campo3,
    'B' AS campo4
FROM
    dual;

--Exemplo usando union

SELECT
    ano,
    estado
FROM
    senso
WHERE
    ano = '2014'
UNION
SELECT
    ano,
    estado
FROM
    senso
WHERE
    ano = '2013'
    
--Exemplo usando o union all
SELECT
    ano,
    estado
FROM
    senso
WHERE
    ano = '2014'
UNION ALL
SELECT
    ano,
    estado
FROM
    senso
WHERE
    ano = '2013'
    
--Exemplo com union
SELECT
    ano,
    estado,
    nome_mun,
    populacao
FROM
    senso
WHERE
    ano = '2014'
    AND cod_uf = '11'
UNION
SELECT
    ano,
    estado,
    nome_mun,
    populacao
FROM
    senso
WHERE
    ano = ' 2013
    AND cod_uf = '11'
ORDER BY
    nome_mun,
    ano;
