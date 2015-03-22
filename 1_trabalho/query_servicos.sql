--cancelar um serviço com itenerario nacional (1)
delete from (select *from serviços,iti_nacional,facturacao 
where serviços.id_servico=2 
and serviços.id_servico=iti_nacional.id_servico 
and facturacao.id_servico=serviços.id_servico);   
--cancelar um servico com itenerario internacioanl (2)
delete from (select *from serviços, iti_internacional, facturacao 
where serviços.id_servico=3 
and serviços.id_servico=iti_internacional.id_servico 
and serviços.id_servico=facturacao.id_servico);

--mostrar relaçao cliente, serviço, transporte/prestador (3)
select clientes.nome, clientes.nif, serviços.data_servico, troco.origem, troco.destino, troco.distancia, transportes.matricula, transportes.tipo 
from clientes inner join serviços on (clientes.id_cliente=serviços.id_cliente)
inner join iti_nacional on (iti_nacional.id_servico=serviços.id_servico)
inner join troco on (troco.id_troco=iti_nacional.id_troco)
inner join transportes on(transportes.matricula=iti_nacional.matricula)
union
select clientes.nome, clientes.nif, serviços.data_servico,iti_internacional.origem, iti_internacional.destino, 0,prestadores.nome,' - - - '
from clientes inner join serviços on (clientes.id_cliente=serviços.id_cliente)
inner join iti_internacional on (iti_internacional.id_servico=serviços.id_servico)
inner join prestadores on (iti_internacional.id_prest=prestadores.id_prest);

--alterar facturas (4)
update facturacao set preco=999 where id_fact=2;

--criar um orcamento a nivel nacional (5)
select *from troco, transportes,serviços where (origem='LISBOA' AND destino='PORTO' AND carga>=100);


--ver todas as facturas (6)
select *from facturacao;
--ver todas as facturas pagas (7)
select *from facturacao where (pago=1);
--ver todas as facturas por pagar (8)
select *from facturacao where (pago=0); 
-- dar servico como pago pesquisa pelo id_cliente e data (9)
update facturacao set pago=1 
where facturacao.id_servico=(select  serviços.id_servico from serviços where (id_cliente=1 AND serviços.data_servico=to_date('25/5/2013','dd/mm/yyyy')));
-- dar servico como pago pelo id_fact (10)
update facturacao set pago=1 where id_fact=1;um intervalo de tempo
--pesquisa de facturas por data (11)
select *from serviços,facturacao 
where serviços.id_servico=facturacao.id_servico 
and serviços.data_servico>=to_date('1/4/2013','dd/mm/yyyy')
and serviços.data_servico<=to_date('1/5/2013','dd/mm/yyyy');

--apaga cliente caso nao exista um serviço (12)
delete from clientes where id_cliente=1 and (select distinct (existe_cliente(1)) from serviços)=null; 


-- guias de transporte do dia (13)
select serviços.id_servico,serviços.data_servico,troco.origem,troco.destino,transportes.matricula, transportes.tipo from serviços,iti_nacional,troco,transportes 
where (serviços.data_servico=to_date('25/4/2013','dd/mm/yyyy') 
and serviços.id_servico=iti_nacional.id_servico 
and iti_nacional.id_troco=troco.id_troco
and iti_nacional.matricula=transportes.matricula);
--todas as guias de transporte (14)
select serviços.id_servico,serviços.data_servico,troco.origem,troco.destino,transportes.matricula, transportes.tipo from serviços,iti_nacional,troco,transportes 
where (serviços.id_servico=iti_nacional.id_servico 
and iti_nacional.id_troco=troco.id_troco
and iti_nacional.matricula=transportes.matricula);
--todas as guias de transporte do ano (15)
select serviços.id_servico,serviços.data_servico,troco.origem,troco.destino,transportes.matricula, transportes.tipo from serviços,iti_nacional,troco,transportes 
where (serviços.data_servico>=to_date('1/1/2013','dd/mm/yyyy')
and serviços.data_servico<=to_date('31/12/2013','dd/mm/yyyy')
and serviços.id_servico=iti_nacional.id_servico 
and iti_nacional.id_troco=troco.id_troco
and iti_nacional.matricula=transportes.matricula);
--alterar o transporte na guia de transporte (16)
update iti_nacional set iti_nacional.matricula='45-HB-03' where iti_nacional.id_servico=1;
--servicos prestados por um veiculo num intervalo de tempo (17)
select serviços.id_servico from serviços, iti_nacional, transportes 
where serviços.id_servico=iti_nacional.id_servico 
and transportes.matricula='45-HB-03' 
and serviços.data_servico>=to_date('1/4/2013','dd/mm/yyyy')
and serviços.data_servico<=to_date('1/5/2013','dd/mm/yyyy');
--veiculos ocupados numa data (18)
select *from serviços, iti_nacional, transportes 
where serviços.id_servico=iti_nacional.id_servico
and iti_nacional.matricula=transportes.matricula
and serviços.data_servico>=to_date('1/4/2013','dd/mm/yyyy')
and serviços.data_servico<=to_date('1/5/2013','dd/mm/yyyy');
--veiculos livres numa data (19)
select distinct transportes.matricula, transportes.tipo, transportes.carga, transportes.taxa_viagem, transportes.taxa_aluger 
from serviços,iti_nacional,transportes 
where transportes.matricula <> (select transportes.matricula 
from serviços, iti_nacional, transportes 
where serviços.id_servico=iti_nacional.id_servico
and iti_nacional.matricula=transportes.matricula
and serviços.data_servico>=to_date('1/4/2013','dd/mm/yyyy')
and serviços.data_servico<=to_date('1/5/2013','dd/mm/yyyy')
);
 
--------------------------------
--Ganhos (20)
select sum(facturacao.preco) from facturacao, serviços where serviços.id_servico=facturacao.id_servico;
--cliente mais rentavel (21)
select facturacao.preco, serviços.id_cliente, clientes.nif,clientes.nome 
from serviços, facturacao, clientes 
where  serviços.id_servico=facturacao.id_servico 
and facturacao.preco=(select max(facturacao.preco) from facturacao) 
and clientes.id_cliente=serviços.id_cliente;
--os 10 clientes com mais servicos (22)
select clientes.id_cliente, n_servicos_adquiridos from clientes where ROWNUM <=10 order by n_servicos_adquiridos desc; 