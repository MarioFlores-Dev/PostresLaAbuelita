--Creacion de Base de datos por si no existiera
CREATE DATABASE db_Postreslaabuelita
--Table Usuarios
CREATE TABLE tbl_users(
     `id_users` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL,
    `user` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    `created_date` DATETIME NULL,
    PRIMARY KEY (`id_users`)
)