	-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`motorista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`motorista` (
  `cnh` INT NOT NULL,
  PRIMARY KEY (`cnh`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gerente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gerente` (
  `Pessoa_cpf` INT NOT NULL,
  PRIMARY KEY (`Pessoa_cpf`),
  CONSTRAINT `fk_Gerente_Pessoa1`
    FOREIGN KEY (`Pessoa_cpf`)
    REFERENCES `mydb`.`Pessoa` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Frete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Frete` (
  `idFrete` INT NOT NULL,
  `data_entrega` DATETIME NULL,
  `motorista_cnh` INT NOT NULL,
  `Gerente_Pessoa_cpf` INT NOT NULL,
  PRIMARY KEY (`idFrete`),
  INDEX `fk_Frete_motorista_idx` (`motorista_cnh` ASC),
  INDEX `fk_Frete_Gerente1_idx` (`Gerente_Pessoa_cpf` ASC),
  CONSTRAINT `fk_Frete_motorista`
    FOREIGN KEY (`motorista_cnh`)
    REFERENCES `mydb`.`motorista` (`cnh`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Frete_Gerente1`
    FOREIGN KEY (`Gerente_Pessoa_cpf`)
    REFERENCES `mydb`.`Gerente` (`Pessoa_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Planta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Planta` (
  `codigo` INT NOT NULL,
  `familia` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `uso_tradicional` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `local_plantio` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entrega` (
  `Planta_codigo` INT NOT NULL,
  `Frete_idFrete` INT NOT NULL,
  `preco` DECIMAL(2) NOT NULL,
  `quantidade` DECIMAL(3) NOT NULL,
  PRIMARY KEY (`Planta_codigo`, `Frete_idFrete`),
  INDEX `fk_Planta_has_Frete_Frete1_idx` (`Frete_idFrete` ASC),
  INDEX `fk_Planta_has_Frete_Planta1_idx` (`Planta_codigo` ASC),
  CONSTRAINT `fk_Planta_has_Frete_Planta1`
    FOREIGN KEY (`Planta_codigo`)
    REFERENCES `mydb`.`Planta` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Planta_has_Frete_Frete1`
    FOREIGN KEY (`Frete_idFrete`)
    REFERENCES `mydb`.`Frete` (`idFrete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `numero_itk` INT NOT NULL,
  `Pessoa_cpf` INT NOT NULL,
  PRIMARY KEY (`numero_itk`, `Pessoa_cpf`),
  INDEX `fk_Cliente_Pessoa1_idx` (`Pessoa_cpf` ASC),
  CONSTRAINT `fk_Cliente_Pessoa1`
    FOREIGN KEY (`Pessoa_cpf`)
    REFERENCES `mydb`.`Pessoa` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loja` (
  `Codigo` INT NOT NULL,
  `Gerente_Pessoa_cpf` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Loja_Gerente1_idx` (`Gerente_Pessoa_cpf` ASC),
  CONSTRAINT `fk_Loja_Gerente1`
    FOREIGN KEY (`Gerente_Pessoa_cpf`)
    REFERENCES `mydb`.`Gerente` (`Pessoa_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `Pessoa_cpf` INT NOT NULL,
  `Loja_Codigo` INT NOT NULL,
  PRIMARY KEY (`Pessoa_cpf`),
  INDEX `fk_Vendedor_Loja1_idx` (`Loja_Codigo` ASC),
  CONSTRAINT `fk_Vendedor_Pessoa1`
    FOREIGN KEY (`Pessoa_cpf`)
    REFERENCES `mydb`.`Pessoa` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendedor_Loja1`
    FOREIGN KEY (`Loja_Codigo`)
    REFERENCES `mydb`.`Loja` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `Loja_Codigo` INT NOT NULL,
  `Planta_codigo` INT NOT NULL,
  `Cliente_numero_itk` INT NULL,
  `data` DATETIME NULL,
  `quantidade_produto` DECIMAL(4) NULL,
  `preco` DECIMAL(2) NULL,
  `codigo` INT NOT NULL,
  `Vendedor_Pessoa_cpf` INT NOT NULL,
  PRIMARY KEY (`Loja_Codigo`, `Planta_codigo`, `codigo`),
  INDEX `fk_Loja_has_Planta_Planta1_idx` (`Planta_codigo` ASC),
  INDEX `fk_Loja_has_Planta_Loja1_idx` (`Loja_Codigo` ASC),
  INDEX `fk_Vende_Cliente1_idx` (`Cliente_numero_itk` ASC),
  INDEX `fk_Venda_Vendedor1_idx` (`Vendedor_Pessoa_cpf` ASC),
  CONSTRAINT `fk_Loja_has_Planta_Loja1`
    FOREIGN KEY (`Loja_Codigo`)
    REFERENCES `mydb`.`Loja` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loja_has_Planta_Planta1`
    FOREIGN KEY (`Planta_codigo`)
    REFERENCES `mydb`.`Planta` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vende_Cliente1`
    FOREIGN KEY (`Cliente_numero_itk`)
    REFERENCES `mydb`.`Cliente` (`numero_itk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Vendedor1`
    FOREIGN KEY (`Vendedor_Pessoa_cpf`)
    REFERENCES `mydb`.`Vendedor` (`Pessoa_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `Planta_codigo` INT NOT NULL,
  `Loja_Codigo` INT NOT NULL,
  `quantidade` DECIMAL(4) NULL,
  `preco` DECIMAL(2) NULL,
  INDEX `fk_Estoque_Planta1_idx` (`Planta_codigo` ASC),
  PRIMARY KEY (`Loja_Codigo`, `Planta_codigo`),
  CONSTRAINT `fk_Estoque_Planta1`
    FOREIGN KEY (`Planta_codigo`)
    REFERENCES `mydb`.`Planta` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estoque_Loja1`
    FOREIGN KEY (`Loja_Codigo`)
    REFERENCES `mydb`.`Loja` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
