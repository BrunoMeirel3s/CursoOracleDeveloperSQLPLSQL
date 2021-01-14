-- Operador de Adi��o ' + '
select 1 + 3 as resultado from dual;

select a.first_name, 
       a.salary,
       a.salary + 530 as salario_novo -- podemos somar um valor diretamente na coluna, este valor ser� adicionado para cada elemento resultado
       from hr.employees a;
       
--Operador de subtra��o
select 1-3 as resultado from dual;

select 7-4 as resultado from dual;

select a.first_name,
       a.salary,
       a.salary - 530 salario_novo
       from hr.employees a;
       
--Operador de multiplica��o ' * '
select 2 * 3 as resultado from dual;
select 7 * 4 as resultado from dual;

select (7*4)*-1 as resultado from dual;

select a.first_name,
       a.salary,
       a.salary * 0.10 as valor_acrescimo,
       a.salary * 1.10 as salario_novo
       from hr.employees a;

-- Operador de divis�o ' / '
select 2 / 4 as resultado from dual;
select 7 / 4 as resultado from dual;

select a.first_name,
       a.salary,
       a.salary / 10 as salario_novo
       from hr.employees a ;
       
-- Operador MOD %
select mod(10, 5) as resultado from dual; -- podemos utilizar a express�o mod para calcular o m�dulo entre dois valores
select mod(10, 3) as resultado from dual; -- igual quando utilizamos o operador ' % '

--Express�es 
select 2*4/3+3 from dual;
select(((2*4)/3) + 3) from dual;