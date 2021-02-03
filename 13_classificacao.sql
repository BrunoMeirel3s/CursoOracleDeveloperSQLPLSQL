--A diferen�a entre o  RANK e o DENSE_RANK � que o segundo n�o salta valores ap�s classifica��es repetidas.
--usando ROW_NUMBER (ROW_NUMBER � utilizado para contar a quantidade de registros)
--NTILE divide em grupos de acordo com o sql informado entre parenteses
--neste exemplo dividimos em 4 grupos de acordo com o sal�rio
SELECT
    ROW_NUMBER() OVER(
        ORDER BY
            a.salary DESC
    ) sequencia,
    a.first_name,
    a.salary,
    NTILE(4) OVER(
        ORDER BY
            a.salary DESC
    ) faixa
FROM
    hr.employees a
ORDER BY
    a.salary DESC;

-- usando RANK()
--Rank � utilizado para criar um ranking entre os resultados, caso o campo rankeado possua registros
--semelhantes o valor seguinte ser� pulado
SELECT
    RANK() OVER(
        ORDER BY
            a.salary DESC
    ) classificacao,
    a.first_name,
    a.salary
FROM
    hr.employees a
ORDER BY
    a.salary desc;

-- usando RANK() eDENSE_RANK()

SELECT
    RANK() OVER(
        ORDER BY
            a.salary DESC
    ) classif_geral,
    DENSE_RANK() OVER(
        ORDER BY
            a.salary DESC
    ) classif_densa,
    a.first_name,
    a.salary,
    a.job_id
FROM
    hr.employees a
ORDER BY
    a.salary DESC;

--
SELECT
    RANK() OVER(
        ORDER BY
            a.salary DESC
    ) classif_geral1,
    RANK() OVER(
        PARTITION BY a.job_id
        ORDER BY
            a.salary DESC
    ) classif_geral2,
    a.first_name,
    a.salary,
    a.job_id
FROM
    hr.employees a
ORDER BY
    a.salary DESC;

--

SELECT
    RANK() OVER(
        ORDER BY
            a.salary DESC
    ) classif_geral,
    RANK() OVER(
        PARTITION BY a.job_id
        ORDER BY
            a.salary DESC
    ) classif_densa,
    a.first_name,
    a.salary,
    a.job_id
FROM
    hr.employees a
ORDER BY
    a.salary DESC;


--usando NTILE

SELECT
    a.job_title,
    a.max_salary,
    NTILE(5) OVER(
        ORDER BY
            a.max_salary DESC
    ) faixa
FROM
    hr.jobs a
ORDER BY
    a.max_salary DESC;
--usando NTILE

SELECT
    a.first_name,
    a.salary,
    NTILE(4) OVER(
        ORDER BY
            a.salary DESC
    ) faixa
FROM
    hr.employees a
ORDER BY
    a.salary DESC;




