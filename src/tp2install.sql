drop database if exists ibd_tp;
create database ibd_tp;
use ibd_tp;

drop table if exists Partido;
create table Partido(
  uf CHAR(2),
  sigla VARCHAR(10),
  PRIMARY KEY(uf,sigla)
);

drop table if exists Candidato;
create table Candidato(
  cpf CHAR(11),
  ufPartido CHAR(2),
  siglaPartido VARCHAR(10),
  numero INT,
  cargo TEXT(100),
  nome TEXT(100),
  PRIMARY KEY(cpf),
  FOREIGN KEY(ufPartido,siglaPartido) REFERENCES Partido(uf,sigla)
);

drop table if exists Doador;
create table Doador(
  id VARCHAR(14),
  nome TEXT(100),
  PRIMARY KEY(id)
);

drop table if exists Partido_Comite;
create table Partido_Comite(
  ufPartido CHAR(2),
  siglaPartido CHAR(10),
  nome TEXT(100),
  PRIMARY KEY(ufPartido,siglaPartido,nome(100)),
  FOREIGN KEY(ufPartido,siglaPartido) REFERENCES Partido(uf,sigla)
);

drop table if exists Doacao_Partido;
create table Doacao_Partido(
  doacaoID INT,
  cpfDoador VARCHAR(14),
  ufPartido CHAR(2),
  siglaPartido CHAR(10),
  tipoDoDocumento TEXT(100),
  numeroDoDocumento TEXT(100),
  data DATE,
  valor REAL,
  tipo TEXT(100),
  PRIMARY KEY(doacaoID),
  FOREIGN KEY(ufPartido,siglaPartido) REFERENCES Partido(uf,sigla),
  FOREIGN KEY(cpfDoador) REFERENCES Doador(id)
);

drop table if exists Doacao_Candidato;
create table Doacao_Candidato(
  doacaoID INT,
  cpfDoador VARCHAR(14),
  cpfCandidato CHAR(11),
  numeroReciboEleitoral TEXT(100),
  numeroDocumento TEXT(100),
  data DATE,
  valor REAL,
  tipo TEXT(100),
  PRIMARY KEY(doacaoID),
  FOREIGN KEY(cpfDoador) REFERENCES Doador(id),
  FOREIGN KEY(cpfCandidato) REFERENCES Candidato(cpf)
);