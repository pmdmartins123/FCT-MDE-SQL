create or replace 
function preco_facturacao
(matricula in varchar2, troco_1 in integer ) 
return number
is
  preco_a integer;
  preco_v integer;
  distancia_1 number;
  preco_t integer;
  
  cursor c1 is
  select transportes.taxa_aluger from transportes where transportes.matricula=matricula;
  
  cursor c2 is
  select transportes.taxa_viagem from transportes where transportes.matricula=matricula;
  
  
  cursor c4 is 
  select troco.distancia from troco where troco.id_troco=troco_1;

begin
  open c1;
  open c2;
  open c4;
  
  
  fetch c1 into preco_a;
  fetch c2 into preco_v;
  fetch c4 into distancia_1;
  
  if c1%found then 
    if c2%found then
      if c4%found then
        preco_t:= preco_a+preco_v*distancia_1;
      end if;
    end if;
  end if;

    
  close c1;
  close c2;
  close c4;
  return preco_t;
end preco_facturacao;