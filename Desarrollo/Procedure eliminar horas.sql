delimiter $$
CREATE PROCEDURE eliminar_horas(IN idhora INT,IN eliminar boolean)
BEGIN
	UPDATE horas_liquidadas h
	SET h.eliminado = eliminar
	WHERE id=idhora;
END
$$