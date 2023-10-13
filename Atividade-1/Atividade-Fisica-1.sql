-- Criar a tabela "Clientes"
CREATE TABLE Clientes (
    Cpf INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

-- Criar a tabela "ContasBancarias" com a chave estrangeira
CREATE TABLE ContasBancarias (
    NumeroConta INT PRIMARY KEY,
    Agencia VARCHAR(20),
    CpfCliente INT,
    TipoConta VARCHAR(20),
    Saldo DECIMAL(10, 2),
    FOREIGN KEY (CpfCliente) REFERENCES Clientes(Cpf)
);

-- Inserir 5 registros na tabela "Clientes"
INSERT INTO Clientes (Cpf, Nome, Endereco, Telefone, Email)
VALUES
    (123456789, 'João Silva', 'Rua A, 123', '(11) 1234-5678', 'joao@email.com'),
    (987654321, 'Maria Santos', 'Av. B, 456', '(21) 9876-5432', 'maria@email.com'),
    (111222333, 'Carlos Oliveira', 'Rua C, 789', '(31) 1111-2222', 'carlos@email.com'),
    (444555666, 'Ana Pereira', 'Rua D, 101', '(41) 4444-5555', 'ana@email.com'),
    (777888999, 'Mário Castro', 'Av. E, 202', '(51) 7777-8888', 'mario@email.com');

-- Inserir 5 registros na tabela "ContasBancarias"
INSERT INTO ContasBancarias (NumeroConta, Agencia, CpfCliente, TipoConta, Saldo)
VALUES
    (1001, 'Ag1', 123456789, 'Corrente', 5000.00),
    (1002, 'Ag2', 987654321, 'Poupança', 2500.00),
    (1003, 'Ag1', 111222333, 'Corrente', 7000.00),
    (1004, 'Ag3', 444555666, 'Poupança', 3500.00),
    (1005, 'Ag2', 777888999, 'Corrente', 6000.00);

-- Consulta SQL para retornar o nome do cliente e o saldo da conta bancária de cada cliente
SELECT C.Nome, CB.Saldo
FROM Clientes C
INNER JOIN ContasBancarias CB ON C.Cpf = CB.CpfCliente;
