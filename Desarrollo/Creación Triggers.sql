delimiter $$
CREATE TRIGGER trg_auditar_horas
		BEFORE UPDATE
		ON participantes
	FOR EACH row
	begin
	if OLD.id <> NEW.id
	then
		SIGNAL SQLSTATE'34000'
		SET MESSAGE_TEXT='No se puede modificar id del usuario';
			END if;
		INSERT INTO auditoria_horas(modificó,cant_anterior,cant_nueva,hora)
		VALUES (CURRENT_USER(),OLD.horas_rendidas,NEW.horas_rendidas,NOW());
	END;
$$