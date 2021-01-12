-- Criando tablespace
create tablespace curso
    datafile
        'C:\oraclexe\app\oracle\oradata\XE\curso.dbf'
            size 100m autoextend on next 50m maxsize 500m
        online
        permanent
        extent management local autoallocate
        segment space management auto;