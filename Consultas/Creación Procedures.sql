delimiter $$
CREATE PROCEDURE rendir_horas(IN parametro INT,IN parametro2 INT)
BEGIN
	UPDATE participantes p 
	SET p.horas_rendidas = p.horas_rendidas + parametro2
	WHERE id=parametro;
END
$$

delimiter $$
CREATE PROCEDURE liquidación_mensual(IN parametro INT,IN parametro2 INT)
BEGIN
	SELECT horas_rendidas INTO @value FROM participantes
	WHERE id_proyecto=parametro;
	
	SELECT nombre INTO @Nvalue FROM clientes
	WHERE parametro2=id;
	
	SELECT nombre_proyecto INTO @Pvalue FROM proyectos
	WHERE id=parametro;
	
	INSERT INTO horas_liquidadas (id_proyecto,nombre_proyecto,id_cliente,nombre_cliente,cantidad)
	VALUES(parametro,@Pvalue,parametro2,@Nvalue,@VALUE);
END
$$

DROP PROCEDURE liquidacion_mensual