-- alterar dados de tro�o
update troco set distancia=24 where id_troco=7;
-- apagar tro�o
delete troco where id_troco=10;
--visualizar todos os tro�os na base de dados
select *from troco;
--pesquisa de um troco especifico
select *from troco where troco.origem='LISBOA' and troco.destino='PORTO';
