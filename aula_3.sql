-- SQL

-- DDL
-- Linguagem de Definição de Dados

create database sextou_db;
create schema aula;

-- comercios e produtos

create table aula.comercios(
	id serial,
	nome varchar(50) not null,
	cnpj varchar(14),
	endereco varchar(30),
	primary key (id)
);


create table aula.produtos (
	id serial,
	nome varchar(40),
	preco decimal,
	unidades integer, -- qtd_unidades
	id_comercio integer,
	primary key (id),
	foreign key (id_comercio) references aula.comercios (id)
);



alter table aula.produtos
rename unidades to qtd_unidades;

-- Mudar tipo de coluna - próxima aula!!!!!!!!!!!!
alter table aula.produtos
add categoria varchar(20);

alter table aula.produtos
drop column categoria;

drop table aula.produtos;

-- ---------------------------------------------------------------
-- DML
-- Linguagem de Manipulação de Dados

insert into aula.comercios (nome, cnpj, endereco)
values ('Novo','14231520001-98','Vila Embratel');

insert into aula.comercios (nome, cnpj, endereco)
values 
('Bar da Claudete','23453-98','Vila Maranhão'),
('Bar da Terezona','4324-98','Vila Nova'),
('Stress Zero','12312-98','Sol Nascente'),
('Bar da Firma','1231-98','Vila Boa'),
('Bambu Bar','3123-98','Sá Viana'),
('Bar da Mãe','32423-98','Mirasol');

insert into aula.produtos (nome, preco, unidades, id_comercio)
values 
('baré',5.5,5,1),
('River',5.7,7,1),
('jesus',6,10,2),
('Cajuina',6,8,2),
('grapette',5.7,3,3),
('Pichula',4,2,4);

update aula.comercios
set nome = 'Mar a Vista'
where id = 4;

update aula.comercios
set cnpj = '111111'
where id = 7
and endereco='Sol Nascente';


update aula.comercios 
set cnpj = '222222', 
	endereco = 'Vila Embratel' 
where id = 1;


update aula.comercios 
set cnpj = '333333333'
where endereco = 'Mirasol'
or id = 6;

select * from aula.comercios 

delete from aula.comercios
where id=8;


alter table aula.produtos
change column preco preeeeecooo decimal(5,2);


-- DQL
-- Linguagem  de Consulta de Dados

select * from aula.comercios;
select * from aula.produtos;


select nome, preco from aula.produtos;


select nome, preco from aula.produtos limit 2;

select nome, preco from aula.produtos 
order by preco asc
limit 2; 

select * from aula.produtos
where id_comercio=2;

select * from aula.produtos
where id_comercio in (1,3,4);


select * from aula.produtos
where id_comercio not in (1,3,4);


select * from aula.produtos
where id_comercio>2;

select * from aula.produtos
where id_comercio>=2;

select * from aula.produtos
where id_comercio<=2;

select * from aula.produtos
where id_comercio <> 2;

select * from aula.produtos
where nome like 'ba%';

select * from aula.produtos
where nome like '%a';

select * from aula.produtos
where nome like '%u%';


-- Alias
-- import pandas as pd
-- pandas.read_csv()
-- pd.read_csv()

select id as numerooooo from aula.produtos as ap;

select 
	nome as descrição, 
	preco as valor
from aula.produtos as ap;


select *
from aula.produtos as ap;


select *
from aula.comercios as ac;


select  
	ap.nome as nome_produto, 
	ap.preco as valor, 
	ac.nome as nome_comercio
from aula.produtos as ap, aula.comercios as ac
where ap.id_comercio=1
and ac.id = 1;







