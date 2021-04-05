-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_users` (
    `id_users` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL,
    `user` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    `created_date` DATETIME NULL,
    PRIMARY KEY (`id_users`))
ENGINE = InnoDB
-- Tabla de Categorias
CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_categories` (
    `id_category` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL,
    PRIMARY KEY (`id_category`))
ENGINE = InnoDB
-- Tabla de Consumidores
CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_customers` (
    `id_customer` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(45) NULL,
    `last_name` VARCHAR(45) NULL,
    `direction` VARCHAR(250) NULL,
    `number_phone` INT NULL,
    PRIMARY KEY (`id_customer`))
ENGINE = InnoDB
-- Tabla de Productos
CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_products` (
    `id_product` INT NOT NULL AUTO_INCREMENT,
    `tbl_categories_id_category` INT NOT NULL,
    `name` VARCHAR(45) NULL,
    `price` INT NULL,
    PRIMARY KEY (`id_product`, `tbl_categories_id_category`),
    INDEX `fk_tbl_products_tbl_categories1_idx` (`tbl_categories_id_category` ASC) ,
    CONSTRAINT `fk_tbl_products_tbl_categories1`
    FOREIGN KEY (`tbl_categories_id_category`)
    REFERENCES `db_postreslaabuelita`.`tbl_categories` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
-- Tabla de Ventas
CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_sale` (
    `id_sale` INT NOT NULL AUTO_INCREMENT,
    `tbl_customers_id_customer` INT NOT NULL,
    `sale_sate` DATETIME NULL,
    PRIMARY KEY (`id_sale`, `tbl_customers_id_customer`),
    INDEX `fk_tbl_sale_tbl_customers1_idx` (`tbl_customers_id_customer` ASC) ,
    CONSTRAINT `fk_tbl_sale_tbl_customers1`
    FOREIGN KEY (`tbl_customers_id_customer`)
    REFERENCES `db_postreslaabuelita`.`tbl_customers` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
-- Tabla Cruzada de Ventas y Productos
CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_sale_has_tbl_products` (
    `tbl_sale_id_sale` INT NOT NULL,
    `tbl_products_id_product` INT NOT NULL,
    `unit_price` INT NULL,
    `quantity` INT NULL,
    PRIMARY KEY (`tbl_sale_id_sale`, `tbl_products_id_product`),
    INDEX `fk_tbl_sale_has_tbl_products_tbl_products1_idx` (`tbl_products_id_product` ASC) ,
    INDEX `fk_tbl_sale_has_tbl_products_tbl_sale1_idx` (`tbl_sale_id_sale` ASC) ,
    CONSTRAINT `fk_tbl_sale_has_tbl_products_tbl_sale1`
    FOREIGN KEY (`tbl_sale_id_sale`)
    REFERENCES `db_postreslaabuelita`.`tbl_sale` (`id_sale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_tbl_sale_has_tbl_products_tbl_products1`
    FOREIGN KEY (`tbl_products_id_product`)
    REFERENCES `db_postreslaabuelita`.`tbl_products` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
-- ---------------Implementación de tablas 1/02/21-----------
-- ---------Artículos para producción-------------
CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_articlesForProdcuction` (
    `id_articlesForProdcuction` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL,
    `quantity` INT NULL,
    `price` DOUBLE NULL,
    PRIMARY KEY (`id_articlesForProdcuction`))
ENGINE = InnoDB
-- ---------------------Producciones----------------
    CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_productions` (
    `id_productions` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(45) NULL,
    `sales` DOUBLE NULL,
    `invertion` DOUBLE NULL,
    `earnings` DOUBLE NULL,
    `date` DATETIME NULL,
    PRIMARY KEY (`id_productions`))
ENGINE = InnoDB
-- --------------Tabla Cruzada Producciones y articulos---------------
CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_productions_has_tbl_articlesForProdcuction` (
    `tbl_productions_id_productions` INT NOT NULL,
    `tbl_articlesForProdcuction_id_articlesForProdcuction` INT NOT NULL,
    PRIMARY KEY (`tbl_productions_id_productions`, `tbl_articlesForProdcuction_id_articlesForProdcuction`),
    INDEX `fk_tbl_productions_has_tbl_articlesForProdcuction_tbl_artic_idx` (`tbl_articlesForProdcuction_id_articlesForProdcuction` ASC) ,
    INDEX `fk_tbl_productions_has_tbl_articlesForProdcuction_tbl_produ_idx` (`tbl_productions_id_productions` ASC) ,
    CONSTRAINT `fk_tbl_productions_has_tbl_articlesForProdcuction_tbl_product1`
        FOREIGN KEY (`tbl_productions_id_productions`)
        REFERENCES `db_postreslaabuelita`.`tbl_productions` (`id_productions`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_tbl_productions_has_tbl_articlesForProdcuction_tbl_article1`
        FOREIGN KEY (`tbl_articlesForProdcuction_id_articlesForProdcuction`)
        REFERENCES `db_postreslaabuelita`.`tbl_articlesForProdcuction` (`id_articlesForProdcuction`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB
-- ------------Tabla cruzada entre producciones y productos---------------
    CREATE TABLE IF NOT EXISTS `db_postreslaabuelita`.`tbl_productions_has_tbl_products` (
    `tbl_productions_id_productions` INT NOT NULL,
    `tbl_products_id_product` INT NOT NULL,
    PRIMARY KEY (`tbl_productions_id_productions`, `tbl_products_id_product`),
    INDEX `fk_tbl_productions_has_tbl_products_tbl_products1_idx` (`tbl_products_id_product` ASC),
    INDEX `fk_tbl_productions_has_tbl_products_tbl_productions1_idx` (`tbl_productions_id_productions` ASC),
    CONSTRAINT `fk_tbl_productions_has_tbl_products_tbl_productions1`
        FOREIGN KEY (`tbl_productions_id_productions`)
        REFERENCES `db_postreslaabuelita`.`tbl_productions` (`id_productions`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_tbl_productions_has_tbl_products_tbl_products1`
        FOREIGN KEY (`tbl_products_id_product`)
        REFERENCES `db_postreslaabuelita`.`tbl_products` (`id_product`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB



-- Apartado de producciones
CREATE TABLE tbl_customers(
	id INT AUTO_INCREMENT NOT null PRIMARY KEY,
    nombre varchar (50),
    apellido varchar(50),
    numeroTelefono int,
    direccion varchar(250)
)

CREATE TABLE tbl_products(
	id INT AUTO_INCREMENT NOT null PRIMARY KEY,
    nombre varchar (50),
    precio float,
)

-- Tabla de ordenes
CREATE TABLE tbl_orders(
    id_order int PRIMARY key AUTO_INCREMENT,
    id_customer int,
    id_product int,
    fechaEntrega DATETIME,
    cantidad int,
    monto   float,
    FOREIGN key (id_customer) REFERENCES tbl_customers(id),
    FOREIGN KEY (id_product) REFERENCES tbl_products(id)
);