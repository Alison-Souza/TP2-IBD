CREATE TABLE Partido(
	uf CHAR(2),
	sigla CHAR(10),
	PRIMARY KEY(uf,sigla)
);

CREATE TABLE Candidato(
	cpf REAL,
	ufPartido CHAR(2),
	siglaPartido CHAR(10),
	numero INT,
	cargo TEXT(100),
	nome TEXT(100),
	PRIMARY KEY(cpf),
	FOREIGN KEY(ufPartido,siglaPartido) REFERENCES Partido(uf,sigla)
);

CREATE TABLE Doador(
	cpf REAL,
	nome TEXT(100),
	PRIMARY KEY(cpf)
);

CREATE TABLE Partido_Comite(
	ufPartido CHAR(2),
	siglaPartido CHAR(10),
	nome TEXT(100),
	PRIMARY KEY(ufPartido,siglaPartido,nome(100)),
	FOREIGN KEY(ufPartido,siglaPartido) REFERENCES Partido(uf,sigla)
);

CREATE TABLE Doacao_Partido(
	doacaoID INT,
	cpfDoador REAL,
	ufPartido CHAR(2),
	siglaPartido CHAR(10),
	tipoDoDocumento TEXT(100),
	numeroDoDocumento TEXT(100),
	data DATE,
	valor REAL,
	tipo TEXT(100),
	PRIMARY KEY(doacaoID),
	FOREIGN KEY(ufPartido,siglaPartido) REFERENCES Partido(uf,sigla),
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