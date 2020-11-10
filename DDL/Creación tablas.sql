create table proyectos (
  id int not null auto_increment primary key,
  id_cliente INT NOT NULL,
  nombre_proyecto varchar(50) not null
);
parcial2
CREATE TABLE participantes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	rol VARCHAR(50) NOT NULL,
	id_proyecto INT NOT NULL,
	horas_asignadas INT NOT NULL,
	horas_rendidas INT NOT NULL DEFAULT 0
);

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	id_proyecto INT NOT NULL,
	id_centro_de_costos INT NOT NULL,
	id_centro_de_facturacion INT NOT NULL
);

CREATE TABLE centros(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(50) NOT NULL,
	nombre VARCHAR(50) NOT null
);

CREATE TABLE horas_liquidadas(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_proyecto int NOT NULL,
	nombre_proyecto VARCHAR(50) NOT NULL,
	id_cliente INT NOT NULL,
	nombre_cliente VARCHAR(50) NOT NULL,
	tipo_de_hora VARCHAR(50) NOT NULL,
	cantidad INT NOT NULL,
	mes VARCHAR (50)
);


CREATE TABLE ajuste_horas(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_proyecto int NOT NULL,
	nombre_proyecto VARCHAR(50) NOT NULL,
	id_cliente INT NOT NULL,
	nombre_cliente VARCHAR(50) NOT NULL,
	tipo_de_hora VARCHAR(50) NOT NULL,
	cantidad INT NOT NULL,
	mes VARCHAR (50)
);
