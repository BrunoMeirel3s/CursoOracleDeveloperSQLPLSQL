-- Inicia transação

--Insere registros
insert into cadastro values ('André', '12345645');
savepoint p1;
insert into cadastro values ('João', '123456789');
savepoint p2;
insert into cadastro values ('Pedro', '123456789');
savepoint p3;

--Analisando dados
select * from cadastro;

-- Retorna a tabela para o estado anterior do begin transaction
rollback to savepoint p2;

commit;
