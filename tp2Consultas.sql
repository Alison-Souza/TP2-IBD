-- INSERTIONS PARA TESTES:

-- As duas insertions abaixo tem o mesmo significado:
-- INSERT INTO Partido(uf, sigla) VALUES ('MG', 'PT');
-- INSERT INTO Partido VALUES ('MG', 'PT');

INSERT INTO Partido VALUES ('MG', 'PT');
INSERT INTO Partido VALUES ('MG', 'PSDB');
INSERT INTO Partido VALUES ('MG', 'PMDB');
INSERT INTO Partido VALUES ('SP', 'PT');
INSERT INTO Partido VALUES ('SP', 'PSDB');
INSERT INTO Partido VALUES ('SP', 'PMDB');

INSERT INTO Candidato VALUES (11111111111, 'SP', 'PMDB', 15, 'Presidente', 'Michel Temer');
INSERT INTO Candidato VALUES (22222222222, 'MG', 'PSDB', 45, 'Senador', 'Aécio Neves');
INSERT INTO Candidato VALUES (33333333333, 'SP', 'PMDB', 15, 'Senador', 'Marta Suplicy');
INSERT INTO Candidato VALUES (44444444444, 'MG', 'PT', 13, 'Governador', 'Fernando Pimentel');
INSERT INTO Candidato VALUES (55555555555, 'MG', 'PSDB', 45, 'Senador', 'Antonio Anastasia');
INSERT INTO Candidato VALUES (66666666666, 'MG', 'PT', 1333, 'Deputado Federal', 'Patrus Ananias');
INSERT INTO Candidato VALUES (77777777777, 'SP', 'PSDB', 45, 'Senador', 'José Serra');
INSERT INTO Candidato VALUES (88888888888, 'SP', 'PSDB', 45, 'Governador', 'João Dória');
INSERT INTO Candidato VALUES (99999999999, 'SP', 'PT', 13, 'Dono do Triplex', 'Luiz Inácio Lula da Silva');

INSERT INTO Doador VALUES (12345678900, 'Marcelo Odebrecht');
INSERT INTO Doador VALUES (98765432100, 'Joesley Batista');
INSERT INTO Doador VALUES (11223344556, 'Antonio de Queiroz Galvão');

INSERT INTO Partido_Comite VALUES ('MG', 'PT', 'Comite PT-MG');
INSERT INTO Partido_Comite VALUES ('SP', 'PSDB', 'Comite PSDB-SP');
INSERT INTO Partido_Comite VALUES ('SP', 'PMDB', 'Comite PMDB-SP');
INSERT INTO Partido_Comite VALUES ('MG', 'PMDB', 'Comite PMDB-MG');

INSERT INTO Doacao_Partido VALUES (1, 12345678900, 'SP', 'PT', '.txt', '123', '2014-06-12', 100000000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (2, 12345678900, 'SP', 'PT', '.txt', '124', '2014-06-15', 200000000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (3, 98765432100, 'MG', 'PSDB', '.txt', '321', '2014-09-25', 150000000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (4, 11223344556, 'MG', 'PMDB', '.txt', '456', '2014-08-06', 120000000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (5, 11223344556, 'SP', 'PMDB', '.txt', '891', '2014-08-16', 140000000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (6, 98765432100, 'SP', 'PMDB', '.txt', '641', '2014-09-27', 170000000, 'caixa 1');

INSERT INTO Doacao_Candidato VALUES (10, 12345678900, 11111111111, '12345', '987', '2014-05-18', 15000000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (11, 12345678900, 22222222222, '12346', '988', '2014-05-20', 20000000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (12, 98765432100, 33333333333, '12347', '989', '2014-05-21', 12000000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (13, 98765432100, 44444444444, '12348', '990', '2014-05-22', 13000000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (14, 11223344556, 55555555555, '12349', '991', '2014-05-23', 14000000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (15, 11223344556, 66666666666, '12350', '992', '2014-05-24', 18000000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (16, 12345678900, 77777777777, '12351', '993', '2014-05-25', 17000000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (17, 11223344556, 88888888888, '12352', '994', '2014-05-26', 21000000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (18, 98765432100, 99999999999, '12353', '995', '2014-05-27', 50000000, 'caixa 2');

-- ------------------------------------------------------------------- --
-- ------------------------------------------------------------------- --
-- ------------------------------------------------------------------- --
-- ------------------------------------------------------------------- --

-- CONSULTAS:

-- Básicas, apenas para ver as tabelas:

SELECT * FROM Partido;
SELECT * FROM Candidato;
SELECT * FROM Doador;
SELECT * FROM Partido_Comite;
SELECT * FROM Doacao_Partido;
SELECT * FROM Doacao_Candidato;


-- ------------------------------- --
-- 2 envolvendo seleção e projeção:
-- ------------------------------- --

-- Lista dos candidatos de MG.
SELECT nome, siglaPartido, cargo
FROM Candidato
WHERE ufPartido = 'MG'
ORDER BY nome

-- Lista das doações em SP.
SELECT siglaPartido, data, valor
FROM Doacao_Partido
WHERE ufPartido = 'SP'
ORDER BY data


-- ---------------------------------------------- --
-- 3 consultas envolvendo a junção de duas relações:
-- ---------------------------------------------- --

-- Doadores que fizeram doações a algum partido.
SELECT Doador.nome, Doacao_Partido.siglaPartido, Doacao_Partido.ufPartido, Doacao_Partido.valor, Doacao_Partido.tipo
FROM Doador JOIN Doacao_Partido
WHERE Doador.cpf = Doacao_Partido.cpfDoador
ORDER BY Doacao_Partido.valor;

-- Candidatos que seus partidos tem comitês.
SELECT Candidato.nome, Candidato.siglaPartido, Candidato.ufPartido, Partido_Comite.nome
FROM Candidato JOIN Partido_Comite
WHERE Candidato.siglaPartido = Partido_Comite.siglaPartido AND
	  Candidato.ufPartido = Partido_Comite.ufPartido

-- Lista dos comitês que receberam doações.
SELECT Partido_Comite.nome, Doacao_Partido.valor
FROM Partido_Comite JOIN Doacao_Partido
WHERE Doacao_Partido.siglaPartido = Partido_Comite.siglaPartido AND
	  Doacao_Partido.ufPartido = Partido_Comite.ufPartido
ORDER BY Partido_Comite.nome


-- ------------------------------------------------------- --
-- 3 consultas envolvendo a junção de três ou mais relações:
-- ------------------------------------------------------- --

-- Lista dos candidatos que receberam doações
SELECT Candidato.nome, Doador.nome, Doacao_Candidato.valor, Doacao_Candidato.data
FROM Candidato JOIN Doacao_Candidato JOIN Doador
WHERE Doacao_Candidato.cpfCandidato = Candidato.cpf AND
	  Doacao_Candidato.cpfDoador = Doador.cpf
ORDER BY valor;

-- Lista dos doadores que doaram para partidos com comitês.
SELECT Doador.nome, Partido_Comite.nome, Doacao_Partido.valor, Doacao_Partido.data
FROM Doador JOIN Doacao_Partido JOIN Partido_Comite
WHERE Doador.cpf = Doacao_Partido.cpfDoador AND
	  Partido_Comite.ufPartido = Doacao_Partido.ufPartido AND
	  Partido_Comite.siglaPartido = Doacao_Partido.siglaPartido
ORDER BY data

-- Lista que mostra quais candidatos tiveram doações para seu partido, 
-- e que o partido tem um comitê.
SELECT Candidato.nome, Partido_Comite.nome, Doador.nome, Doacao_Partido.valor, Doacao_Partido.data, Doacao_Partido.tipo
FROM Partido_Comite JOIN Candidato JOIN Doador JOIN Doacao_Partido
WHERE Partido_Comite.ufPartido = Doacao_Partido.ufPartido AND
	  Partido_Comite.siglaPartido = Doacao_Partido.siglaPartido AND
	  Partido_Comite.ufPartido = Candidato.ufPartido AND
	  Partido_Comite.siglaPartido = Candidato.siglaPartido AND
	  Doacao_Partido.cpfDoador = Doador.cpf
ORDER BY Partido_Comite.nome

-- -------------------------------------------------------------------- --
-- 2 consultas envolvendo funções de agregação sobre o resultado da junção
-- de pelo menos duas relações:
-- -------------------------------------------------------------------- --

-- Lista a soma de quanto cada partido recebeu de doações, considerando
-- apenas doações aos candidatos.
SELECT Candidato.siglaPartido, Candidato.ufPartido, SUM(Doacao_Candidato.valor)
FROM Candidato JOIN Doacao_Candidato
WHERE Candidato.cpf = Doacao_Candidato.cpfCandidato
GROUP BY Candidato.siglaPartido, Candidato.ufPartido;

-- Lista o valor total que cada doador doou, somando doações aos
-- partidos e doações aos candidatos.
SELECT X.nome, (X.somaPartido + Y.somaCandidato) AS somaTotal
FROM (SELECT Doador.nome, SUM(Doacao_Partido.valor) AS somaPartido
	  FROM Doador JOIN Doacao_Partido
	  WHERE Doador.cpf = Doacao_Partido.cpfDoador
	  GROUP BY Doador.nome) AS X
JOIN (SELECT Doador.nome, SUM(Doacao_Candidato.valor) AS somaCandidato
	  FROM Doador JOIN Doacao_Candidato
	  WHERE Doador.cpf = Doacao_Candidato.cpfDoador
	  GROUP BY Doador.nome) AS Y
WHERE X.nome = Y.nome
