-- DDL - CRIA A ESTRUTURA

CREATE DATABASE RpgOnlineBD

USE RpgOnlineBD

CREATE TABLE Usuarios(
	UsuarioID INT PRIMARY KEY IDENTITY
	,Email VARCHAR(100) UNIQUE NOT NULL
	,Senha VARCHAR(255) NOT NULL
)

CREATE TABLE Classes(
	ClasseID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(50) UNIQUE NOT NULL
	,Descricao VARCHAR(400)
)

CREATE TABLE Personagens(
	PersonagemID INT PRIMARY KEY IDENTITY
	,NomePersonagem VARCHAR(15) UNIQUE NOT NULL
	,UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID)
	,ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
)

CREATE TABLE Habilidades(
	HabilidadeID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
	,HabilidadeID INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
)

-- DML - COLOCAR DADOS
INSERT INTO Usuarios VALUES ('ayla@gmail.com','123445')
INSERT INTO Classes VALUES ('Feiticeiro','Solta poderzinho')
INSERT INTO Usuarios VALUES ('floquinho@gmail.com',HASHBYTES('SHA2_512','12344567'))
INSERT INTO Habilidades VALUES ('Cura acelerado'),('Magia de realidade paralela'),('Levitação'),('Luz de ataque')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseID) VALUES ('MoonLight',1,1)
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseID) VALUES ('IceCream',2,1)
INSERT INTO ClasseHabilidade (ClasseID, HabilidadeID) VALUES (1,1),(1,2),(1,3),(1,4)

UPDATE Usuarios
SET Senha = '654321' WHERE UsuarioID = 1

-- DQL - CONSULTAS

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade

SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseID = Classes.ClasseID

--Exemplo JOIN

CREATE DATABASE ExemplosJOIN

USE ExemplosJOIN

--DDL
CREATE TABLE TabelaA(
	Nome VARCHAR (50) NULL
)
CREATE TABLE TabelaB(
	Nome VARCHAR (50) NULL
)

--DML

INSERT INTO TabelaA VALUES ('Rayane')
INSERT INTO TabelaA VALUES ('Lua')
INSERT INTO TabelaA VALUES ('Jake')
INSERT INTO TabelaA VALUES ('Nikki')

INSERT INTO TabelaB VALUES ('Ellie'), ('Eren'), ('Jake'), ('Nikki')

--DQL

SELECT * FROM TabelaA
SELECT * FROM TabelaB

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
INNER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
LEFT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
RIGHT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
FULL OUTER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome