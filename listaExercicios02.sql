-- Exercício 1

DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
    SELECT * FROM Autor;
END;
//
DELIMITER ;

CALL sp_ListarAutores();

-- Exercício 2

DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END;
//
DELIMITER ;

CALL sp_LivrosPorCategoria('Ciência');
CALL sp_LivrosPorCategoria('Ficção Científica');

-- Exercício 3

DELIMITER //
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN categoriaNome VARCHAR(100), OUT totalLivros INT)
BEGIN
    SELECT COUNT(*) INTO totalLivros
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END;
//
DELIMITER ;

-- Exercício 4

DELIMITER //
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoriaNome VARCHAR(100), OUT possuiLivros BOOLEAN)
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
    
    IF total > 0 THEN
        SET possuiLivros = TRUE;
    ELSE
        SET possuiLivros = FALSE;
    END IF;
END;
//
DELIMITER ;

-- Exercício 5

DELIMITER //
CREATE PROCEDURE sp_LivrosAteAno(IN anoLimite INT)
BEGIN
    SELECT Titulo, Ano_Publicacao
    FROM Livro
    WHERE Ano_Publicacao <= anoLimite;
END;
//
DELIMITER ;

-- Exercício 6

DELIMITER //
CREATE PROCEDURE sp_TitulosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END;
//
DELIMITER ;

-- Exercício 7

DELIMITER //
CREATE PROCEDURE sp_AdicionarLivro(
    IN livroTitulo VARCHAR(255),
    IN editoraID INT,
    IN anoPublicacao INT,
    IN numeroPaginas INT,
    IN categoriaID INT,
    OUT mensagem VARCHAR(255)
)
BEGIN
    DECLARE livroExistente INT;
    
    -- Verifica se o título do livro já existe na tabela Livro
    SELECT COUNT(*) INTO livroExistente
    FROM Livro
    WHERE Titulo = livroTitulo;
    
    IF livroExistente > 0 THEN
        SET mensagem = 'O título do livro já existe na base de dados.';
    ELSE
        -- Insere o novo livro na tabela Livro
        INSERT INTO Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        VALUES (livroTitulo, editoraID, anoPublicacao, numeroPaginas, categoriaID);
        
        SET mensagem = 'Livro adicionado com sucesso.';
    END IF;
END;
//
DELIMITER ;
