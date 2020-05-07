--TABELAS
CREATE TABLE profissao
( codigo serial NOT NULL,
nome varchar(50) NOT NULL,
primary key (codigo)
);

CREATE TABLE pessoa
( codigo serial NOT NULL,
nome varchar(50) NOT NULL,
cpf varchar(11) UNIQUE NOT NULL,
salario numeric(10,2),
data_nascimento date,
codigo_profissao int,
primary key (codigo),
FOREIGN KEY(codigo_profissao) REFERENCES profissao(codigo)
);

CREATE TABLE compra
( codigo serial NOT NULL,
valor_total numeric(10,2),
data timestamp,
codigo_pessoa int,
primary key (codigo),
FOREIGN KEY(codigo_pessoa) REFERENCES pessoa(codigo)
);

CREATE TABLE produto
( codigo serial NOT NULL,
nome varchar(50) NOT NULL,
preco numeric(10,2),
primary key (codigo)
);

CREATE TABLE compra_produto
( codigo_compra int,
 codigo_produto int,
 quantidade int,
primary key (codigo_compra, codigo_produto),
FOREIGN KEY(codigo_compra) REFERENCES compra(codigo),
FOREIGN KEY(codigo_produto) REFERENCES produto(codigo)
);

--INSERÇÕES
insert into profissao (nome) values ('Tecnologia da Informação');
insert into profissao (nome) values ('Pedreiro');
insert into profissao (nome) values ('DBA');
insert into profissao (nome) values ('Professor');

insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('Tomas','11133344422', 5500.00, '12/09/1990', 1);
insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('Jaqueline', '22233344411', 70000.00, '25/10/1985', 3);
insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('Pedro', '99233344411', 3000.00, '25/10/1960', 3);
insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('João Silva','44133344422', 7000.00, '12/09/1977', 1);
insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('Fulano','14133344422', 1500.00, '12/09/1988', 4);

insert into produto( nome, preco)
values('Refrigerante', 7.70);
insert into produto ( nome, preco)
values('Cerveja', 10.0);
insert into produto ( nome, preco)
values('Picanha', 75 );
insert into produto ( nome, preco)
values('Frango', 20);
insert into produto ( nome, preco)
values('Molho de tomate', 4);
insert into produto ( nome, preco)
values('Chocolate', 100);

insert into compra (valor_total, data, codigo_pessoa)
values(175, current_timestamp(0), 1 );

insert into compra_produto( codigo_compra, codigo_produto,quantidade)
values(1,6, 1);
insert into compra_produto( codigo_compra, codigo_produto, quantidade)
values(1,3, 1);

insert into compra (valor_total, data, codigo_pessoa)
values(400, current_timestamp(0), 1 );

insert into compra_produto( codigo_compra, codigo_produto, quantidade)
values(2,6, 4); 

--QUESTÃO 1
select pes.nome, pes.cpf, com.valor_total
from pessoa pes, compra com
where pes.codigo = com.codigo_pessoa;

--QUESTÃO 2
select pes.nome, pes.salario, pro.nome
from pessoa pes, profissao pro
where pro.codigo = pes.codigo_profissao and pes.salario > 1000;

--QUESTÃO 3
select com.valor_total, com.data, pro.nome, com_pro.quantidade
from produto pro, compra com, compra_produto com_pro
where com.codigo = com_pro.codigo_compra and pro.codigo = com_pro.codigo_produto;

--QUESTÃO 4
select pes.nome, pes.cpf, prof.nome, com.data, com.valor_total, pro.nome, com_pro.quantidade
from produto pro, compra com, compra_produto com_pro, pessoa pes, profissao prof 
where com.codigo = com_pro.codigo_compra 
and pro.codigo = com_pro.codigo_produto 
and prof.codigo = pes.codigo_profissao
and pes.codigo = com.codigo_pessoa;

--QUESTÃO 5
select pes.nome, prof.nome, com.valor_total, com.data
from compra com, pessoa pes, profissao prof 
where prof.codigo = pes.codigo_profissao
and pes.codigo = com.codigo_pessoa 
and pes.data_nascimento > '09/11/2001'
and com.valor_total > pes.salario;

--QUESTÃO 6
select  pes.nome, pes.cpf, pes.salario, pes.data_nascimento, prof.nome
from pessoa pes, profissao prof 
where prof.codigo = pes.codigo_profissao 
and pes.salario > 1000 and pes.salario < 2000
and prof.nome = 'Professor';

--SELECTS
select *
from pessoa;

select *
from compra;

select *
from produto;

select *
from profissao;

select *
from compra_produto;