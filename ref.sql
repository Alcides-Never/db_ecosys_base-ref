CREATE DATABASE db_ecosystem;

USE db_ecosystem;

CREATE TABLE Usuario(
	Id BINARY(16) NOT NULL,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Senha VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
	Genero CHAR(2),
    Cpf VARCHAR(20),
    cnpj VARCHAR(20),
    id_tipousuario BINARY(16) NOT NULL,
    id_endereco BINARY(16),
    PRIMARY KEY (id),
    FOREIGN KEY (id_tipousuario) REFERENCES tb_tipousuario(id),
    FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id)
);	

CREATE TABLE tb_categoria(
	id BINARY(16) NOT NULL,
    nome VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);	



CREATE TABLE tb_produto(
	id BINARY(16) NOT NULL,
    nome VARCHAR(100) NOT NULL,
	quantidade TINYINT NOT NULL,
    id_categoria BINARY(16) NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categoria(id)
);	

CREATE TABLE tb_anuncio(
	id BINARY(16) NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP,
    data_retirada VARCHAR(100),
    periodo_retirada VARCHAR(100),
    status_anuncio VARCHAR(255),
	url_imagem VARCHAR(100),
    id_usuario BINARY(16) NOT NULL,
    id_produto BINARY(16) NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id),
    FOREIGN KEY (id_produto) REFERENCES tb_produto(id)
);	

CREATE TABLE tb_coleta(
	id BINARY(16) NOT NULL,
    data_cadastro TIMESTAMP,
    data_retirada TIMESTAMP,
    status_coleta VARCHAR(255),
    observacao VARCHAR(255),
    id_usuario BINARY(16) NOT NULL,
    id_anuncio BINARY(16) NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id),
    FOREIGN KEY (id_anuncio) REFERENCES tb_anuncio(id)
);	

CREATE TABLE tb_endereco(
    id BINARY(16) NOT NULL,
    logradouro VARCHAR(255) ,
    numero VARCHAR(30) ,
    bairro VARCHAR(100) ,
    cidade VARCHAR(100) ,
    estado VARCHAR(5) ,
    cep VARCHAR(10),
    PRIMARY KEY (id)
);

CREATE TABLE tb_tipousuario(
	id BINARY(16) NOT NULL,
    tipo_usuario TINYINT NOT NULL,
	PRIMARY KEY (id)
);		

