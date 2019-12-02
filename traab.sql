drop database mydb;
CREATE SCHEMA mydb;
USE mydb;

CREATE TABLE IF NOT EXISTS motorista (
    cnh INT NOT NULL,
    PRIMARY KEY (cnh)
);

CREATE TABLE IF NOT EXISTS Pessoa (
    cpf varchar(11) NOT NULL,
    nome VARCHAR(45) NULL,
    PRIMARY KEY (cpf)
);

CREATE TABLE IF NOT EXISTS Gerente (
    Pessoa_cpf varchar(11) NOT NULL,
    PRIMARY KEY (Pessoa_cpf),
    CONSTRAINT fk_Gerente_Pessoa1 FOREIGN KEY (Pessoa_cpf)
        REFERENCES Pessoa (cpf)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS Frete (
    idFrete INT NOT NULL,
    data_entrega DATETIME NULL,
    motorista_cnh INT NOT NULL,
    Gerente_Pessoa_cpf varchar(11) NOT NULL,
    PRIMARY KEY (idFrete),
    CONSTRAINT fk_Frete_motorista FOREIGN KEY (motorista_cnh)
        REFERENCES motorista (cnh)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_Frete_Gerente1 FOREIGN KEY (Gerente_Pessoa_cpf)
        REFERENCES Gerente (Pessoa_cpf)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS Planta (
    codigo INT NOT NULL,
    familia VARCHAR(45) NULL,
    nome VARCHAR(45) NULL,
    uso_tradicional VARCHAR(45) NULL,
    descricao VARCHAR(45) NULL,
    local_plantio VARCHAR(45) NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS Entrega (
    Planta_codigo INT NOT NULL,
    Frete_idFrete INT NOT NULL,
    preco DECIMAL(2) NOT NULL,
    quantidade DECIMAL(3) NOT NULL,
    PRIMARY KEY (Planta_codigo , Frete_idFrete),
    CONSTRAINT fk_Planta_has_Frete_Planta1 FOREIGN KEY (Planta_codigo)
        REFERENCES Planta (codigo)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_Planta_has_Frete_Frete1 FOREIGN KEY (Frete_idFrete)
        REFERENCES Frete (idFrete)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS Cliente (
    numero_itk INT NOT NULL,
    Pessoa_cpf varchar(11) NOT NULL,
    PRIMARY KEY (Pessoa_cpf),
    
    CONSTRAINT fk_Cliente_Pessoa1 FOREIGN KEY (Pessoa_cpf)
        REFERENCES Pessoa (cpf)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS Loja (
    Codigo INT NOT NULL,
     endereco varchar(11) not null,
    Gerente_Pessoa_cpf varchar(11) NOT NULL,
    PRIMARY KEY (Codigo),
    CONSTRAINT fk_Loja_Gerente1 FOREIGN KEY (Gerente_Pessoa_cpf)
        REFERENCES Gerente (Pessoa_cpf)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS Vendedor (
    Pessoa_cpf varchar(11) NOT NULL,
    Loja_Codigo INT NOT NULL,
    PRIMARY KEY (Pessoa_cpf),
    CONSTRAINT fk_Vendedor_Pessoa1 FOREIGN KEY (Pessoa_cpf)
        REFERENCES Pessoa (cpf)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_Vendedor_Loja1 FOREIGN KEY (Loja_Codigo)
        REFERENCES Loja (Codigo)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS Venda (
    Loja_Codigo INT NOT NULL,
    Planta_codigo INT NOT NULL,
    Cliente_Pessoa_cpf varchar(11),
    data DATETIME NULL,
    quantidade_produto DECIMAL(4) NULL,
    preco DECIMAL(2) NULL,
    codigo INT NOT NULL,
    PRIMARY KEY (Loja_Codigo , Planta_codigo , codigo),
    CONSTRAINT fk_Loja_has_Planta_Loja1 FOREIGN KEY (Loja_Codigo)
        REFERENCES Loja (Codigo)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_Loja_has_Planta_Planta1 FOREIGN KEY (Planta_codigo)
        REFERENCES Planta (codigo)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_Vende_Cliente1 FOREIGN KEY (Cliente_Pessoa_cpf)
        REFERENCES Cliente (Pessoa_cpf)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS Estoque (
    Planta_codigo INT NOT NULL,
    Loja_Codigo INT NOT NULL,
    quantidade DECIMAL(4) NULL,
    preco DECIMAL(2) NULL,
    PRIMARY KEY (Loja_Codigo , Planta_codigo),
    CONSTRAINT fk_Estoque_Planta1 FOREIGN KEY (Planta_codigo)
        REFERENCES Planta (codigo)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_Estoque_Loja1 FOREIGN KEY (Loja_Codigo)
        REFERENCES Loja (Codigo)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);	