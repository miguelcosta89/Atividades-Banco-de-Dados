--QUESTÃO 1
create table materia (
	codigo serial not null, 
	nome varchar(50) not null,
	primary key (codigo)
);
create table estudante (
	codigo serial not null, 
	nome varchar(50) not null, 
	cpf varchar(11) unique not null , 
	renda numeric(12,2) , 
	data_nascimento date,
	primary key (codigo)
);
create table avaliacao (
	codigo serial not null, 
	titulo varchar(30), 
	data date, 
	codigo_materia int,
	primary key (codigo),
	foreign key (codigo_materia) references materia(codigo)	
);
create table estudante_avaliacao (
	codigo_estudante int, 
	codigo_avaliacao int, 
	nota numeric (4,2),
	primary key (codigo_estudante, codigo_avaliacao),
	foreign key (codigo_estudante) references estudante(codigo),
	foreign key (codigo_avaliacao) references avaliacao(codigo)
);

--QUESTÃO 2
 insert into materia (nome)
 values ('Banco de Dados');
 
insert into estudante (nome, cpf, renda, data_nascimento)
values ('Fulano Pereira', '77788899911',  799.99, '04/11/1980' );

insert into avaliacao (titulo, data, codigo_materia)
values ('Avaliação Bimestral', '13/09/2018', 1);

insert into estudante_avaliacao (codigo_estudante, codigo_avaliacao, nota)
values (1, 1, 8.75);

--QUESTÃO 3
select *
from estudante
where nome = 'Fulano Pereira';

--QUESTÃO 4
update estudante_avaliacao
set nota = nota * 0.97;

--QUESTÃO 5
select nome, renda
from estudante
where renda < 1500 and data_nascimento > '21/12/1977';

--QUESTÃO 6
update estudante
set renda = renda * 1.19
where nome = 'Fulano Pereira';

--QUESTÃO 7
insert into materia (nome)
values ('APOO');
 
--QUESTÃO 8
insert into avaliacao (titulo, data, codigo_materia)
values ('Avaliação Semestral de APOO ', '08/11/2019', 2);

--QUESTÃO 9
delete from estudante_avaliacao
where codigo_estudante = 1;

delete from estudante
where nome = 'Fulano Pereira';

--SELECTS
select *
from materia;

select *
from estudante;

select *
from avaliacao;

select *
from estudante_avaliacao;