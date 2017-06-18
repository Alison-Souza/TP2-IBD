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

-- Lista os nomes dos candidatos ao cargo de Senador.
SELECT nome
FROM Candidato
WHERE cargo = 'Senador'
ORDER BY nome;

-- Lista as doações para candidatos com valores superior a 10.000.
SELECT numeroReciboEleitoral, numeroDocumento, data, valor
FROM Doacao_Candidato
WHERE valor > 10000
ORDER BY valor;

-- ---------------------------------------------- --
-- 3 consultas envolvendo a junção de duas relações:
-- ---------------------------------------------- --

-- Lista dos candidatos do PT.
SELECT Candidato.nome, Partido.sigla, Candidato.cargo
FROM Candidato JOIN Partido
WHERE Candidato.idPartido = Partido.id AND
	  Partido.sigla = 'PT'
ORDER BY nome;

-- Lista das doações para partidos maiores que 100.000.
SELECT Partido.sigla, Doacao_Partido.data, Doacao_Partido.valor
FROM Partido JOIN Doacao_Partido
WHERE Partido.id = Doacao_Partido.idPartido AND
	  Doacao_Partido.valor > 100000
ORDER BY data;

-- Lista dos comitês que receberam doações.
SELECT Partido_Comite.nome, Doacao_Partido.valor
FROM Partido_Comite JOIN Doacao_Partido
WHERE Doacao_Partido.idPartido = Partido_Comite.idPartido
ORDER BY Partido_Comite.nome;


-- ------------------------------------------------------- --
-- 3 consultas envolvendo a junção de três ou mais relações:
-- ------------------------------------------------------- --

-- Doadores e suas doações a algum partido.
SELECT Doador.nome, Partido.sigla, Partido.uf, Doacao_Partido.valor, Doacao_Partido.data, Doacao_Partido.tipo
FROM Doador JOIN Doacao_Partido JOIN Partido
WHERE Doador.id = Doacao_Partido.idDoador AND
	  Doacao_Partido.idPartido = Partido.id
ORDER BY Doacao_Partido.valor;

-- Lista dos candidatos que receberam doações
SELECT Candidato.nome, Partido.sigla, Partido.uf, Doador.nome, Doacao_Candidato.valor, Doacao_Candidato.data
FROM Candidato JOIN Doacao_Candidato JOIN Doador JOIN Partido
WHERE Doacao_Candidato.cpfCandidato = Candidato.cpf AND
	  Doacao_Candidato.idDoador = Doador.id AND
      Candidato.idPartido = Partido.id
ORDER BY valor;

-- Lista que mostra quais candidatos tiveram doações para seu partido, 
-- e que o partido tem um comitê.
SELECT Candidato.nome, Partido_Comite.nome, Doador.nome, Doacao_Partido.valor, Doacao_Partido.data, Doacao_Partido.tipo
FROM Partido_Comite JOIN Candidato JOIN Doador JOIN Doacao_Partido
WHERE Partido_Comite.idPartido = Doacao_Partido.idPartido AND
	  Partido_Comite.idPartido = Candidato.idPartido AND
	  Doacao_Partido.idDoador = Doador.id
ORDER BY Partido_Comite.nome;

-- -------------------------------------------------------------------- --
-- 2 consultas envolvendo funções de agregação sobre o resultado da junção
-- de pelo menos duas relações:
-- -------------------------------------------------------------------- --

-- Lista o valor total que cada doador doou, somando doações aos
-- partidos e doações aos candidatos.
SELECT X.nome, (X.somaPartido + Y.somaCandidato) AS somaTotal
FROM (SELECT Doador.nome, SUM(Doacao_Partido.valor) AS somaPartido
	  FROM Doador JOIN Doacao_Partido
	  WHERE Doador.id = Doacao_Partido.idDoador
	  GROUP BY Doador.nome) AS X
JOIN (SELECT Doador.nome, SUM(Doacao_Candidato.valor) AS somaCandidato
	  FROM Doador JOIN Doacao_Candidato
	  WHERE Doador.id = Doacao_Candidato.idDoador
	  GROUP BY Doador.nome) AS Y
WHERE X.nome = Y.nome;

-- Lista a soma de quanto cada partido recebeu de doações, considerando
-- apenas doações aos candidatos.
SELECT Partido.sigla, Partido.uf, SUM(Doacao_Candidato.valor)
FROM Candidato JOIN Doacao_Candidato JOIN Partido
WHERE Candidato.cpf = Doacao_Candidato.cpfCandidato AND
	  Candidato.idPartido = Partido.id
GROUP BY Candidato.idPartido;