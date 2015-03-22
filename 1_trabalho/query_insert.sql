--inserir clientes 
insert into clientes(id_cliente,nome,nif,morada,n_servicos_adquiridos)values(1,'Ze Pistacho', '222222', 'Avenida do Buraco Negro',2);
insert into clientes(id_cliente,nome,nif,morada,n_servicos_adquiridos)values(2,'Ze Baralho','33333','Rua Beco sem saida',1);
insert into clientes(id_cliente,nome,nif,morada,n_servicos_adquiridos)values(3,'Ze Rexemengo', '111111', 'Avenida da Rexemenguice',0);

--inserir transportes
insert into transportes(matricula,tipo,transito,taxa_viagem,carga,Taxa_Aluger) values('32-NN-67','CAMIAO',0,3,100,50);
insert into transportes(matricula,tipo,transito,taxa_viagem,carga,Taxa_Aluger) values('02-BB-33','CAMIONETE',0,100,200,100);
insert into transportes(matricula,tipo,transito,taxa_viagem,carga,Taxa_Aluger) values ('45-HB-03','MOTA',0,300,200,150);
insert into transportes(matricula,tipo,transito,taxa_viagem,carga,Taxa_Aluger) values ('BADALO DA VACA','CAMELO',0,200,700,200);
insert into transportes(matricula,tipo,transito,taxa_viagem,carga,Taxa_Aluger) values ('CAMISOLA AMARELA','BICICLETA',0,400,200,250);
insert into transportes(matricula,tipo,transito,taxa_viagem,carga,Taxa_Aluger) values ('NIKE','PE',0,2,40,300);


--inserir prestadortes
insert into prestadores(id_prest,nome,preco) values(1,'TAP',10000);
insert into prestadores(id_prest,nome,preco) values(2,'REFFER',200);
insert into prestadores(id_prest,nome,preco) values(3,'CP',500);
insert into prestadores(id_prest,nome,preco) values(4,'LUFTHANSA',1000);
insert into prestadores(id_prest,nome,preco) values(5,'BARCO A VELA',300);
insert into prestadores(id_prest,nome,preco) values(6,'AVIAO DE PAPEL',1000);
insert into prestadores(id_prest,nome,preco) values(7,'SUBMARINO',50000000);
insert into prestadores(id_prest,nome,preco) values(8,'PAPAGAIO',9000);
insert into prestadores(id_prest,nome,preco) values(9,'GOLFINHO',600);
insert into prestadores(id_prest,nome,preco) values(10,'VAIVEM',60900);

--inserir trocos
insert into  troco(id_troco,origem,destino,distancia) values(1,'LISBOA','PORTO',276);
insert into  troco(id_troco,origem,destino,distancia) values(2,'LISBOA','FARO',300);
insert into  troco(id_troco,origem,destino,distancia) values(3,'PORTO','FARO',600);
insert into  troco(id_troco,origem,destino,distancia) values(4,'ALVERCA','PORTO',140);
insert into  troco(id_troco,origem,destino,distancia) values(5,'TAVIRA','FARO',60);
insert into  troco(id_troco,origem,destino,distancia) values(6,'TAVIRA','ALTURA',32);
insert into  troco(id_troco,origem,destino,distancia) values(7,'LISBOA','COSTA DA CAPARICA',22);
insert into  troco(id_troco,origem,destino,distancia) values(8,'COSTA DA CAPARICA','MARISOL',20);
insert into  troco(id_troco,origem,destino,distancia) values(9,'SETUBAL','FARO',200);
insert into  troco(id_troco,origem,destino,distancia) values(10,'S.JORGE DA MURENHANHA','LISBOA',250);

--inserir servico simples/itenerario nacional
insert into serviços(id_servico,id_cliente,tipo_servico,data_servico) values(1,1,0,to_date('25/4/2013','dd/mm/yyyy'));
insert into iti_nacional(id_servico,id_troco,matricula) values(1,1,'32-NN-67');
insert into facturacao(id_fact,id_servico,preco,pago) values(1,1,null,1);
update facturacao set preco=preco_facturacao('32-NM-67',1) where facturacao.id_servico=1;
update transportes set transito=1 where matricula='32-NN-67';

insert into serviços(id_servico,id_cliente,tipo_servico,data_servico) values(2,1,0,to_date('25/5/2013','dd/mm/yyyy'));
insert into iti_nacional(id_servico,id_troco,matricula) values(2,1,'32-NN-67');
insert into facturacao(id_fact,id_servico,preco,pago) values(2,2,null,1);
update facturacao set preco=preco_facturacao('32-NM-67',2) where facturacao.id_servico=2;
update transportes set transito=1 where matricula='32-NN-67';
--inserir serviço internacional
insert into serviços(id_servico,id_cliente,tipo_servico,data_servico) values(3,2,1,to_date('25/4/2013','dd/mm/yyyy'));
insert into iti_internacional (id_servico,origem,destino,id_prest) values (3,'LISBOA','COPENHAGA',1);
insert into facturacao(id_fact,id_servico,preco,pago) values(3,3,null,1);
update facturacao set preco=(preco_prestadores(1)) where facturacao.id_servico=3;