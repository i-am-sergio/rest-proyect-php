-- SQLBook: Code
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



-- insertarAdministrador
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


-- mostrar cocineros y años de trabajo