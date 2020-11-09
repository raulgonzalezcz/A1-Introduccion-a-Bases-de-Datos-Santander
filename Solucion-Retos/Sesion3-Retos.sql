/* Sesión 3
* 04/11/2020
*/

# Reto 1
# Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
USE tienda;
DESCRIBE empleado;
#¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT nombre, apellido_paterno, apellido_materno 
FROM empleado 
WHERE id_puesto IN (
	SELECT id_puesto 
	FROM puesto 
	WHERE salario < 10000);
    
#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total_ventas) AS Min_ventas, max(total_ventas) AS Max_ventas
FROM (
	SELECT clave, id_empleado, count(*) AS total_ventas
	FROM venta
	GROUP BY clave, id_empleado) AS Ventas_articulo
GROUP BY id_empleado;

#¿Cuál es el nombre del puesto de cada empleado?
SELECT e.nombre, e.apellido_paterno, e.apellido_materno,(SELECT nombre FROM puesto WHERE id_puesto = e.id_puesto) as Puesto
FROM empleado AS e;

# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT clave, id_articulo
FROM venta
WHERE id_articulo IN (
	SELECT id_articulo 
	FROM articulo 
	WHERE precio > 5000);

#Reto 2    
#Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
#¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT e.nombre, e.apellido_paterno, v.id_venta
FROM empleado AS e JOIN venta AS v
ON e.id_empleado = v.id_empleado;

#¿Cuál es el nombre de los artículos que se han vendido?
SELECT a.nombre, v.id_venta
FROM articulo AS a JOIN venta AS v
ON a.id_articulo = v.id_articulo
ORDER BY a.nombre;

#¿Cuál es el total de cada venta?
SELECT v.clave, ROUND(SUM(a.precio),3) as Total_venta
FROM venta AS v JOIN articulo AS a
ON v.id_articulo = a.id_articulo
GROUP BY clave;

#Reto3
#Usando la base de datos tienda, define las siguientes vistas que permitan obtener la siguiente información.
USE tienda;
DESCRIBE puesto;
DROP VIEW IF EXISTS tienda.puesto017;

#Obtener el puesto de un empleado.
CREATE VIEW puesto017 AS
	SELECT e.apellido_paterno, e.apellido_materno, e.nombre AS nombre, p.nombre AS puesto
	FROM empleado AS e JOIN puesto AS p
	ON e.id_puesto = p.id_puesto;
SELECT * FROM puesto017;

#Saber qué artículos ha vendido cada empleado.
CREATE VIEW art_emple017 AS
	SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) AS nombre_empleado, a.nombre AS articulo
	FROM venta v 
    JOIN empleado e ON v.id_empleado = e.id_empleado
	JOIN articulo a ON v.id_articulo = a.id_articulo
ORDER BY v.clave;

SELECT * FROM art_emple017
ORDER BY clave DESC;

#Saber qué puesto ha tenido más ventas.
CREATE VIEW puesto_mas_venta017 AS
SELECT count(*) AS total, p.nombre
FROM empleado AS e
JOIN venta AS v ON e.id_empleado = v.id_empleado
JOIN puesto AS p ON e.id_puesto = p.id_puesto
GROUP BY p.nombre
ORDER BY total DESC;

SELECT * FROM puesto_mas_venta017 LIMIT 1;
