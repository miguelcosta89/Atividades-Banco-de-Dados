-- Questão 1
create table funcionario(
	codigo serial not null,
	nome varchar(50) not null,
	cpf varchar (11) unique,
	data_nascimento date,
	salario numeric (10,2),
	primary key (codigo)
);

create table fornecedor ( 
	codigo serial not null,
	nome varchar (50),
	primary key (codigo)
);

create table material( 
	codigo serial not null,
	nome varchar (50),
	valor_unitario numeric(10,2),
	primary key (codigo)
);

create table ordem_de_compra ( 
	codigo serial not null,
	data date,
	codigo_fornecedor int,
	codigo_funcionario int,
	primary key (codigo),
	foreign key (codigo_fornecedor) references fornecedor(codigo), 
	foreign key (codigo_funcionario) references funcionario(codigo)
);

create table material_comprado(
	codigo_ordem int,
	codigo_material int,
	quantidade_comprada int,
	primary key (codigo_ordem, codigo_material),
	foreign key (codigo_ordem) references ordem_de_compra(codigo),
	foreign key (codigo_material) references material(codigo)
);
--Questão 2

--FUNCIONARIO
insert into funcionario(nome, cpf, data_nascimento, salario)
values ('ADA', 12345678910, '15/07/1950', 12000.00);
insert into funcionario(nome, cpf, data_nascimento, salario)
values ('Bolt', 01234567891, '19/05/1980', 1000.00);
insert into funcionario(nome, cpf, data_nascimento, salario)
values ('Coach', 19876543210, '05/09/2018', 0.01);
insert into funcionario(nome, cpf, data_nascimento, salario)
values ('Gabigol', 01478523690, '10/08/2019', 800000.00);

--FORNECEDOR
insert into fornecedor (nome)
values ('LEGO');
insert into fornecedor (nome)
values ('PEPSI');
insert into fornecedor (nome)
values ('VIAGRA');
insert into fornecedor (nome)
values ('INTEL');

--MATERIAL
insert into material(nome, valor_unitario)
values ('PEPSI2L', 7.50);
insert into material(nome, valor_unitario)
values ('LEGOBATMAN', 40.00);
insert into material(nome, valor_unitario)
values ('VIAGRA50MG', 21.99);
insert into material(nome, valor_unitario)
values ('DRONEDJITELLO', 650.50);

--ORDEM DE COMPRA
insert into ordem_de_compra ( data, codigo_fornecedor, codigo_funcionario)
values ('18/10/2019', 1, 4);
insert into ordem_de_compra ( data, codigo_fornecedor, codigo_funcionario)
values ('18/10/2019', 2, 3);
insert into ordem_de_compra ( data, codigo_fornecedor, codigo_funcionario)
values ('18/10/2019', 3, 4);
insert into ordem_de_compra ( data, codigo_fornecedor, codigo_funcionario)
values ('18/10/2019', 4, 1);

--MATERIAL COMPRADO
insert into material_comprado(codigo_ordem, codigo_material, quantidade_comprada)
values (1, 2, 50);
insert into material_comprado(codigo_ordem, codigo_material, quantidade_comprada)
values (2, 1, 20);
insert into material_comprado(codigo_ordem, codigo_material, quantidade_comprada)
values (3, 3, 80);
insert into material_comprado(codigo_ordem, codigo_material, quantidade_comprada)
values (4, 4, 2);


--SELECT TUDO
select *
from funcionario;

select *
from fornecedor;

select *
from material;

select *
from ordem_de_compra;

select *
from material_comprado;

--DROP TUDO
drop table material_comprado;
drop table ordem_de_compra;
drop table material;
drop table fornecedor;
drop table funcionario;
