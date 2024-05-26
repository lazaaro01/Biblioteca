CREATE DATABASE BibliotecaMunicipal;
GO

USE BibliotecaMunicipal;
GO

CREATE TABLE tbCliente (
    CPF CHAR(11) PRIMARY KEY,
    NomeDoTitular VARCHAR(50),
    CEP CHAR(8),
    DataDeNascimento DATE,
    Telefone VARCHAR(11),
    inadimplente TINYINT NULL
);
GO

CREATE TABLE tbAutor (
    Autor_ID VARCHAR (3) PRIMARY KEY,
    PrimeiroNome VARCHAR(23),
    Sobrenome VARCHAR(30)
);
GO

CREATE TABLE tbCategoria (
    Categoria_ID VARCHAR (3) PRIMARY KEY,
    nome_Categoria VARCHAR(50) UNIQUE
);
GO

CREATE TABLE tbLivro (
    ISBN VARCHAR(13) PRIMARY KEY,
    Nome_Livro VARCHAR(150),
    Ano_Publicacao CHAR(4),
    Categoria_ID VARCHAR(3),
    Autor_ID VARCHAR(3),
    FOREIGN KEY (Categoria_ID) REFERENCES tbCategoria(Categoria_ID),
    FOREIGN KEY (Autor_ID) REFERENCES tbAutor(Autor_ID)
);
GO

CREATE TABLE tbLivrosEmprestados (
    Emprestimo_ID INT IDENTITY(1,1) PRIMARY KEY,
    CPF CHAR(11),
    ISBN VARCHAR(13),
    Data_Retirada DATE,
    Data_Devolucao DATE,
    FOREIGN KEY (CPF) REFERENCES tbCliente(CPF),
    FOREIGN KEY (ISBN) REFERENCES tbLivro(ISBN)
);
GO

CREATE TABLE tbFuncionarios (
    ID_Crachar VARCHAR(3) PRIMARY KEY,
    Nome_Identificacao VARCHAR(20),
    Horario_Estabelecimento VARCHAR(25),
    Secao VARCHAR(10),
    Cargo VARCHAR(25)
);
GO

CREATE TABLE tbRH_Funcionarios (
    CPF_Empregado VARCHAR(11) PRIMARY KEY,
    ID_Crachar VARCHAR(3),
    Nome VARCHAR(40),
    Email VARCHAR(40),
    Telefone VARCHAR(20),
    CEP VARCHAR(8),
	Sexo CHAR(1) NULL,
    Data_Nascimento DATE,
	Estado_Civil VARCHAR(8),
    Data_Contratacao DATE,
    Avaliacoes_Desempenho TEXT NULL,
    Advertencias TEXT NULL,
    Faltas VARCHAR(2) NULL,
    Carga_Horaria TIME,
    Salario DECIMAL(4, 2),
    FOREIGN KEY (ID_Crachar) REFERENCES tbFuncionarios(ID_Crachar)
);
GO