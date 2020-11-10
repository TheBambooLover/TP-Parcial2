delimiter $$
CREATE PROCEDURE rendir_horas(IN parametro INT,IN parametro2 INT)
BEGIN
	UPDATE participantes p 
	SET p.horas_rendidas = p.horas_rendidas + parametro2
	WHERE id=parametro;
END
$$

delimiter $$
CREATE PROCEDURE liquidación_mensual(IN idproyecto INT,IN idcliente INT, IN tipo VARCHAR(50),IN HORAS INT)
BEGIN
	
	SELECT nombre INTO @Nvalue FROM clientes
	WHERE idcliente=id;
	
	SELECT nombre_proyecto INTO @Pvalue FROM proyectos
	WHERE id=idproyecto;
	
	INSERT INTO horas_liquidadas (id_proyecto,nombre_proyecto,id_cliente,nombre_cliente,tipo_de_hora,cantidad)
	VALUES(idproyecto,@Pvalue,idcliente,@Nvalue,tipo,HORAS);
END
$$

delimiter $$
CREATE PROCEDURE ajuste_liquidacion(IN idproyecto INT, IN idcliente INT, IN tipo VARCHAR(50),IN HORAS INT)
BEGIN

	SELECT nombre INTO @Nvalue FROM clientes
	WHERE idcliente=id;
	
	SELECT nombre_proyecto INTO @Pvalue FROM proyectos
	WHERE id=idproyecto;
	
	INSERT INTO ajuste_horas (id_proyecto,nombre_proyecto,id_cliente,nombre_cliente,tipo_de_hora,cantidad)
	VALUES(idproyecto,@Pvalue,idcliente,@Nvalue,tipo,HORAS);

END
$$

DROP PROCEDURE ajuste_liquidacion