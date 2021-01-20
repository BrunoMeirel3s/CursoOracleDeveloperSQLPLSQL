-- Utilizar este script no banco ORA XE
--Parte 1 Concede-grant
--Cria um login "Aluno" e dar permissões no banco e objetos
select user from dual;
--Concede acesso de atualização para aluno;
grant update on aluno.funcionarios to aluno;

--Concedendo Acesso de atualização para aluno com with admin option
-- usuário aluno pode extender seus previlégios de sistema para outros usuários
grant create session, create table, create view to aluno with admin option;

--Concedendo Acesso de update, select para aluno na tabela senso;
grant select, update on aluno.senso to aluno;

--Concedendo Acesso de insert, delete para aluno em todos objetos
grant insert, delete on aluno.senso to aluno;

--Concedendo Acesso de create procedure e create view para aluno
grant create procedure, create view to aluno;

--Dica para gerar grants para muitos objetos
select 'Grant all on' ||object_name ||  'to aluno;' as retorno from user_objects where OBJECT_TYPE='TABLE';

select 'Grant update on' ||object_name ||  'to aluno;' as retorno from user_objects where OBJECT_TYPE='TABLE';

--Exemplo
grant update on HELP to aluno;

--Concedendo acesso de delete para aluno
grant delete on aluno.funcionarios to aluno;

--Concedendo acesso de delete para aluno em todos objetos
grant delete on aluno.senso to aluno;

--Concedendo Acesso de insert para aluno;
grant insert on aluno.funcionarios to aluno;

--Concedendo Acesso de select e insert para aluno
grant select, insert on aluno.funcionarios to aluno;

--Concedendo select com limitação de campos
grant insert (nome, setor) on aluno.funcionarios to aluno;
grant update (nome, setor) on aluno.funcionarios to aluno;

--Concedendo acesso para executar proc proc_quadrado para aluno
grant execute on aluno.proc_quadraro to aluno;

--Concedendo todos acessos a todos objetos
grant all on aluno.funcionarios to aluno;

--Verificando privilégios
--Verificar pelo system
select * from DBA_SYS_PRIVS where grantee like 'aluno';

select * from DBA_ROLE_PRIVS where grantee like 'aluno';

select * from USER_TAB_PRIVS;



