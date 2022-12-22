-- Junções

-- UNION
select 1 as num1, 2 as num2
union
select 3 as num1, 4 as num2
union
select 6 as num1, 7 as num2
union
select 8 as num1, 9 as num2;


select 1 as num1, 2 as num2
union all
select 1 as num1, 2 as num2;


select id_tipo_produto, 
	descricao, 
	valor,
	valor - (valor * 10)/100 as total_com_desconto,
	'10%' as valor_desconto
from lanchonete.produto p
where id_tipo_produto = 1
union
select 
	id_tipo_produto, 
	descricao, 
	valor,
	valor - (valor * 15)/100 as total_com_desconto,
	'15%' as valor_desconto
from lanchonete.produto p
where id_tipo_produto = 2
union 
select id_tipo_produto, descricao, valor,
valor - (valor * 30)/100 as total_com_desconto,
'30%' as valor_desconto
from lanchonete.produto p
where id_tipo_produto = 3;


-- Join

select *
-- p.descricao as produto, 
	--	tp.descricao as tipo  
from lanchonete.produto as p 
inner join lanchonete.tipo_produto as tp on p.id_tipo_produto=tp.id;


select c.nome as cliente,
		sum(ip.valor) as valor
from lanchonete.itens_pedido ip 
inner join lanchonete.pedido p on ip.id_pedido=p.id
inner join lanchonete.produto p2 on ip.id_produto=p2.id
inner join lanchonete.cliente c on c.id=p.id_cliente 

where ip.id_produto = 1
group by c.nome;

-- select * from lanchonete.tipo_produto tp 


