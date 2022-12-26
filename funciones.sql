-- SQLBook: Code
use restaurant;
#funcion calc_Edad
DELIMITER //
create function calc_edad(f_nacimiento date) returns int deterministic
begin
    declare edad int;
    set edad = (select timestampdiff(YEAR,f_nacimiento,curdate()));
    return edad;
end;
//
DELIMITER ;




-- TRIGGER
DELIMITER //
create trigger actualizar_orden
    after insert on orden_consumible for each row
    begin
        update orden set cantidad = cantidad + new.cantidad where id_orden = new.id_orden;
        update orden o inner join orden_consumible oc inner join consumible c on o.id_orden = oc.id_orden and oc.id_consumible = c.id_consumible
        set o.total = o.total + (new.cantidad * c.precio) where o.id_orden = new.id_orden;
    end;
//
DELIMITER ;