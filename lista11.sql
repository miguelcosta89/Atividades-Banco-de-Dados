CREATE TABLE localizacao
( codigo serial NOT NULL,
nome varchar(50) NOT NULL,
primary key (codigo)
);
CREATE TABLE departamento
( codigo serial NOT NULL,
nome varchar(50) NOT NULL,
codigo_localizacao int,
primary key (codigo),
FOREIGN KEY(codigo_localizacao) REFERENCES localizacao(codigo)
);
CREATE TABLE funcionario
( codigo serial NOT NULL,
nome varchar(50) NOT NULL,
salario numeric(10,2),
data_contratacao date,
codigo_departamento int,
primary key (codigo),
FOREIGN KEY(codigo_departamento) REFERENCES departamento(codigo)
);
CREATE TABLE projeto
( codigo serial NOT NULL,
nome varchar(50) NOT NULL,
codigo_departamento int,
primary key (codigo),
FOREIGN KEY(codigo_departamento) REFERENCES departamento(codigo)
);
CREATE TABLE funcionario_projeto
( codigo_funcionario int NOT NULL,
 codigo_projeto int NOT NULL,
primary key (codigo_funcionario, codigo_projeto),
FOREIGN KEY(codigo_funcionario) REFERENCES funcionario(codigo),
FOREIGN KEY(codigo_projeto) REFERENCES projeto(codigo)
);
insert into localizacao(nome) values ('Campo Grande');
insert into localizacao(nome) values ('Dourados');
insert into localizacao(nome) values ('Três Lagoas');
insert into localizacao(nome) values ('Corumbá');
insert into localizacao(nome) values ('Ponta Porã');
insert into departamento(nome,codigo_localizacao) values ('Tecnologia da Informação', 1);
insert into departamento(nome,codigo_localizacao) values ('Financeiro', 1);
insert into departamento(nome,codigo_localizacao) values ('Logística', 2);
insert into departamento(nome,codigo_localizacao) values ('Importação', 5);
insert into departamento(nome,codigo_localizacao) values ('Recursos Humanos', 1);
insert into departamento(nome,codigo_localizacao) values ('Vestuário', 4);
insert into departamento(nome,codigo_localizacao) values ('Estoque', 3);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Tomas', 5000.00, '12/09/2000', 1);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Jaqueline', 2000.00, '25/10/2010', 2);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Jorge', 3000.00, '07/04/2012', 3);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Vagner', 3500.00, '14/03/2015', 4);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Lainez', 9000.00, '30/11/2016', 5);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Anderson', 10000.00, '05/08/2002', 1);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Odair', 1000.00, '24/12/2012', 6);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Felipe', 15000.00, '12/09/1998', 1);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Joaquina', 2000.00, '15/08/2017', 1);
insert into funcionario(nome, salario, data_contratacao, codigo_departamento)
values ('Josefina', 2000.00, '15/08/2017', null);
insert into projeto(nome, codigo_departamento) values ('Desenvolvimento Scrum', 1);
insert into projeto(nome, codigo_departamento) values ('Economia Industrial', 2);
insert into projeto(nome, codigo_departamento) values ('Estudo de Grafos em Rodovias', 3);
insert into projeto(nome, codigo_departamento) values ('Relações Internacionais', 4);
insert into projeto(nome, codigo_departamento) values ('Gerência de Recursos', 5);
insert into projeto(nome, codigo_departamento) values ('Tendência em Produtos', 6);
insert into projeto(nome, codigo_departamento) values ('Armazenamento de Produtos Perecíveis',
7);
insert into funcionario_projeto(codigo_funcionario, codigo_projeto) values (1, 1);
insert into funcionario_projeto(codigo_funcionario, codigo_projeto) values (2 , 2);
insert into funcionario_projeto(codigo_funcionario, codigo_projeto) values (3 , 3);
insert into funcionario_projeto(codigo_funcionario, codigo_projeto) values (4 , 4);
insert into funcionario_projeto(codigo_funcionario, codigo_projeto) values (5 , 5);
insert into funcionario_projeto(codigo_funcionario, codigo_projeto) values (6 , 6);
insert into funcionario_projeto(codigo_funcionario, codigo_projeto) values (7, 7);
insert into funcionario_projeto(codigo_funcionario, codigo_projeto) values (8, 2);

--QUESTÃO1

select fun.nome, dep.nome
from departamento dep inner join funcionario fun on dep.codigo = fun.codigo_departamento;

--QUESTÃO2

select dep.nome, proj.nome
from departamento dep inner join projeto proj on dep.codigo = proj.codigo_departamento
order by dep.nome;

--QUESTÃO3

select fun.nome, dep.nome, loc.nome,
from departamento dep inner join funcionario fun on dep.codigo = fun.codigo_departamento 
inner join localizacao loc on loc.codigo = dep.codigo_localizacao 
and loc.nome like 'Campo Grande'
order by fun.nome;

--QUESTÃO4

select fun.nome, proj.nome, dep.nome
from funcionario fun inner join funcionario_projeto fun_proj on fun.codigo = fun_proj.codigo_funcionario 
inner join projeto proj on proj.codigo = fun_proj.codigo_projeto 
inner join departamento dep on  dep.codigo = proj.codigo_departamento
and fun.salario < 5500.00
and fun.data_contratacao > '31/12/2012';

--QUESTÃO5

select fun.nome
from funcionario fun
where fun.nome LIKE 'T%' and  fun.nome LIKE '_____%';

--QUESTÃO6

select min (fun.salario) as MenorSalario
from funcionario fun;

--QUESTÃO7

select count (*) as NumeroDeProjetos
from projeto proj;

--QUESTÃO8

select sum(fun.salario)
from departamento dep join funcionario fun on dep.codigo = fun.codigo_departamento
where  dep.nome like 'Financeiro' ;

--QUESTÃO9

select fun.*
from funcionario fun
where fun.salario not between 1000 and 2000;

--QUESTÃO10

select distinct fun.salario
from funcionario fun;