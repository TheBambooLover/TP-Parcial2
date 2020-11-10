INSERT INTO participantes (nombre,rol,id_proyecto,horas_asignadas)
VALUES ("test","developer",1,100);

INSERT INTO clientes(nombre,id_proyecto,id_centro_de_costos,id_centro_de_facturacion)
VALUES("Juan Test", 1,1,1);

INSERT INTO proyectos(id_cliente,nombre_proyecto)
VALUES(1,"Proyecto Test");

SELECT * FROM participantes

CALL rendir_horas(1,10);

SELECT * FROM clientes;

CALL liquidacion_mensual(1,1,"Tester",20,"Junio");
CALL liquidacion_mensual(1,1,"Tester",10,"Julio");

SELECT * FROM horas_liquidadas;

CALL ajuste_liquidacion(1,1,"Tester",-20,"Junio");

SELECT * FROM ajuste_horas;
