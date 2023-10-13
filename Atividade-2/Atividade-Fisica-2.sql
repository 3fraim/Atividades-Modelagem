create database produtos;
use produtos;
-- Criar a tabela "Produtos"
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Descricao TEXT,
    PrecoUnitario DECIMAL(10, 2),
    EstoqueMinimo INT
);

-- Criar a tabela "Fornecedores" com a chave estrangeira
CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY,
    NomeFornecedor VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    ProdutoID INT,
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Inserir 5 registros na tabela "Produtos"
INSERT INTO Produtos (ProdutoID, NomeProduto, Descricao, PrecoUnitario, EstoqueMinimo)
VALUES
    (1, 'Produto A', 'Descrição do Produto A', 25.00, 10),
    (2, 'Produto B', 'Descrição do Produto B', 15.00, 20),
    (3, 'Produto C', 'Descrição do Produto C', 30.00, 15),
    (4, 'Produto D', 'Descrição do Produto D', 18.00, 25),
    (5, 'Produto E', 'Descrição do Produto E', 40.00, 12);

-- Inserir 5 registros na tabela "Fornecedores"
INSERT INTO Fornecedores (FornecedorID, NomeFornecedor, Endereco, Telefone, Email, ProdutoID)
VALUES
    (101, 'Fornecedor X', 'Rua A, 123', '(11) 1234-5678', 'fornecedorx@email.com', 1),
    (102, 'Fornecedor Y', 'Av. B, 456', '(21) 9876-5432', 'fornecedory@email.com', 2),
    (103, 'Fornecedor Z', 'Rua C, 789', '(31) 1111-2222', 'fornecedorz@email.com', 3),
    (104, 'Fornecedor W', 'Rua D, 101', '(41) 4444-5555', 'fornecedorw@email.com', 4),
    (105, 'Fornecedor V', 'Av. E, 202', '(51) 7777-8888', 'fornecedorv@email.com', 5);

-- Consulta SQL para retornar o nome do produto e o nome do fornecedor de cada produto
SELECT P.NomeProduto, F.NomeFornecedor
FROM Produtos P
INNER JOIN Fornecedores F ON P.ProdutoID = F.ProdutoID;
