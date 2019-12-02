use mydb;
drop view vendedor_vendas;
	create view vendedor_vendas as select P.nome as "Nome do vendedor", Vend.codigo as "Codigo da venda",Vend.preco as "Preço da compra" from vendedor V 
	inner join pessoa P on P.cpf=V.Pessoa_cpf 
	inner join loja L on L.codigo=V.Loja_codigo
	inner join venda Vend on L.codigo=Vend.Loja_Codigo;

select * from vendedor_vendas;

drop view qtd_planta_vendida;
create view qtd_planta_vendida as select count(V.Planta_Codigo) as "Codigo da planta", Loja_Codigo as "Codigo da loja",V.data "Data da venda", nome as "Nome da planta"
from venda V inner join planta P on planta_codigo=P.codigo;

drop procedure desconto;

DELIMITER $$
create function desconto(preco int)
returns float deterministic
begin 
declare desconto float;
	set desconto=preco*0.25;
return desconto;
end$$

create procedure planta_mais_vendida(in mes int)
begin 
	select nome from qtd_planta_vendida where month(data)=mes;
end$$

create trigger atualiza_estoque_venda
after insert on venda for each row
begin
	update estoque
    set quantidade=quantidade-quantidade
    where Planta_Codigo=Planta_codigo;
end$$


create trigger atualiza_estoque_frete
after insert on entrega for each row
begin 
	update estoque
    set quantidade=quantidade+quantidade
    where Planta_Codigo=Planta_codigo;
end$$ 

DELIMITER ;

START TRANSACTION;
insert into venda values();
	create index idxPlanta_codigo_estoque on estoque(Planta_Codigo);

	create index idxPlanta_codigo on planta(codigo);
