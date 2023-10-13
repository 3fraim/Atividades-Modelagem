create database colegio;
use colegio;
-- Criar a tabela "Escolas"
CREATE TABLE Escolas (
    EscolaID INT PRIMARY KEY,
    NomeEscola VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15)
);

-- Criar a tabela "Alunos" com a chave estrangeira
CREATE TABLE Alunos (
    Matricula INT PRIMARY KEY,
    NomeAluno VARCHAR(100),
    DataNascimento DATE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    EscolaID INT,
    FOREIGN KEY (EscolaID) REFERENCES Escolas(EscolaID)
);

-- Inserir 5 registros na tabela "Escolas"
INSERT INTO Escolas (EscolaID, NomeEscola, Endereco, Telefone)
VALUES
    (1, 'Escola A', 'Rua A, 123', '(11) 1234-5678'),
    (2, 'Escola B', 'Av. B, 456', '(21) 9876-5432'),
    (3, 'Escola C', 'Rua C, 789', '(31) 1111-2222'),
    (4, 'Escola D', 'Rua D, 101', '(41) 4444-5555'),
    (5, 'Escola E', 'Av. E, 202', '(51) 7777-8888');

-- Inserir 5 registros na tabela "Alunos"
INSERT INTO Alunos (Matricula, NomeAluno, DataNascimento, Endereco, Telefone, EscolaID)
VALUES
    (1001, 'Aluno 1', '2005-03-15', 'Rua X, 101', '(11) 1111-1111', 1),
    (1002, 'Aluno 2', '2006-05-20', 'Rua Y, 202', '(22) 2222-2222', 2),
    (1003, 'Aluno 3', '2007-07-25', 'Rua Z, 303', '(33) 3333-3333', 1),
    (1004, 'Aluno 4', '2008-09-30', 'Rua W, 404', '(44) 4444-4444', 3),
    (1005, 'Aluno 5', '2009-12-05', 'Rua V, 505', '(55) 5555-5555', 1);

-- Consulta SQL para listar o nome da escola e o número total de alunos matriculados em cada escola
SELECT E.NomeEscola, COUNT(A.Matricula) AS NumeroAlunos
FROM Escolas E
LEFT JOIN Alunos A ON E.EscolaID = A.EscolaID
GROUP BY E.NomeEscola;


