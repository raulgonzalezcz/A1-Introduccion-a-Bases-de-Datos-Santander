/* Sesión 7
* 23/11/2020
*/
CREATE DATABASE IF NOT EXISTS bedu;
USE bedu;

DROP TABLE IF EXISTS ratings;

CREATE TABLE IF NOT EXISTS users(
id INT PRIMARY KEY,
genero VARCHAR(1),
edad INT,
ocupacion INT,
cp VARCHAR(20)
);

# Reto1
# Definir los campos y tipos de datos para la tabla movies haciendo uso de los archivos movies.dat y README.
# Crear la tabla movies (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos).
CREATE TABLE IF NOT EXISTS movies (
   id INT PRIMARY KEY, 
   titulo VARCHAR(100), 
   genero VARCHAR(100)
); 
# Definir los campos y tipos de datos para la tabla ratings haciendo uso de los archivos ratings.dat y README.
# Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)
CREATE TABLE IF NOT EXISTS ratings (
   id INT PRIMARY KEY AUTO_INCREMENT,
   id_usuario INT, 
   id_pelicula INT, 
   calificacion INT, 
   time_stamp BIGINT,
   FOREIGN KEY (id_usuario) REFERENCES users(id),
   FOREIGN KEY (id_pelicula) REFERENCES movies(id)
);

# Reto 2 y Reto 3. LLenar bases de datos al importar CSV
