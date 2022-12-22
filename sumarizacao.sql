-- Sumarização de Dados 

-- Trás dados únicos
select distinct (id_pedido) from lanchonete.itens_pedido ip;

select 1 as num_1, 4 as num_2 ,5 as num_3;

select max(id_pedido) as maior from lanchonete.itens_pedido ip;

select min(id_pedido) as menor from lanchonete.itens_pedido ip;

select avg(id_pedido) as menor from lanchonete.itens_pedido ip;

select sum(id_pedido) as menor from lanchonete.itens_pedido ip;


select count(*) from lanchonete.itens_pedido ip;

select 
	max(id_pedido) as maior,
	min(id_pedido) as menor,
	avg(id_pedido) as media,
	sum(id_pedido) as soma,
	count(*) as quantidade 
from lanchonete.itens_pedido ip;



select 
	id_produto , 
	count(*) as qtd,
	sum(valor) as valor_total,
	avg(valor) as media
from lanchonete.itens_pedido ip
group by id_produto 
order by id_produto;


select id_tipo_produto, count(*) 
from lanchonete.produto p 
group by id_tipo_produto;


select id_pedido, 
	sum(quantidade * valor - (valor * 10)/100) as total_pedido_com_desconto,
	sum(quantidade * valor) as total_pedido_sem_desconto
from lanchonete.itens_pedido 
group by id_pedido
-- having sum(quantidade * valor - (valor * 10)/100) >= 20
order by id_pedido ;


select valor, 
(valor * 10)/100 as desconto,
valor - (valor * 10)/100 as valor_total
from lanchonete.itens_pedido 


select *
from lanchonete.itens_pedido 
where id_pedido >1;

