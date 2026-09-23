USE egresados_db;

INSERT INTO programas (nombre, facultad, duracion_semestres) VALUES
('Ingenieria de Sistemas', 'Ingenieria', 10),
('Ingenieria Industrial', 'Ingenieria', 10),
('Administracion de Empresas', 'Ciencias Economicas', 10),
('Contaduria Publica', 'Ciencias Economicas', 10),
('Diseno Grafico', 'Artes', 8),
('Comunicacion Social', 'Humanidades', 10),
('Derecho', 'Ciencias Juridicas', 10),
('Psicologia', 'Humanidades', 10),
('Enfermeria', 'Ciencias de la Salud', 8),
('Tecnologia en Sistemas', 'Ingenieria', 6);

INSERT INTO egresados (cedula, nombre, correo, telefono, id_programa, fecha_graduacion) VALUES
('1001', 'Juan Perez', 'juan@cotecnova.edu.co', '3105551001', 1, '2020-12-15'),
('1002', 'Maria Lopez', 'maria@cotecnova.edu.co', '3105551002', 2, '2021-06-20'),
('1003', 'Carlos Gomez', 'carlos@cotecnova.edu.co', '3105551003', 3, '2019-12-10'),
('1004', 'Ana Rodriguez', 'ana@cotecnova.edu.co', '3105551004', 4, '2022-06-15'),
('1005', 'Luis Martinez', 'luis@cotecnova.edu.co', '3105551005', 5, '2020-11-30'),
('1006', 'Sofia Hernandez', 'sofia@cotecnova.edu.co', '3105551006', 6, '2021-12-15'),
('1007', 'Pedro Ramirez', 'pedro@cotecnova.edu.co', '3105551007', 7, '2018-06-20'),
('1008', 'Laura Torres', 'laura@cotecnova.edu.co', '3105551008', 8, '2022-12-10'),
('1009', 'Diego Flores', 'diego@cotecnova.edu.co', '3105551009', 9, '2023-06-15'),
('1010', 'Carmen Diaz', 'carmen@cotecnova.edu.co', '3105551010', 10, '2023-12-20');

INSERT INTO empresas (nit, nombre, sector, ciudad, telefono) VALUES
('900111111-1', 'TechSolutions SAS', 'Tecnologia', 'Bogota', '6015551001'),
('900111111-2', 'Industrias ABC', 'Manufactura', 'Medellin', '6045551002'),
('900111111-3', 'Consultores XYZ', 'Servicios', 'Cali', '6025551003'),
('900111111-4', 'Comercial 123', 'Comercio', 'Cartago', '6025551004'),
('900111111-5', 'Estudio Creativo', 'Diseno', 'Pereira', '6065551005'),
('900111111-6', 'Medios Ya', 'Comunicaciones', 'Armenia', '6065551006'),
('900111111-7', 'Bufete Legal', 'Juridico', 'Manizales', '6065551007'),
('900111111-8', 'Centro Salud', 'Salud', 'Bogota', '6015551008'),
('900111111-9', 'Hospital Central', 'Salud', 'Medellin', '6045551009'),
('900111111-10', 'Startup Tech', 'Tecnologia', 'Cali', '6025551010');

INSERT INTO ofertas_empleo (id_empresa, titulo, descripcion, salario, estado) VALUES
(1, 'Desarrollador Backend', 'Java + Spring Boot', 4500000, 'Activa'),
(1, 'Frontend Developer', 'React + TypeScript', 4000000, 'Activa'),
(2, 'Ingeniero de Produccion', 'Optimizacion de procesos', 3800000, 'Activa'),
(3, 'Consultor Empresarial', 'Consultoria estrategica', 4200000, 'Activa'),
(4, 'Administrador de Tienda', 'Gestion de local comercial', 2800000, 'Activa'),
(5, 'Disenador UI/UX', 'Diseno de interfaces', 3500000, 'Activa'),
(6, 'Community Manager', 'Manejo de redes sociales', 2500000, 'Cerrada'),
(7, 'Abogado Litigante', 'Derecho civil y laboral', 5000000, 'Activa'),
(8, 'Enfermero Jefe', 'Coordinacion de enfermeria', 3200000, 'Activa'),
(9, 'Analista de Sistemas', 'Analisis y desarrollo', 4000000, 'Activa');

INSERT INTO postulaciones (id_egresado, id_oferta, estado) VALUES
(1, 1, 'Aceptada'),
(2, 2, 'En revision'),
(3, 3, 'Aceptada'),
(4, 4, 'Rechazada'),
(5, 5, 'Aceptada'),
(6, 6, 'Pendiente'),
(7, 7, 'Aceptada'),
(8, 8, 'En revision'),
(9, 9, 'Aceptada'),
(10, 10, 'Pendiente');

INSERT INTO historial_laboral (id_egresado, id_empresa, cargo, salario, fecha_inicio, fecha_fin) VALUES
(1, 1, 'Desarrollador Junior', 3500000, '2021-01-15', '2023-06-30'),
(1, 1, 'Desarrollador Senior', 5500000, '2023-07-01', NULL),
(2, 2, 'Analista de Procesos', 3800000, '2021-08-01', NULL),
(3, 3, 'Consultor Junior', 3500000, '2020-02-15', '2022-12-31'),
(3, 3, 'Consultor Senior', 5000000, '2023-01-01', NULL),
(4, 4, 'Contador Auxiliar', 2800000, '2022-08-01', NULL),
(5, 5, 'Disenador Grafico', 3200000, '2021-01-15', NULL),
(6, 6, 'Periodista', 3000000, '2022-02-01', NULL),
(7, 7, 'Abogado Asociado', 4500000, '2019-01-15', NULL),
(8, 8, 'Psicologo Clinico', 3500000, '2023-01-15', NULL);

INSERT INTO auditoria_egresados (id_egresado, accion, salario_anterior, salario_nuevo, usuario_bd) VALUES
(1, 'UPDATE', 3500000, 5500000, 'root@localhost'),
(3, 'UPDATE', 3500000, 5000000, 'root@localhost'),
(2, 'UPDATE', 3500000, 3800000, 'root@localhost'),
(4, 'UPDATE', 2500000, 2800000, 'root@localhost'),
(5, 'UPDATE', 3000000, 3200000, 'root@localhost'),
(6, 'UPDATE', 2800000, 3000000, 'root@localhost'),
(7, 'UPDATE', 4000000, 4500000, 'root@localhost'),
(8, 'UPDATE', 3200000, 3500000, 'root@localhost'),
(9, 'UPDATE', 3800000, 4200000, 'root@localhost'),
(10, 'UPDATE', 2800000, 3200000, 'root@localhost');

INSERT INTO reportes_empleabilidad (id_programa, año, total_egresados, total_empleados, tasa_empleabilidad) VALUES
(1, 2023, 50, 45, 90.00),
(2, 2023, 40, 35, 87.50),
(3, 2023, 60, 48, 80.00),
(4, 2023, 45, 38, 84.44),
(5, 2023, 30, 25, 83.33),
(6, 2023, 35, 28, 80.00),
(7, 2023, 55, 50, 90.91),
(8, 2023, 25, 22, 88.00),
(9, 2023, 40, 38, 95.00),
(10, 2023, 70, 60, 85.71);
