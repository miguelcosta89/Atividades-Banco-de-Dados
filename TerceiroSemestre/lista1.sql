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
data_nascimento date,
data_cadastro timestamp,
ativo boolean,
codigo_departamento int,
primary key (codigo),
FOREIGN KEY(codigo_departamento) REFERENCES departamento(codigo)
);

CREATE TABLE projeto
( codigo serial NOT NULL,
nome varchar(50) NOT NULL,
data_inicio date,
data_fim date,
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

insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Tomas', 5000.00, '12/09/2000','01/02/1970', '12/09/2000 07:00:00','1', 1);
insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Jaqueline', 2000.00, '25/10/2010', '10/06/1988', '25/10/2010 08:00:00','1', 2);
insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Jorge', 3000.00, '07/04/2012', '01/03/1999', '12/04/2012 18:00:00','1', 3);
insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Vagner', 3500.00, '14/03/2015','05/02/1992', '14/03/2016 10:55:00','1', 4);
insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Lainez', 9000.00, '30/11/2016','12/02/2000', '01/12/2016 17:00:00','1', 5);
insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Anderson', 10000.00, '05/08/2002', '30/06/1995', '05/08/2002 07:54:00','1',1);
insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Odair', 1000.00, '24/12/2012', '23/05/1989', '14/03/2012 07:00:00','1',6);
insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Felipe', 15000.00, '12/09/1998', '01/03/1985', '12/09/1998 08:00:00','1',1);
insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Joaquina', 2000.00, '15/08/2017', '01/02/1998', '12/09/2017 07:00:00','1', 1);
insert into funcionario( nome, salario, data_contratacao, data_nascimento, data_cadastro, ativo,
codigo_departamento)
values ('Josefina', 2000.00, '12/08/2017', '13/05/1994', '12/08/2017 07:00:00','1', null);

insert into projeto(nome, data_inicio, data_fim, codigo_departamento) values ('Desenvolvimento
Scrum',current_date, current_date + 1000, 1);
insert into projeto(nome, data_inicio, data_fim, codigo_departamento) values ('Economia Industrial',
current_date-1500, current_date + 100, 2);
insert into projeto(nome, data_inicio, data_fim, codigo_departamento) values ('Estudo de Grafos em
Rodovias',current_date-100, current_date, 3);
insert into projeto(nome, data_inicio, data_fim, codigo_departamento) values ('Relações
Internacionais', current_date - 4000, current_date - 1000, 4);
insert into projeto(nome, data_inicio, data_fim, codigo_departamento) values ('Gerência de
Recursos',current_date, current_date + 100, 5);
insert into projeto(nome, data_inicio, data_fim, codigo_departamento) values ('Tendência em
Produtos',current_date, current_date + 365, 6);
insert into projeto(nome, data_inicio, data_fim, codigo_departamento) values ('Armazenamento de
Produtos Perecíveis',current_date - 400, current_date + 10, 7);

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
from funcionario fun
join departamento dep on dep.codigo = fun.codigo_departamento;

--QUESTÃO2
select fun.nome, coalesce (dep.nome, 'Sem Departamento') as Departamento
from funcionario fun
left join departamento dep on dep.codigo = fun.codigo_departamento
;

--QUESTÃO3
select coalesce(fun.nome,'Sem Funcionario') as funcionario, coalesce (dep.nome, 'Sem Departamento') as Departamento
from funcionario fun
full outer join departamento dep on dep.codigo = fun.codigo_departamento
;

--QUESTÃO4
select dep.nome as Departamento, proj.nome as Projeto
from projeto proj
join departamento dep on dep.codigo = proj.codigo_departamento
order by dep.nome
limit 3 offset 2
;

--QUESTÃO5
select fun.nome as Funcionario, proj.nome as Projeto, dep.nome as Departamento
from funcionario fun
join funcionario_projeto fun_proj on fun.codigo = fun_proj.codigo_funcionario
join projeto proj on proj.codigo = fun_proj.codigo_projeto
join departamento dep on dep.codigo = fun.codigo_departamento
where fun.salario <5500
;

--QUESTÃO6
select dep.nome as Departamento, avg (fun.salario) as MediaSalarial
from funcionario fun
join departamento dep on dep.codigo = fun.codigo_departamento
group by dep.nome;

--QUESTÃO7
select dep.nome as Departamento, count (fun.nome) as QuantidadeFuncionario
from funcionario fun
join departamento dep on dep.codigo = fun.codigo_departamento
group by dep.nome
having count (fun.nome)>1;

--QUESTÃO8
select proj.nome as Projeto, count (fun.nome) as QuantidadeDeFuncionario
from funcionario fun
join funcionario_projeto fun_proj on fun.codigo = fun_proj.codigo_funcionario
join projeto proj on proj.codigo = fun_proj.codigo_projeto
group by proj.nome
order by proj.nome;

--QUESTÃO9
select dep.nome as Departamento, count(proj.nome) as NumeroDeProjetos
from projeto proj
join departamento dep on dep.codigo = proj.codigo_departamento
group by dep.nome
having count (proj.nome)>1;

--QUESTÃO10
select fun.nome
from funcionario fun
where fun.nome like '%a%' and fun.nome like '____%';



select *
from funcionario;