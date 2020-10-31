/* Sesión 2 
* 28/10/2020
*/
# Reto1
USE tienda;
DESCRIBE articulo;
DESCRIBE puesto;
-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE "%Pasta%";
-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre LIKE "%Cannelloni%";
-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE "% - %";
-- ¿Qué puestos incluyen la palabra Designer?
SELECT * FROM puesto WHERE nombre LIKE "%Designer%";
-- ¿Qué puestos incluyen la palabra Developer?
SELECT * FROM puesto WHERE nombre LIKE "%Developer%";

#Reto2
USE tienda;
DESCRIBE puesto;
# ¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) FROM puesto; 
# ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT COUNT(*) FROM articulo WHERE nombre LIKE "%Pasta%"; 
# ¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario) as Salario_Min, MAX(salario) as Salario_Max FROM puesto;
# ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT * FROM puesto ORDER BY id_puesto Desc;
SELECT SUM(salario) FROM puesto WHERE id_puesto > (SELECT max(id_puesto) FROM puesto)-5;
SELECT SUM(Cinco_ultimos.salario) FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS Cinco_ultimos;

# Reto3
# ¿Cuántos registros hay por cada uno de los puestos?
SELECT COUNT(*) as Registros, nombre FROM puesto GROUP BY nombre;
# ¿Cuánto dinero se paga en total por puesto?
SELECT SUM(salario) as Total_Pago, nombre FROM puesto GROUP BY nombre;
# ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, COUNT(*) as Total_Ventas FROM venta GROUP BY id_empleado;
# ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, COUNT(*) as Total_Ventas FROM venta GROUP BY id_articulo;
