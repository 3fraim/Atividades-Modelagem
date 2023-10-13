create database coments;
use coments;
-- Criar a tabela "Produtos"
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Descricao TEXT,
    Preco DECIMAL(10, 2)
);

-- Criar a tabela "Comentarios" com a chave estrangeira
CREATE TABLE Comentarios (
    ComentarioID INT PRIMARY KEY,
    ProdutoID INT,
    Autor VARCHAR(100),
    TextoComentario TEXT,
    DataComentario DATE,
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Inserir 5 registros na tabela "Produtos"
INSERT INTO Produtos (ProdutoID, NomeProduto, Descricao, Preco)
VALUES
    (1, 'Produto A', 'Descrição do Produto A', 25.00),
    (2, 'Produto B', 'Descrição do Produto B', 15.00),
    (3, 'Produto C', 'Descrição do Produto C', 30.00),
    (4, 'Produto D', 'Descrição do Produto D', 18.00),
    (5, 'Produto E', 'Descrição do Produto E', 40.00);

-- Inserir 5 registros na tabela "Comentarios"
INSERT INTO Comentarios (ComentarioID, ProdutoID, Autor, TextoComentario, DataComentario)
VALUES
    (101, 1, 'Alice', 'Bom produto!', '2023-04-10'),
    (102, 2, 'Bob', 'Gostei muito!', '2023-04-12'),
    (103, 1, 'Charlie', 'Poderia ser melhor.', '2023-04-15'),
    (104, 3, 'David', 'Recomendo fortemente!', '2023-04-18'),
    (105, 1, 'Eva', 'Excelente custo-benefício.', '2023-04-20');

-- Consulta SQL para listar o número total de comentários feitos sobre cada produto
SELECT P.NomeProduto, COUNT(C.ComentarioID) AS NumeroComentarios
FROM Produtos P
LEFT JOIN Comentarios C ON P.ProdutoID = C.ProdutoID
GROUP BY P.NomeProduto;



