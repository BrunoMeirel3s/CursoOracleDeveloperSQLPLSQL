--Subselect

--Descobrir todos atores que fizeram o filme com seguintes parametros
-- film_id = 1 com title = ACADEMY DINOSAUR
-- Conhecer a estrutura das tabelas alvo

select * from hr.employees;
select * from hr.job_history;
select * from hr.departments;
select * from hr.jobs;

--Exemplo de subselect 1 operador in
select * from hr.employees a where a.employee_id in (select b.employee_id from HR.job_history b);

--Exemplo de subselect 2 operador in
select * from hr.employees a where a.manager_id='100'
and a.employee_id in (select b.employee_id from HR.job_history b);

--Exemplo de subselect 3 operador in
select * from hr.employees a where a.employee_id in (select b.employee_id from HR.job_history b where b.department_id='50');

--Exemplo de subselect 4 not in
select * from hr.employees a where a.employee_id not in (select b.employee_id from HR.job_history b);

--Exemplo de subselect 5 not in
select * from hr.employees a where a.manager_id='100' and a.employee_id not in (select b.employee_id from HR.job_history b);

--Exemplo de subselect 6 operador not in
select * from hr.employees a 
where a.employee_id not in (select b.employee_id from HR.job_history b where b.department_id='50');