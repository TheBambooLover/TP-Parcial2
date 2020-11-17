INSERT INTO participantes (nombre,rol,id_proyecto,horas_asignadas)
VALUES ("test","developer",1,100);

INSERT INTO participantes (nombre,rol,id_proyecto,horas_asignadas)
VALUES ("test","QA",1,300);

INSERT INTO participantes (nombre,rol,id_proyecto,horas_asignadas)
VALUES ("test","TESTER",1,200);

INSERT INTO participantes (nombre,rol,id_proyecto,horas_asignadas)
VALUES ("test","OWNER",1,0);

INSERT INTO participantes (nombre,rol,id_proyecto,horas_asignadas)
VALUES ("test","PM",1,40);


SELECT * FROM participantes;

INSERT INTO clientes(nombre,id_proyecto,id_centro_de_costos,id_centro_de_facturacion)
VALUES("Juan Test", 1,1,1);

SELECT * FROM clientes;

INSERT INTO proyectos(id_cliente,nombre_proyecto)
VALUES(1,"Proyecto Test");

SELECT * FROM proyectos;

CALL rendir_horas(1,10);
CALL rendir_horas(5,110);

CALL liquidacion_mensual(1,1,"Tester",20,"Junio");
CALL liquidacion_mensual(1,1,"Tester",10,"Julio");
CALL liquidacion_mensual(1,1,"QA",10,"Julio");
CALL liquidacion_mensual(1,1,"OWNER",0,"Julio");
CALL liquidacion_mensual(1,1,"DEVELOPER",10,"Julio");
CALL liquidacion_mensual(1,1,"PM",23,"Julio");

SELECT * FROM horas_liquidadas;

CALL ajuste_liquidacion(1,1);

SELECT * FROM ajuste_horas;
DELETE FROM ajuste_horas;

SELECT * FROM auditoria_horas;

CALL eliminar_horas(1,1);