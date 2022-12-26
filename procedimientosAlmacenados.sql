-- SQL Storage Procediments

-- insertarCliente 
DELIMITER //
DROP PROCEDURE IF EXISTS insertarCliente;
CREATE PROCEDURE insertarCliente(
	IN ID int,
    IN nombres varchar(30),
    IN primer_apellido varchar(20),
    IN segundo_apellido varchar(20),
    IN correo varchar(30),
    IN telefono integer,
	IN usuario varchar(20),
    IN contrasenha varchar(20),
    IN direccion varchar(50),
    IN fecha_nacimiento date)
BEGIN
	INSERT INTO usuario VALUES(ID,nombres,primer_apellido,segundo_apellido,correo,telefono,usuario,contrasenha);
    INSERT INTO cliente VALUES(ID,direccion,fecha_nacimiento);
END;
//
DELIMITER ;



----  insertarAdministrador -------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS insertarAdministrador;
CREATE PROCEDURE insertarAdministrador(
	IN ID int,
    IN nombres varchar(30),
    IN primer_apellido varchar(20),
    IN segundo_apellido varchar(20),
    IN correo varchar(30),
    IN telefono integer,
	IN usuario varchar(20),
    IN contrasenha varchar(20),
    IN nivelAcceso varchar(50))
BEGIN
	INSERT INTO usuario VALUES(ID,nombres,primer_apellido,segundo_apellido,correo,telefono,usuario,contrasenha);
    INSERT INTO administrador VALUES(ID,nivelAcceso);
END;
//
DELIMITER ;


---  mostrar_repartidores_3entregas --------------------------------------------

use restaurant;

DELIMITER //
drop procedure if exists mostrar_repartidores_3entregas//
create procedure mostrar_repartidores_3entregas()
begin
    SELECT a.DNI 'DNI', CONCAT(a.nombres,' ',a.primer_apellido,' ',a.segundo_apellido) 'Nombre completo', calc_edad(a.fecha_nacimiento) 'Edad',
    a.telefono 'Telefono', a.correo 'Correo',b.entrega_realizada 'Entregas exitosas' FROM trabajador_restaurante a
    INNER JOIN repartidor b
    ON b.DNI = a.DNI 
    WHERE (b.entrega_realizada) >= 3;
end;
//
DELIMITER ;

call mostrar_repartidores_3entregas


---- cantidad_proveedores ----------------------------------

use restaurant;

DELIMITER //
drop procedure if exists cantidad_proveedores//
create procedure cantidad_proveedores()
begin
    SELECT a.id_proveedor 'ID',a.nombre 'Nombre de proveedor',b.tipo 'Tipo de productos',COUNT(c.id_consumible) 'Numero de consumibles distribuidos' FROM proveedor a
    INNER JOIN tipo_proveedor b
    INNER JOIN consumible c
    ON b.id_proveedor = a.id_proveedor
    AND a.id_proveedor = c.id_proveedor
    GROUP BY(a.id_proveedor);
end;
//
DELIMITER ;

call cantidad_proveedores


-- mostrar_chefs_10anios---------------------------------------

use restaurant;

DELIMITER //
drop procedure if exists mostrar_chefs_10anios//
create procedure mostrar_chefs_10anios()
begin
    SELECT a.DNI 'DNI', CONCAT(a.nombres,' ',a.primer_apellido,' ',a.segundo_apellido) 'Nombre completo', calc_edad(a.fecha_nacimiento) 'Edad',
    calc_edad(b.fecha_ingreso) 'AÃ±os de Trabajo', a.telefono 'Telefono', a.correo 'Correo',
    ec.especialidad 'Especialidad' FROM trabajador_restaurante a
    INNER JOIN chef b
    INNER JOIN especialidad_chef ec
    ON b.DNI = a.DNI 
    AND ec.id_chef = b.DNI
    WHERE calc_edad(b.fecha_ingreso) >= 10;
end;
//
DELIMITER ;

call mostrar_chefs_10anios