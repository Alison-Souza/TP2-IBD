CREATE TABLE Partido(
	id INT,
	uf CHAR(2),
	sigla CHAR(10),
	PRIMARY KEY(id)
);

CREATE TABLE Candidato(
	cpf REAL,
	idPartido INT,
	numero INT,
	cargo TEXT(100),
	nome TEXT(100),
	PRIMARY KEY(cpf),
	FOREIGN KEY(idPartido) REFERENCES Partido(id)
);

CREATE TABLE Doador(
	cpf REAL,
	nome TEXT(100),
	PRIMARY KEY(cpf)
);

CREATE TABLE Partido_Comite(
	idPartido INT,
	nome TEXT(100),
	PRIMARY KEY(idPartido, nome(100)),
	FOREIGN KEY(idPartido) REFERENCES Partido(id)
);

CREATE TABLE Doacao_Partido(
	doacaoID INT,
	cpfDoador REAL,
	idPartido INT,
	tipoDoDocumento TEXT(100),
	numeroDoDocumento TEXT(100),
	data DATE,
	valor REAL,
	tipo TEXT(100),
	PRIMARY KEY(doacaoID),
	FOREIGN KEY(idPartido) REFERENCES Partido(id),
	FOREIGN KEY(cpfDoador) REFERENCES Doador(cpf)
);
	
CREATE TABLE Doacao_Candidato(
	doacaoID INT,
	cpfDoador REAL,
	cpfCandidato REAL,
	numeroReciboEleitoral TEXT(100),
	numeroDocumento TEXT(100),
	data DATE,
	valor REAL,
	tipo TEXT(100),
	PRIMARY KEY(doacaoID),
	FOREIGN KEY(cpfDoador) REFERENCES Doador(cpf),
	FOREIGN KEY(cpfCandidato) REFERENCES Candidato(cpf)
);