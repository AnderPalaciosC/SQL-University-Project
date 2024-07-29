-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: universidad
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `id_calificacion` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  `calificacion` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_calificacion`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`),
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,1,1,85.50),(2,2,1,90.00),(3,3,1,88.00),(4,1,2,92.00),(5,2,2,78.50);
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(100) DEFAULT NULL,
  `id_profesor` int DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Sistemas de Bases de Datos',1),(2,'Álgebra',2);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'Alicia','Pérez','2000-01-15'),(2,'Roberto','García','1999-05-22'),(3,'Ander','Palacios','2000-04-25');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `id_profesor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Juan','Díaz','Informática'),(2,'Ana','Ruiz','Matemáticas');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-29 16:33:01


-- Ejercicios de la tabla
-- Promedio de calificaciones dado por cada profesor
SELECT p.nombre, p.apellido, AVG(c.calificacion) AS promedio_calificaciones
FROM Profesores p
JOIN Cursos cu ON p.id_profesor = cu.id_profesor
JOIN Calificaciones c ON cu.id_curso = c.id_curso
GROUP BY p.id_profesor;

-- Mejores calificaciones de cada estudiante
SELECT e.nombre, e.apellido, MAX(c.calificacion) AS mejor_calificacion
FROM Estudiantes e
JOIN Calificaciones c ON e.id_estudiante = c.id_estudiante
GROUP BY e.id_estudiante;

-- Ordenar estudiantes por los cursos en los que están inscritos
SELECT e.nombre, e.apellido, cu.nombre_curso
FROM Estudiantes e
JOIN Calificaciones c ON e.id_estudiante = c.id_estudiante
JOIN Cursos cu ON c.id_curso = cu.id_curso
ORDER BY e.apellido, e.nombre, cu.nombre_curso;

-- Resumen de cursos y sus promedios, ordenados por el curso más dificil
SELECT cu.nombre_curso, AVG(c.calificacion) AS promedio_calificaciones
FROM Cursos cu
JOIN Calificaciones c ON cu.id_curso = c.id_curso
GROUP BY cu.id_curso
ORDER BY promedio_calificaciones ASC;

-- Estudiante y profesor con más cursos en común
  -- Número máximo de cursos en común
SELECT MAX(cursos_en_comun) AS max_cursos_en_comun
FROM (
    SELECT COUNT(*) AS cursos_en_comun
    FROM Estudiantes e
    JOIN Calificaciones c ON e.id_estudiante = c.id_estudiante
    JOIN Cursos cu ON c.id_curso = cu.id_curso
    JOIN Profesores p ON cu.id_profesor = p.id_profesor
    GROUP BY e.id_estudiante, p.id_profesor
) AS subquery;

  -- número máximo de cursos en común para encontrar todos los estudiantes y profesores con ese número
SELECT e.nombre AS nombre_estudiante, e.apellido AS apellido_estudiante, 
       p.nombre AS nombre_profesor, p.apellido AS apellido_profesor, 
       COUNT(*) AS cursos_en_comun
FROM Estudiantes e
JOIN Calificaciones c ON e.id_estudiante = c.id_estudiante
JOIN Cursos cu ON c.id_curso = cu.id_curso
JOIN Profesores p ON cu.id_profesor = p.id_profesor
GROUP BY e.id_estudiante, p.id_profesor
HAVING cursos_en_comun = (
    SELECT MAX(cursos_en_comun)
    FROM (
        SELECT COUNT(*) AS cursos_en_comun
        FROM Estudiantes e
        JOIN Calificaciones c ON e.id_estudiante = c.id_estudiante
        JOIN Cursos cu ON c.id_curso = cu.id_curso
        JOIN Profesores p ON cu.id_profesor = p.id_profesor
        GROUP BY e.id_estudiante, p.id_profesor
    ) AS subquery
);
