--Criando Teste
--Criar no banco aluno
create table cadastro (
nome varchar2(50) not null,
docto varchar2(20) not null
);

--Insere registros
insert into cadastro values ('Andre','1231244');
insert into cadastro values ('João', '123456');
insert into cadastro values ('Pedro', '12341246');

--Verificando registros
select * from cadastro;

--Retorna a tabela para o estado anterior do begin transaction
--Rollback
rollback;
--Efetiva as informações nas tabelas do banco de dados
commit;

-- Delete from cadastro
-- Select * from cadastro