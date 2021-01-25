--Subselect retornando coluna
SELECT
    a.employee_id,
    a.first_name,
    a.job_id,
    (
        SELECT
            b.job_title
        FROM
            hr.jobs b
        WHERE
            a.job_id = b.job_id
    ) AS cargo
FROM
    hr.employees a;
    
--Subselect retornando coluna

SELECT
    a.employee_id,
    a.first_name,
    a.department_id,
    (
        SELECT
            b.department_name
        FROM
            hr.departments b
        WHERE
            a.department_id = b.department_id
    ) AS depto
FROM
    hr.employees a;
    
--Subselect retornando coluna

SELECT
    a.department_id,
    a.department_name,
    a.manager_id,
    (
        SELECT
            b.first_name
        FROM
            hr.employees b
        WHERE
            a.manager_id = b.employee_id
    ) AS manager_name
FROM
    hr.departments a;

--Subselect com valor agregado soma

SELECT
    a.department_id,
    a.department_name,
    (
        SELECT
            SUM(b.salary)
        FROM
            hr.employees b
        WHERE
            a.department_id = b.department_id
    ) AS salario_depto
FROM
    hr.departments a;
    
--Subselect com valor agregado a soma

SELECT
    a.department_id,
    a.department_name,
    (
        SELECT
            SUM(b.salary)
        FROM
            hr.employees b
        WHERE
            a.department_id = b.department_id
    ) AS salario_depto,
    (
        SELECT
            COUNT(*)
        FROM
            hr.employees b
        WHERE
            a.department_id = b.department_id
    ) AS qtd_func
FROM
    hr.departments a;
    
-- Select

SELECT
    a.department_id,
    a.department_name,
-- Calculo total salário
    (
        SELECT
            SUM(b.salary)
        FROM
            hr.employees b
        WHERE
            a.department_id = b.department_id
    ) AS salario_depto,
--Cálculo qtd funcionários
    (
        SELECT
            COUNT(*)
        FROM
            hr.employees b
        WHERE
            a.department_id = b.department_id
    ) AS qtd_func,
--Média
    (
        SELECT
            SUM(b.salary)
        FROM
            hr.employees b
        WHERE
            a.department_id = b.department_id
    ) / (
        SELECT
            COUNT(*)
        FROM
            hr.employees b
        WHERE
            a.department_id = b.department_id
    ) AS media
FROM
    hr.departments a;