--editar transporte
update transportes set tipo='BOI' where matricula='BADALO DA VACA';
--apagar transporte
delete from transportes where matricula='NIKE';
--mostrar todos os transportes da companhia
select *from transportes;