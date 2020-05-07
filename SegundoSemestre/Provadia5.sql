--TABELAS
create table tipo (
	codigo serial not null,
	nome varchar(50) not null,
	idade_minima int,
	primary key (codigo)
);
create table jogador (
	codigo serial not null, 
	nome varchar(50) not null, 
	cpf varchar(11) not null unique, 
	salario numeric(15,2), 
	data_cadastro date,
	primary key (codigo)
);
create table jogo (
	codigo serial not null, 
	nome varchar(50) not null, 
	data_lancamento date, 
	preco numeric(15,2), 
	codigo_tipo int,
	primary key(codigo),
	foreign key(codigo_tipo) references tipo(codigo)
);
create table jogador_jogo ( 
	codigo_jogador int, 
	codigo_jogo int, 
	nivel varchar(50) not null,
	primary key(codigo_jogador, codigo_jogo),
	foreign key(codigo_jogador) references jogador(codigo),
	foreign key(codigo_jogo) references jogo(codigo)
);

--iNSERÇÕES
insert into tipo (nome, idade_minima) 
values ('Clássico', 5);
insert into jogador (nome, cpf, salario, data_cadastro) 
values ('Beltrano Silva', '55588899911', 3799.99, '07/11/2019');
insert into jogo (nome, data_lancamento, preco, codigo_tipo) 
values ('Tetris', '02/01/1995', 20.44, 5);
insert into jogador_jogo (codigo_jogador, codigo_jogo, nivel) 
values (6, 6, 'Jogador Profissional');


--INSERT TIPO
insert into tipo (nome, idade_minima)
values('Corrida', 10);
insert into tipo (nome, idade_minima)
values('Terror', 18);
insert into tipo (nome, idade_minima)
values('Guerra', 15);
insert into tipo (nome, idade_minima)
values('Futebol', 8);
insert into tipo (nome, idade_minima)
values('Ação', 12);
insert into tipo (nome, idade_minima)
values('Aventura', 13);

--INSERT JOGADOR
insert into jogador (nome, cpf, salario, data_cadastro)
values('Miguel', '10149605412', 10000.00, '30/11/2019');
insert into jogador (nome, cpf, salario, data_cadastro)
values('Wangley', '20256923522', 8000.00, '30/11/2019');
insert into jogador (nome, cpf, salario, data_cadastro)
values('Mateus', '58236954211', 5000.00, '30/11/2019');
insert into jogador (nome, cpf, salario, data_cadastro)
values('Salomão', '68423845655', 11000.00, '30/11/2019');
insert into jogador (nome, cpf, salario, data_cadastro)
values('Thales', '85648424544', 14000.00, '30/11/2019');

--INSERT JOGO
insert into jogo (nome, data_lancamento, preco, codigo_tipo)
values('Midnight Club 3: DUB Edition', '11/04/2005', 99.99, 1);
insert into jogo (nome, data_lancamento, preco, codigo_tipo)
values('Call of Duty: Modern Warfare 3', '08/11/2011', 59.99, 3);
insert into jogo (nome, data_lancamento, preco, codigo_tipo)
values('Resident Evil 7: Biohazard', '24/01/2017', 178.84, 2);
insert into jogo (nome, data_lancamento, preco, codigo_tipo)
values('FIFA 20', '24/09/2019', 249.89, 4);
insert into jogo (nome, data_lancamento, preco, codigo_tipo)
values('Battlefield 4', '29/10/2013', 57.99, 3);

--INSERT JOGADOR_JOGO
insert into jogador_jogo ( codigo_jogador, codigo_jogo, nivel)
values(1, 2, 'Profissional');
insert into jogador_jogo ( codigo_jogador, codigo_jogo, nivel)
values(2, 4, 'Semi-Profissional');
insert into jogador_jogo ( codigo_jogador, codigo_jogo, nivel)
values(3, 1, 'Profissional');
insert into jogador_jogo ( codigo_jogador, codigo_jogo, nivel)
values(4, 3, 'Amador');
insert into jogador_jogo ( codigo_jogador, codigo_jogo, nivel)
values(5, 5, 'Semi-Profissional');


--QUESTÃO1
select joga.nome, joga.salario, jg.nome, joga_jogo.nivel, tp.nome
from jogador joga join jogador_jogo joga_jogo on joga.codigo = joga_jogo.codigo_jogador 
join jogo jg on jg.codigo=joga_jogo.codigo_jogador
join tipo tp on tp.codigo = jg.codigo_tipo
where joga.nome like '%t%' or
joga.nome like '%T%' and
joga.salario between 1000.00 and 4000.00;

--QUESTÃO2
select count (*) as QuantidadeTetris
from jogador joga join jogador_jogo joga_jogo on joga.codigo = joga_jogo.codigo_jogador 
join jogo jg on jg.codigo=joga_jogo.codigo_jogador
where jg.nome like 'Tetris';

--QUESTÃO3
select jg.nome
from  tipo tp join jogo jg on tp.codigo = jg.codigo_tipo
where jg.nome like '_____s' 
and tp.nome like 'Clássico';

--QUESTÃO4
select avg (idade_minima) as MédiaIdadeMinima
from tipo;

--QUESTÃO5
select sum (idade_minima) as SomaIdadeMinima
from tipo
where nome like 'Clássico' or nome like 'Ação' or nome like 'Aventura';

--QUESTÃO6
select joga.nome, joga.cpf, joga.data_cadastro, joga.salario
from jogador joga join jogador_jogo joga_jogo on joga.codigo = joga_jogo.codigo_jogador 
join jogo jg on jg.codigo=joga_jogo.codigo_jogador
where jg.nome like 'Tetris' and joga.data_cadastro > '31/12/2018' and joga.salario < 4000.00
order by joga.data_cadastro;

--SELECT DE TUDO
select *
from tipo;
select *
from jogador;
select *
from jogo;
select *
from jogador_jogo;