USE egresados_db;

DELIMITER $$

CREATE PROCEDURE registrar_egresado(
    IN p_cedula VARCHAR(20),
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_id_programa INT,
    IN p_fecha_graduacion DATE,
    OUT p_mensaje VARCHAR(200),
    OUT p_id_egresado INT
)
BEGIN
    DECLARE v_existe INT;
    SELECT COUNT(*) INTO v_existe FROM egresados WHERE cedula = p_cedula;
    IF v_existe > 0 THEN
        SET p_mensaje = 'El egresado ya existe';
        SET p_id_egresado = 0;
    ELSE
        INSERT INTO egresados (cedula, nombre, correo, id_programa, fecha_graduacion)
        VALUES (p_cedula, p_nombre, p_correo, p_id_programa, p_fecha_graduacion);
        SET p_id_egresado = LAST_INSERT_ID();
        SET p_mensaje = CONCAT('Egresado registrado con ID: ', p_id_egresado);
    END IF;
END$$

CREATE PROCEDURE consultar_egresado(
    IN p_cedula VARCHAR(20),
    OUT p_nombre VARCHAR(100),
    OUT p_correo VARCHAR(100),
    OUT p_programa VARCHAR(100)
)
BEGIN
    SELECT e.nombre, e.correo, p.nombre INTO p_nombre, p_correo, p_programa
    FROM egresados e
    INNER JOIN programas p ON e.id_programa = p.id_programa
    WHERE e.cedula = p_cedula;
END$$

CREATE PROCEDURE calcular_tasa_empleabilidad(
    IN p_id_programa INT,
    OUT p_tasa DECIMAL(5,2)
)
BEGIN
    DECLARE v_total INT;
    DECLARE v_empleados INT;
    SELECT COUNT(*) INTO v_total FROM egresados WHERE id_programa = p_id_programa;
    SELECT COUNT(DISTINCT id_egresado) INTO v_empleados FROM historial_laboral WHERE fecha_fin IS NULL;
    IF v_total > 0 THEN
        SET p_tasa = (v_empleados * 100.0) / v_total;
    ELSE
        SET p_tasa = 0;
    END IF;
END$$

CREATE PROCEDURE listar_egresados_por_programa(IN p_programa VARCHAR(100))
BEGIN
    SELECT e.cedula, e.nombre, e.correo, p.nombre AS programa, e.fecha_graduacion
    FROM egresados e
    INNER JOIN programas p ON e.id_programa = p.id_programa
    WHERE p.nombre = p_programa;
END$$

CREATE PROCEDURE calcular_promedio_salario(
    IN p_id_programa INT,
    INOUT p_promedio DECIMAL(12,2)
)
BEGIN
    SELECT IFNULL(AVG(h.salario), 0) INTO p_promedio
    FROM historial_laboral h
    INNER JOIN egresados e ON h.id_egresado = e.id_egresado
    WHERE e.id_programa = p_id_programa AND h.fecha_fin IS NULL;
END$$

DELIMITER ;
