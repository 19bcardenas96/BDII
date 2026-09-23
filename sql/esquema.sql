CREATE DATABASE IF NOT EXISTS egresados_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE egresados_db;

CREATE TABLE programas (
    id_programa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    facultad VARCHAR(80) NOT NULL,
    duracion_semestres INT NOT NULL
);

CREATE TABLE egresados (
    id_egresado INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    id_programa INT NOT NULL,
    fecha_graduacion DATE NOT NULL,
    FOREIGN KEY (id_programa) REFERENCES programas(id_programa)
);

CREATE TABLE empresas (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nit VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    sector VARCHAR(50),
    ciudad VARCHAR(50),
    telefono VARCHAR(20)
);

CREATE TABLE ofertas_empleo (
    id_oferta INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    salario DECIMAL(12,2),
    fecha_publicacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) NOT NULL DEFAULT 'Activa',
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);

CREATE TABLE postulaciones (
    id_postulacion INT AUTO_INCREMENT PRIMARY KEY,
    id_egresado INT NOT NULL,
    id_oferta INT NOT NULL,
    fecha_postulacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
    FOREIGN KEY (id_egresado) REFERENCES egresados(id_egresado),
    FOREIGN KEY (id_oferta) REFERENCES ofertas_empleo(id_oferta)
);

CREATE TABLE historial_laboral (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_egresado INT NOT NULL,
    id_empresa INT NOT NULL,
    cargo VARCHAR(80) NOT NULL,
    salario DECIMAL(12,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (id_egresado) REFERENCES egresados(id_egresado),
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);

CREATE TABLE auditoria_egresados (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_egresado INT NOT NULL,
    accion VARCHAR(20) NOT NULL,
    salario_anterior DECIMAL(12,2),
    salario_nuevo DECIMAL(12,2),
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usuario_bd VARCHAR(50),
    FOREIGN KEY (id_egresado) REFERENCES egresados(id_egresado)
);

CREATE TABLE reportes_empleabilidad (
    id_reporte INT AUTO_INCREMENT PRIMARY KEY,
    id_programa INT NOT NULL,
    año INT NOT NULL,
    total_egresados INT NOT NULL DEFAULT 0,
    total_empleados INT NOT NULL DEFAULT 0,
    tasa_empleabilidad DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    fecha_generacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_programa) REFERENCES programas(id_programa)
);
