# Sistema de Gestión de Egresados y Empleabilidad - COTECNOVA

Proyecto #8 - Bases de Datos II

## Autor
Brayan Cardenas - Ingeniería de Sistemas - COTECNOVA 2026

## Requisitos
- Docker Desktop con WSL2
- Ubuntu (WSL)
- MySQL Workbench

## Cómo ejecutar

### 1. Clonar
git clone https://github.com/alejandrarestrepoh-ops/proyecto-bd2-egresados.git
cd proyecto-bd2-egresados

### 2. Levantar contenedores
docker-compose up -d
docker ps

### 3. Ejecutar scripts SQL
docker exec -i egresados_mariadb mysql -u root -proot_password < sql/esquema.sql
docker exec -i egresados_mariadb mysql -u root -proot_password egresados_db < sql/datos_prueba.sql
docker exec -i egresados_mariadb mysql -u root -proot_password egresados_db < sql/procedimientos.sql
docker exec -i egresados_mariadb mysql -u root -proot_password egresados_db < sql/triggers.sql

### 4. Acceder a servicios
- phpMyAdmin: http://localhost:8201 (root / root_password)
- MySQL Workbench: 127.0.0.1:3309 (root / root_password)

## Procedimientos almacenados
1. registrar_egresado (IN, IN, IN, IN, IN, OUT, OUT)
2. consultar_egresado (IN, OUT, OUT, OUT)
3. calcular_tasa_empleabilidad (IN, OUT)
4. listar_egresados_por_programa (IN)
5. calcular_promedio_salario (IN, INOUT)

## Triggers
1. trg_auditar_cambio_salario (BEFORE UPDATE en historial_laboral)
2. trg_auditar_nuevo_egresado (AFTER INSERT en egresados)
3. trg_actualizar_estado_postulacion (AFTER UPDATE en postulaciones)

## Estructura del proyecto
- Dockerfile
- docker-compose.yml
- README.md
- sql/ (esquema.sql, datos_prueba.sql, procedimientos.sql, triggers.sql)
- modelado/mer.mwb
- docs/informe_avance.pdf# proyecto-bd2-egresados
