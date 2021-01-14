-- Acesso de select para usuário aluno nas tabelas abaixo:
--Realizar este grant com usuário system
select user from dual;

GRANT select ON HR.COUNTRIES TO ALUNO WITH GRANT OPTION;
GRANT select ON HR.DEPARTMENTS TO ALUNO WITH GRANT OPTION;
GRANT select ON HR.EMPLOYEES TO ALUNO WITH GRANT OPTION;
GRANT select ON HR.JOB_HISTORY TO ALUNO WITH GRANT OPTION;
GRANT select ON HR.JOBS TO ALUNO WITH GRANT OPTION;
GRANT select ON HR.LOCATIONS TO ALUNO WITH GRANT OPTION;
GRANT select ON HR.REGIONS TO ALUNO WITH GRANT OPTION

-- Executar Querys abaixo com usuário aluno
select user from dual;

--Exemplo operador igual '='
select * from HR.EMPLOYEES a 
where a.JOB_ID = 'IT_PROG';

--Exemplo operador igual '='
select * from HR.EMPLOYEES a
where a.SALARY = '9000';

--Exemplo Operador maior ' > '
select * from HR.EMPLOYEES a
where a.HIRE_DATE > '03/02/06'
order by a.HIRE_DATE asc; -- order by é utilizado para ordenar de fora crescente ou descrescente com base em alguma coluna

--Exemplo operador maior ' > '
select * from HR.EMPLOYEES a 
where a.salary > '9000'
order by a.salary asc;

--Exemplo operador menor ' < '
select * from HR.EMPLOYEES a 
where a.hire_date < '03/02/06'
order by a.hire_date asc;

--Exemplo operador menor ' < '
select * from hr.employees a
where a.salary < '9000'
order by a.salary asc;

--Exemplo operador maior igual ' >= '
select * from hr.employees a
where a.salary >= '9000'
order by a.salary asc;

--Exemplo operador maior igual ' >= '
select * from hr.employees a 
where a.hire_date >= '03/02/06'
order by a.hire_date asc;

--Exemplo operador menor igual ' <= '
select * from hr.employees a 
where a.hire_date <= '05/02/06'
order by a.hire_date asc;

--Exemplo operador menor igua ' <= '
select * from hr.employees a 
where a.salary <= '90000'
order by a.salary desc;

--Exemplo operador diferente ' <> ' 
select * from hr.employees a 
where a.job_id <> 'IT_PROG';

--Exemplo operador diferente ' <> '
select * from hr.employees a 
where a.manager_id <> '100';

--Exemplo combinando operadores
select * from hr.employees a 
where a.job_id = 'IT_PROG'
and a.salary > 4800
and a.manager_id = '103';