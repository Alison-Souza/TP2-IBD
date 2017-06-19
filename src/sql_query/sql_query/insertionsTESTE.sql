-- INSERTIONS PARA TESTES:

-- As duas insertions abaixo tem o mesmo significado:
-- INSERT INTO Partido(uf, sigla) VALUES ('MG', 'PT');
-- INSERT INTO Partido VALUES ('MG', 'PT');

use ibd_tp;

INSERT INTO Partido(uf,sigla) VALUES ('MG', 'PT');
INSERT INTO Partido(uf,sigla) VALUES ('MG', 'PSDB');
INSERT INTO Partido(uf,sigla) VALUES ('MG', 'PMDB');
INSERT INTO Partido(uf,sigla) VALUES ('SP', 'PT');
INSERT INTO Partido(uf,sigla) VALUES ('SP', 'PSDB');
INSERT INTO Partido(uf,sigla) VALUES ('SP', 'PMDB');

INSERT INTO Candidato VALUES ('11111111111', 6, 15, 'Presidente', 'Michel Temer');
INSERT INTO Candidato VALUES ('22222222222', 2, 456, 'Senador', 'Aécio Neves');
INSERT INTO Candidato VALUES ('33333333333', 6, 150, 'Senador', 'Marta Suplicy');
INSERT INTO Candidato VALUES ('44444444444', 1, 13, 'Governador', 'Fernando Pimentel');
INSERT INTO Candidato VALUES ('55555555555', 2, 450, 'Senador', 'Antonio Anastasia');
INSERT INTO Candidato VALUES ('66666666666', 1, 1333, 'Deputado Federal', 'Patrus Ananias');
INSERT INTO Candidato VALUES ('77777777777', 5, 457, 'Senador', 'José Serra');
INSERT INTO Candidato VALUES ('88888888888', 5, 45, 'Governador', 'João Dória');
INSERT INTO Candidato VALUES ('99999999999', 4, 13, 'Dono do Triplex', 'Luiz Inácio Lula da Silva');

INSERT INTO Doador VALUES ('12345678900', 'Marcelo Odebrecht');
INSERT INTO Doador VALUES ('98765432100', 'Joesley Batista');
INSERT INTO Doador VALUES ('11223344556', 'Antonio de Queiroz Galvão');

INSERT INTO Partido_Comite VALUES (1, 'Comite PT-MG');
INSERT INTO Partido_Comite VALUES (2, 'Comite PSDB-MG');
INSERT INTO Partido_Comite VALUES (5, 'Comite PSDB-SP');
INSERT INTO Partido_Comite VALUES (6, 'Comite PMDB-SP');

INSERT INTO Doacao_Partido VALUES (1, '12345678900', 4, '.txt', '123', '2014-06-12', 45000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (2, '12345678900', 4, '.txt', '124', '2014-06-15', 20000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (3, '98765432100', 2, '.txt', '321', '2014-09-25', 150000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (4, '11223344556', 3, '.txt', '456', '2014-08-06', 120000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (5, '11223344556', 6, '.txt', '891', '2014-08-16', 140000, 'caixa 1');
INSERT INTO Doacao_Partido VALUES (6, '98765432100', 1, '.txt', '641', '2014-09-27', 170000, 'caixa 1');

INSERT INTO Doacao_Candidato VALUES (10, '12345678900', '11111111111', '12345', '987', '2014-05-18', 1500, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (11, '12345678900', '22222222222', '12346', '988', '2014-05-20', 20000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (12, '98765432100', '33333333333', '12347', '989', '2014-05-21', 12000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (13, '98765432100', '44444444444', '12348', '990', '2014-05-22', 13000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (14, '11223344556', '55555555555', '12349', '991', '2014-05-23', 4000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (15, '11223344556', '66666666666', '12350', '992', '2014-05-24', 18000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (16, '12345678900', '77777777777', '12351', '993', '2014-05-25', 7000, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (17, '11223344556', '88888888888', '12352', '994', '2014-05-26', 2100, 'caixa 2');
INSERT INTO Doacao_Candidato VALUES (18, '98765432100', '99999999999', '12353', '995', '2014-05-27', 50000, 'caixa 2');
