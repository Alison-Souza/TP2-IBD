DROP DATABASE if exists ibd_tp;
CREATE DATABASE ibd_tp;
use ibd_tp;

DROP TABLE if exists Partido;
CREATE TABLE Partido(
	id INT AUTO_INCREMENT,
	uf CHAR(2),
	sigla VARCHAR(10),
	PRIMARY KEY(id)
);

DROP TABLE if exists Candidato;
CREATE TABLE Candidato(
	cpf CHAR(11),
	idPartido INT,
	numero INT,
	cargo TEXT(100),
	nome TEXT(100),
	PRIMARY KEY(cpf(11)),
	FOREIGN KEY(idPartido) REFERENCES Partido(id)
);

DROP TABLE if exists Doador;
CREATE TABLE Doador(
	id VARCHAR(14),
	nome TEXT(100),
	PRIMARY KEY(id(14))
);

DROP TABLE if exists Partido_Comite;
CREATE TABLE Partido_Comite(
	idPartido INT,
	nome TEXT(100),
	PRIMARY KEY(idPartido,nome(100)),
	FOREIGN KEY(idPartido) REFERENCES Partido(id)
);

DROP TABLE if exists Doacao_Partido;
CREATE TABLE Doacao_Partido(
	doacaoID INT,
	idDoador VARCHAR(14),
	idPartido INT,
	tipoDoDocumento TEXT(100),
	numeroDoDocumento TEXT(100),
	data DATE,
	valor REAL,
	tipo TEXT(100),
	PRIMARY KEY(doacaoID),
	FOREIGN KEY(idPartido) REFERENCES Partido(id),
	FOREIGN KEY(idDoador) REFERENCES Doador(id)
);

DROP TABLE if exists Doacao_Candidato;
CREATE TABLE Doacao_Candidato(
	doacaoID INT,
	idDoador VARCHAR(14),
	cpfCandidato CHAR(11),
	numeroReciboEleitoral TEXT(100),
	numeroDocumento TEXT(100),
	data DATE,
	valor REAL,
	tipo TEXT(100),
	PRIMARY KEY(doacaoID),
	FOREIGN KEY(idDoador) REFERENCES Doador(id),
	FOREIGN KEY(cpfCandidato) REFERENCES Candidato(cpf)
);