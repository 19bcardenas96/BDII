USE egresados_db;

DELIMITER $$

CREATE TRIGGER trg_auditar_cambio_salario
BEFORE UPDATE ON historial_laboral
FOR EACH ROW
BEGIN
    IF NOT (NEW.salario <=> OLD.salario) THEN
        INSERT INTO auditoria_egresados (id_egresado, accion, salario_anterior, salario_nuevo, usuario_bd)
        VALUES (OLD.id_egresado, 'UPDATE', OLD.salario, NEW.salario, USER());
    END IF;
END$$

CREATE TRIGGER trg_auditar_nuevo_egresado
AFTER INSERT ON egresados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_egresados (id_egresado, accion, salario_anterior, salario_nuevo, usuario_bd)
    VALUES (NEW.id_egresado, 'INSERT', NULL, NULL, USER());
END$$

CREATE TRIGGER trg_actualizar_estado_postulacion
AFTER UPDATE ON postulaciones
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Aceptada' AND OLD.estado != 'Aceptada' THEN
        UPDATE ofertas_empleo SET estado = 'Cerrada' WHERE id_oferta = NEW.id_oferta;
    END IF;
END$$

DELIMITER ;
