-- Criando tablespace
create tablespace curso
    datafile
        'C:\oraclexe\app\oracle\oradata\XE\curso.dbf'
            size 100m autoextend on next 50m maxsize 500m
        online
        permanent
        extent management local autoallocate
        segment space management auto;

-- Criando Usu�rio
create user aluno
    identified by aluno -- senha do usu�rio
    default tablespace curso
    temporary tablespace TEMP;

--Permiss�o para o usu�rio
grant create session, connect, resource to aluno;

-- Remo��o de limite no tablespace criado anteriormente
alter user aluno quota unlimited on curso;

-- Deletar Usu�rio
drop user aluno;

--Deletar TableSpace
drop tablespace curso
    including contents and datafiles
        cascade constraints