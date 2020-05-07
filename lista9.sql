--QUESTÃO 1
create table pessoa (
	codigo serial not null,
	nome varchar(50) not null, 
	cpf varchar(11) unique, 
	salario numeric(16,2), 
	data_nascimento date,
	primary key(codigo)
);
create table produto( 
	codigo serial not null, 
	nome varchar(50) not null, 
	preco numeric (8,2),
	primary key (codigo)
);
create table compra (
	codigo serial not null, 
	valor_total numeric(30,2), 
	data date, 
	codigo_pessoa int,
	primary key (codigo),
	foreign key (codigo_pessoa) references pessoa(codigo)
);
create table compra_produto (
	codigo_compra int, 
	codigo_produto int, 
	quantidade int,
	primary key(codigo_compra, codigo_produto),
	foreign key (codigo_compra) references compra(codigo),
	foreign key (codigo_produto) references produto(codigo)
);
--QUESTÃO 2
insert into pessoa (nome, cpf, salario, data_nascimento)
values ('Fulano', '77788899911', 7999.99, '04/11/2001');

insert into produto(nome, preco)
values( 'Cerveja', 10.00);

insert into compra (valor_total, data, codigo_pessoa)
values (200.00, '30/10/2019', 1);

insert into compra_produto (codigo_compra, codigo_produto, quantidade)
values (1 ,1 , 20);

--QUESTÃO 3
SELECT *
FROM produto;

--QUESTÃO 4
select *
from pessoa
where (salario>1000.00);

--QUESTÃO 5
select *
from pessoa
where (salario<=8000.00 and data_nascimento> '10/10/2000');

--QUESTÃO 6
update pessoa
set salario = salario * 1.2
where nome = 'Fulano';

--QUESTÃO 7
delete from compra_produto
where codigo_produto = 1;

delete from produto
where nome = 'Cerveja';

--QUESTÃO 8
insert into produto(nome, preco)
values( 'Frango', 15.00);
