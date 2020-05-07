--Questão 1
create table colaborador(
	codigo serial not null, 
	nome varchar (50), 
	data_contratacao date, 
	cargo varchar (50), 
	salario numeric(10,2),
	primary key (codigo)
);

--Questão 2
insert into colaborador(nome, data_contratacao, cargo, salario)
values ('Capitão Cabecinha', '2018-03-24', 'Operador espaço nave', 20000.00);

insert into colaborador(nome, data_contratacao, cargo, salario)
values ('Naruto', '1997-08-13', 'Hokage', 5000.00);

insert into colaborador(nome, data_contratacao, cargo, salario)
values ('Seu Zé', '2000-05-18', 'Auxiliar de limpeza', 1200.20);

insert into colaborador(nome, data_contratacao, cargo, salario)
values ('Geral', '1986-05-13', 'Gerente', 1500.50);

--Questão 3
select *
from colaborador;

--Questão 4
select *
from colaborador cola
where cola.salario < 1900.00;

--Questão 5
select cola.nome, cola.cargo
from colaborador cola;

--Questão 6
select cola.nome
from colaborador cola
where cola.cargo = 'Gerente';

--Questão 7
update colaborador
set salario = salario + salario * 0.07;

--Questão 8
update colaborador 
set salario = salario - salario * 0.01
where cargo = 'Gerente';

--Questão 9
delete from colaborador
where salario > 10000;

--Questão 10
insert into colaborador(nome, data_contratacao, cargo, salario)
values ('Ciclano da Silva', '2019-09-27', 'Gerente', 9999.88);

--Questão 11
alter table colaborador 
add data_nascimento date;

--Questão 12
drop table colaborador;

