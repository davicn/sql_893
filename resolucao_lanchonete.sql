-- Constraints
-- Restrinções

create table lanchonete.tipo_produto(
	id serial,
	descricao varchar(20) not null,
	primary key (id)
);

select * from lanchonete.tipo_produto;

insert into lanchonete.tipo_produto (descricao) 
values 
('bebida'),
('massa'),
('sanduiche');


-- insert into lanchonete.tipo_produto (descricao) 
-- values (null); 

create table lanchonete.cliente (
	id serial,
	nome varchar(50) not null,
	telefone varchar(15),
	primary key (id)
);

insert into lanchonete.cliente (nome, telefone)
values 
('José', '9911-1111'),
('Pedro', '9922-2222'),
('Maria', '9933-3333'),
('João', '9944-4444'),
('Joana', '9955-5555'),
('Luis', '9966-6666');

select * from lanchonete.cliente;


create table lanchonete.produto (
	id serial,
	descricao varchar(50) not null,
	valor decimal check (valor>0), -- default 0.0
	id_tipo_produto integer not null,
	primary key (id),
	foreign key (id_tipo_produto) references lanchonete.tipo_produto (id)
);


drop table lanchonete.produto;


insert into lanchonete.produto 
(descricao, valor, id_tipo_produto)
values 
('Refrigerante 1L', 6.5, 1),
('Refrigerante 2L', 8, 1),
('Pizza Calabreza M', 15, 2),
('Pizza Calabreza G', 20, 2),
('Pizza Mussarela M', 15, 2),
('Pizza Mussarela G', 20, 2),
('Hamburger', 8, 3),
('Eggsburger', 10, 3),
('X Tudo', 12, 3);

insert into lanchonete.produto 
(descricao, valor, id_tipo_produto)
values 
('Baré 1L', -6.5, 1);

select * from lanchonete.produto;



create table lanchonete.pedido(
	id serial,
	data date check(data>'2018-01-01'),
	id_cliente integer not null,
	primary key (id),
	foreign key (id_cliente) references lanchonete.cliente (id)
);

insert into lanchonete.pedido (data, id_cliente)
values 
('2018-11-01', 3),
('2018-11-01', 1),
('2018-11-03', 6),
('2018-11-05', 5),
('2018-11-10', 4),
('2018-11-12', 4),
('2018-11-14', 1),
('2018-11-14', 2);

select * from lanchonete.pedido;


create table lanchonete.itens_pedido(
	id_pedido integer not null,
	id_produto integer not null,
	quantidade integer check (quantidade>=1) not null,
	valor decimal not null,
	foreign key (id_pedido) references lanchonete.pedido (id),
	foreign key (id_produto) references lanchonete.produto (id)
);


insert into lanchonete.itens_pedido
(id_pedido, id_produto, quantidade, valor)
values 
(1, 3, 2, 15),
(1, 2, 1, 8),
(2, 8, 1, 10),
(2, 9, 1, 12),
(2, 1, 1, 6.5),
(3, 6, 1, 20),
(3, 1, 1, 8),
(4, 8, 1, 10),
(4, 9, 1, 12),
(4, 1, 1, 6.5),
(5, 5, 1, 15),
(5, 2, 1, 8),
(6, 4, 1, 20),
(7, 7, 1, 8),
(7, 1, 1, 8),
(8, 2, 1, 8),
(8, 4, 1, 20),
(8, 6, 1, 20);

select * from lanchonete.itens_pedido;



-- a) Aumente os preços dos itens sanduiches em $ 1,00
update lanchonete.produto
set valor = valor + 1
where id_tipo_produto = 3;


select * from lanchonete.produto
where id_tipo_produto = 3;

select * from lanchonete.tipo_produto;
-- id = 3





-- b) Altere o nome do cliente Luis para Luis Claudio e 
-- seu telefone para 9966-6667
-- id = 6
select * from lanchonete.cliente
where id = 6;

update lanchonete.cliente
set nome = 'Luis Claudio',
	telefone = '9966-6667'
where id = 6;




-- c) Insira o produto Lasanha no cardápio, ao preço de $ 25,00 e efetue o pedido deste item para o
-- cliente Luis Claudio, no dia 15/11/2018 junto com um refrigerante de 1L.

















