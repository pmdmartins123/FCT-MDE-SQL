-- alterar cliente 
update clientes set nome='Pedro o terror de carnide' where id_cliente=1;
--mostrar todos os clientes
select *from clientes;
--pesquisar cliente por nome/nif/morada
select *from clientes where nome='Pedro o terror de carnide';
select *from clientes where nif='33333';
select *from clientes where morada='Avenida do Buraco Negro';
--mostrar o cliente com mais serviços adquiridos
select *from clientes where n_servicos_adquiridos=(select max(clientes.n_servicos_adquiridos) as servicos_adquiridos from clientes);
