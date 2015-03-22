create or replace 
function preco_prestadores (prestador_id in integer)
return number 
is 
  preco_1 integer;
  cursor c1 is
  select prestadores.preco from prestadores where prestadores.id_prest=prestador_id;
begin
  open c1;
  fetch c1 into preco_1;
  
  if c1%notfound then
    preco_1:=null;
  end if;
  
  close c1;
  
  return preco_1;
end preco_prestadores;