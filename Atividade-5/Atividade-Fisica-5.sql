create database senai;
use senai;
-- Criar a tabela "Cursos"
CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY,
    NomeCurso VARCHAR(100),
    Professor VARCHAR(100),
    DataInicio DATE,
    DataFim DATE
);

-- Criar a tabela "Alunos"
CREATE TABLE Alunos (
    Matricula INT PRIMARY KEY,
    NomeAluno VARCHAR(100),
    DataNascimento DATE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15)
);

-- Criar a tabela "Inscricoes" com as chaves estrangeiras
CREATE TABLE Inscricoes (
    InscricaoID INT PRIMARY KEY,
    MatriculaAluno INT,
    CursoID INT,
    FOREIGN KEY (MatriculaAluno) REFERENCES Alunos(Matricula),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Inserir 5 registros na tabela "Cursos"
INSERT INTO Cursos (CursoID, NomeCurso, Professor, DataInicio, DataFim)
VALUES
    (1, 'Curso A', 'Professor X', '2023-04-01', '2023-06-01'),
    (2, 'Curso B', 'Professor Y', '2023-04-15', '2023-06-15'),
    (3, 'Curso C', 'Professor Z', '2023-05-01', '2023-07-01'),
    (4, 'Curso D', 'Professor W', '2023-05-15', '2023-07-15'),
    (5, 'Curso E', 'Professor V', '2023-06-01', '2023-08-01');

-- Inserir 5 registros na tabela "Alunos"
INSERT INTO Alunos (Matricula, NomeAluno, DataNascimento, Endereco, Telefone)
VALUES
    (1001, 'Aluno 1', '2005-03-15', 'Rua X, 101', '(11) 1111-1111'),
    (1002, 'Aluno 2', '2006-05-20', 'Rua Y, 202', '(22) 2222-2222'),
    (1003, 'Aluno 3', '2007-07-25', 'Rua Z, 303', '(33) 3333-3333'),
    (1004, 'Aluno 4', '2008-09-30', 'Rua W, 404', '(44) 4444-4444'),
    (1005, 'Aluno 5', '2009-12-05', 'Rua V, 505', '(55) 5555-5555');

-- Inserir 5 registros na tabela "Inscricoes"
INSERT INTO Inscricoes (InscricaoID, MatriculaAluno, CursoID)
VALUES
    (201, 1001, 1),
    (202, 1002, 1),
    (203, 1002, 2),
    (204, 1003, 3),
    (205, 1004, 4);

-- Consulta SQL para listar o nome do aluno e o nome dos cursos em que cada aluno está inscrito
SELECT A.NomeAluno, C.NomeCurso
FROM Alunos A
INNER JOIN Inscricoes I ON A.Matricula = I.MatriculaAluno
INNER JOIN Cursos C ON I.CursoID = C.CursoID;



