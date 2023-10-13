create database eventos;
use eventos;
-- Criar a tabela "Eventos"
CREATE TABLE Eventos (
    EventoID INT PRIMARY KEY,
    NomeEvento VARCHAR(100),
    DataEvento DATE,
    Localizacao VARCHAR(255)
);

-- Criar a tabela "Participantes"
CREATE TABLE Participantes (
    ParticipanteID INT PRIMARY KEY,
    NomeParticipante VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(15)
);

-- Criar a tabela "InscricoesEventos" com as chaves estrangeiras
CREATE TABLE InscricoesEventos (
    InscricaoID INT PRIMARY KEY,
    EventoID INT,
    ParticipanteID INT,
    FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID),
    FOREIGN KEY (ParticipanteID) REFERENCES Participantes(ParticipanteID)
);

-- Inserir 5 registros na tabela "Eventos"
INSERT INTO Eventos (EventoID, NomeEvento, DataEvento, Localizacao)
VALUES
    (1, 'Evento A', '2023-05-15', 'Local A'),
    (2, 'Evento B', '2023-06-10', 'Local B'),
    (3, 'Evento C', '2023-07-20', 'Local C'),
    (4, 'Evento D', '2023-08-05', 'Local D'),
    (5, 'Evento E', '2023-09-15', 'Local E');

-- Inserir 5 registros na tabela "Participantes"
INSERT INTO Participantes (ParticipanteID, NomeParticipante, Email, Telefone)
VALUES
    (101, 'Participante 1', 'participante1@email.com', '(11) 1111-1111'),
    (102, 'Participante 2', 'participante2@email.com', '(22) 2222-2222'),
    (103, 'Participante 3', 'participante3@email.com', '(33) 3333-3333'),
    (104, 'Participante 4', 'participante4@email.com', '(44) 4444-4444'),
    (105, 'Participante 5', 'participante5@email.com', '(55) 5555-5555');

-- Inserir 5 registros na tabela "InscricoesEventos"
INSERT INTO InscricoesEventos (InscricaoID, EventoID, ParticipanteID)
VALUES
    (201, 1, 101),
    (202, 2, 101),
    (203, 1, 102),
    (204, 3, 103),
    (205, 2, 104);

-- Consulta SQL para listar o nome do evento e os nomes dos participantes inscritos em cada evento
SELECT E.NomeEvento, P.NomeParticipante
FROM Eventos E
INNER JOIN InscricoesEventos IE ON E.EventoID = IE.EventoID
INNER JOIN Participantes P ON IE.ParticipanteID = P.ParticipanteID;



