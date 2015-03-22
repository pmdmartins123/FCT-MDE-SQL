--editar prestador
update prestadores set nome='CAVALOS MARINHOS' where id_prest=9;
--remover prestador
delete prestadores where id_prest=10;
--mostrar todos os prestadores
select *from  prestadores;
--mostrar prestador a partir de certo preço
select *from prestadores where preco>=200000;
--pesquisar prestador por nome 
select *from prestadores where nome='TAP';
