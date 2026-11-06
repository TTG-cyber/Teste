CREATE DATABASE IF NOT EXISTS gestao_torneios; 
USE gestao_torneios; 

-- Tabela Equipas 
CREATE TABLE Equipas ( 
ID_Equipa INT AUTO_INCREMENT PRIMARY KEY, 
Nome_Equipa VARCHAR(100) NOT NULL, 
Data_Criacao DATE NOT NULL 
); 

-- Tabela Jogadores 
CREATE TABLE Jogadores ( 
ID_Jogador INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Nickname VARCHAR(50) NOT NULL, 
Data_Nascimento DATE NOT NULL, 
ID_Equipa INT NOT NULL, 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa) 
); 

-- Tabela Torneios 
CREATE TABLE Torneios ( 
ID_Torneio INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Data_Inicio DATE NOT NULL, 
Premio_Monetario DECIMAL(10,2) NOT NULL, 
CHECK (Premio_Monetario >= 0) 
);

-- Tabela Participacoes 
CREATE TABLE Participacoes ( 
ID_Equipa INT NOT NULL, 
ID_Torneio INT NOT NULL, 
PRIMARY KEY (ID_Equipa, ID_Torneio), 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa), 
FOREIGN KEY (ID_Torneio) 
REFERENCES Torneios(ID_Torneio) 
);

INSERT INTO  Equipas (Nome_Equipa,Data_Criacao) values 
('TOTS','01-11-2026'),
('Bots','02-11-2026');

INSERT INTO  Jogadores (Nome,Nickname,Data_Nascimento) values 
('Junior','Juninho matador','24-01-1999'),
('ney','KAKA','24-01-0001');

INSERT INTO  Torneios (Nome,Data_Inicio,Premio_Monetario) values 
('copa paraiba','05-11-2026','Denise mais 5 mil'),
('copa rio','07-11-2026','18 mil'),
('copa minas','09-11-2026','89 mil');

INSERT INTO  Participacoes (ID_Equipa,ID_Torneio) values 
('1','2'),
('2','4'),
('4','7'),
('6','5');