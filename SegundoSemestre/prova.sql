--QUESTÃO 1
create table tipo(
	codigo serial not null,
	nome varchar(50) not null,
	idade_minima int,
	primary key (codigo)
);

create table jogador(
	codigo serial not null,
	nome varchar(50) not null,
	cpf varchar(11) unique not null,
	salario numeric(10,2),
	data_cadastro date,
	primary key (codigo)
);

create table jogo (
	codigo serial not null,
	nome varchar(50) not null,
	data_lancamento date,
	preco numeric(10,2),
	codigo_tipo int,
	primary key (codigo),
	foreign key (codigo_tipo) references tipo(codigo)
);

create table jogador_jogo(
	codigo_jogador int,
	codigo_jogo int,
	nivel varchar(50) not null,
	primary key (codigo_jogo, codigo_jogador),
	foreign key (codigo_jogo) references jogo(codigo),
	foreign key (codigo_jogador) references jogador(codigo)
);

--QUESTÃO 2
insert into tipo (nome, idade_minima) 
values ('Clássico', 5);

insert into jogador (nome, cpf, salario, data_cadastro) 
values ('Beltrano Silva', '55588899911', 3799.99, '07/11/2019');

insert into jogo (nome, data_lancamento, preco, codigo_tipo) 
values ('Tetris', '02/01/1995', 20.44, 1);

insert into jogador_jogo (codigo_jogador, codigo_jogo, nivel) 
values (1, 1, 'Jogador Profissional');

--QUESTÃO 3
select *
from jogador
where data_cadastro = '07/11/2019';

--QUESTÃO 4
update jogo
set preco = preco * 0.59
where nome = 'Tetris';

--QUESTÃO 5
select nome, salario, cpf
from jogador
where salario > 6000.00 or cpf = '55588899911';

--QUESTÃO 6
update jogador
set salario = salario * 1.01;

--QUESTÃO 7
insert into tipo (nome, idade_minima) 
values ('Ação', 12);

--QUESTÃO 8
insert into jogo (nome, data_lancamento, preco, codigo_tipo) 
values ('Corrida', '07/11/2019', 400.00, 2);

--QUESTÃO 9
delete from jogador_jogo
where codigo_jogador = 1;

delete from jogador
where nome = 'Beltrano Silva';
