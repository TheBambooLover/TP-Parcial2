delimiter $$
CREATE PROCEDURE rendir_horas(IN parametro INT,IN parametro2 INT)
BEGIN
	UPDATE participantes p 
	SET p.horas_rendidas = p.horas_rendidas + parametro2
	WHERE id=parametro;
END
$$

delimiter $$
CREATE PROCEDURE liquidación_mensual(IN idproyecto INT,IN idcliente INT, IN tipo VARCHAR(50),IN HORAS INT,IN MES VARCHAR(50))
BEGIN
	SELECT nombre INTO @Nvalue FROM clientes
	WHERE idcliente=id;
	
	SELECT nombre_proyecto INTO @Pvalue FROM proyectos
	WHERE id=idproyecto;
	
	INSERT INTO horas_liquidadas (id_proyecto,nombre_proyecto,id_cliente,nombre_cliente,tipo_de_hora,cantidad,mes)
	VALUES(idproyecto,@Pvalue,idcliente,@Nvalue,tipo,HORAS,MES);
END
$$

delimiter $$
CREATE PROCEDURE ajuste_liquidacion(IN idproyecto INT, IN idcliente INT)
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE HL INT;
DECLARE HR INT;
DECLARE HLM VARCHAR(50);
DECLARE HRT VARCHAR(50);
DECLARE cur1 CURSOR FOR SELECT h.cantidad from horas_liquidadas h WHERE h.id_proyecto=idproyecto AND h.eliminado=false;
DECLARE cur2 CURSOR FOR SELECT p.horas_rendidas FROM participantes p WHERE p.id_proyecto=idproyecto;
DECLARE cur3 CURSOR FOR SELECT h.mes FROM horas_liquidadas h WHERE h.id_proyecto=idproyecto AND h.eliminado=false;
DECLARE cur4 CURSOR FOR SELECT p.rol FROM participantes p WHERE p.id_proyecto=idproyecto;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

SELECT nombre INTO @Nvalue
FROM clientes
WHERE idcliente=id;
SELECT nombre_proyecto INTO @Pvalue
FROM proyectos
WHERE id=idproyecto;

OPEN cur1;
OPEN cur2;
OPEN cur3;
OPEN cur4;

REPEAT 
	IF NOT done THEN
	FETCH cur1 INTO HL;
	FETCH cur2 INTO HR;
	FETCH cur3 INTO HLM;
	FETCH cur4 INTO HRT;
		INSERT INTO ajuste_horas (id_proyecto,nombre_proyecto,id_cliente,nombre_cliente,tipo_de_hora,cantidad,mes)
		VALUES(idproyecto,@Pvalue,idcliente,@Nvalue,HRT,(HL-HR),HLM); 
	END IF;
	UNTIL done END REPEAT;
	
	CLOSE cur1;
	CLOSE cur2;
	CLOSE cur3;
	CLOSE cur4;
	
	SELECT MAX(id) INTO @lastid from ajuste_horas; 
	DELETE from ajuste_horas WHERE id = @lastid; 
END
$$

DROP PROCEDURE ajuste_liquidacion;