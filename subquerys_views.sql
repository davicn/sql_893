-- Sub-consulta

select * from (
select c.nome as cliente,
		sum(ip.valor) as valor
from lanchonete.itens_pedido ip 
inner join lanchonete.pedido p on ip.id_pedido=p.id
inner join lanchonete.produto p2 on ip.id_produto=p2.id
inner join lanchonete.cliente c on c.id=p.id_cliente 
group by c.nome) as resultado
where valor > 30;


select * from escola.turma
where id_professor not in (select id from escola.professor);


-- View
create or replace view lanchonete.cliente_valor as 
select c.nome as cliente,
		sum(ip.valor) as valor
from lanchonete.itens_pedido ip 
inner join lanchonete.pedido p on ip.id_pedido=p.id
inner join lanchonete.produto p2 on ip.id_produto=p2.id
inner join lanchonete.cliente c on c.id=p.id_cliente 
group by c.nome;

select * from lanchonete.cliente_valor;

-- Código apra ilustrar código da view
select pg_get_viewdef('lanchonete.cliente_valor', true);

-- Views Materializadas
create materialized view lanchonete.cliente_valor_mt
as
select c.nome as cliente,
		sum(ip.valor) as valor
from lanchonete.itens_pedido ip 
inner join lanchonete.pedido p on ip.id_pedido=p.id
inner join lanchonete.produto p2 on ip.id_produto=p2.id
inner join lanchonete.cliente c on c.id=p.id_cliente 
group by c.nome;

select * from lanchonete.cliente_valor_mt;

refresh materialized view lanchonete.cliente_valor_mt;







