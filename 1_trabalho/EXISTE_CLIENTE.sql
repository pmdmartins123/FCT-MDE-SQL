create or replace function existe_cliente
(cliente in integer) 
return number
is
  e_servico number;
  
  cursor c1 is
  select servi�os.id_servico from servi�os where id_cliente=cliente;
begin
  
    open c1;
    fetch c1 into e_servico;
    
    if c1%notfound then
      e_servico:=0;
    else
      close c1;
      return e_servico;
    end if;
      
  return null;
end existe_cliente;