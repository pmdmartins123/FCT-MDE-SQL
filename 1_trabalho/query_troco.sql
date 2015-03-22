-- alterar dados de troço
update troco set distancia=24 where id_troco=7;
-- apagar troço
delete troco where id_troco=10;
--visualizar todos os troços na base de dados
select *from troco;
--pesquisa de um troco especifico
select *from troco where troco.origem='LISBOA' and troco.destino='PORTO';
