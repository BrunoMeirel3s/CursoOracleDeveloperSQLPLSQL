--Drop tabelas
drop table matricula;
drop table disciplina;
drop table alunos;

--Criando tabela alunos
create table alunos (
id_aluno int not null,
nome varchar2(20) not null,
primary key(id_aluno)
);

--Criando tabela disciplina
create table disciplina(
id_disciplina int not null,
nome_disc varchar2(20),
primary key(id_disciplina)
);

--Criando a tabela matrícula
create table matricula(
id_aluno int not null,
id_disciplina int not null,
periodo varchar2(20),
primary key(id_aluno, id_disciplina),
foreign key (id_aluno) references alunos(id_aluno),
foreign key(id_disciplina) references disciplina(id_disciplina)
);

--Inserindo registros
insert into alunos(id_aluno, nome) values (1, 'João');
insert into alunos(id_aluno, nome) values (2, 'Maria');
insert into alunos(id_aluno, nome) values (3, 'Pedro');
insert into alunos(id_aluno, nome) values (4, 'Tiago');
insert into alunos(id_aluno, nome) values (5, 'Henrique');

--Evidencia do insert
select * from alunos;

--Inserindo registros na tabela disciplinas
insert into disciplina(id_disciplina, nome_disc) values (1, 'Fisíca');
insert into disciplina(id_disciplina, nome_disc) values (2, 'Química');
insert into disciplina(id_disciplina, nome_disc) values (3, 'Matemática');
insert into disciplina(id_disciplina, nome_disc) values (4, 'Banco de Dados');
insert into disciplina(id_disciplina, nome_disc) values (5, 'Programação');

-- Evidência Insert
select * from disciplina;

--Inserindo matrículas de alunos
insert into matricula values ('1','1', 'Noturno');
insert into matricula values ('1','2', 'Vespertino');
insert into matricula values ('1','3', 'Matutino');

insert into matricula values ('2','3', 'Noturno');
insert into matricula values ('2','4', 'Noturno');

insert into matricula values ('3','1', 'Noturno');
insert into matricula values ('3','3', 'Noturno');
insert into matricula values ('3','4', 'Noturno');

insert into matricula values ('5','1', 'Matutino');
insert into matricula values ('5','2', 'Vespertino');
insert into matricula values ('5','4', 'Noturno');

--Evidência
select * from matricula;

-- Aluno código 4 não tem matrícula
-- Disiciplina 5 não tem alunos

-- Inner Join
select a.nome, c.nome_disc, b.periodo from alunos a inner join matricula b on a.id_aluno = b.id_aluno inner join disciplina c
on b.id_disciplina = c.id_disciplina;

-- Left Join
select a.nome, c.nome_disc, b.periodo from alunos a left join matricula b on a.id_aluno = b.id_aluno left join disciplina c
on b.id_disciplina = c.id_disciplina;

--Right Join
select a.nome, c.nome_disc, b.periodo from alunos a right join matricula b on a.id_aluno = b.id_aluno right join disciplina c
on b.id_disciplina = c.id_disciplina;

--Full Join
select a.nome, c.nome_disc, b.periodo from alunos a full join matricula b on a.id_aluno = b.id_aluno full join disciplina c
on b.id_disciplina = c.id_disciplina;

-- Mais Exemplos Inner Join
select * from hr.employees;

select a.employee_id, a.first_name, b.department_name, c.job_title from hr.employees a inner join hr.departments b on a.department_id = b.department_id
inner join hr.jobs c  on a.job_id= c.job_id order by 1;

--Mais Exemplos Left Join
select a.employee_id, a.first_name, b.department_name, c.job_title from hr.employees a left join hr.departments b on a.department_id = b.department_id
left join hr.jobs c  on a.job_id= c.job_id order by 1;

--Mais Exemplos Right Join
select a.employee_id, a.first_name, b.department_name, c.job_title from hr.employees a right join hr.departments b on a.department_id = b.department_id
right join hr.jobs c  on a.job_id= c.job_id order by 1;