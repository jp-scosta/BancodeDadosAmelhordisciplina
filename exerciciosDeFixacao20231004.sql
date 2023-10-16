-- 1. Função para Contagem de Livros por Gênero

DELIMITER //
CREATE FUNCTION total_livros_por_genero(genero_nome VARCHAR(255)) RETURNS INT
BEGIN
    DECLARE total INT DEFAULT 0;
    DECLARE done INT DEFAULT 0;
    DECLARE livro_id INT;
    
    DECLARE cur CURSOR FOR
    SELECT id FROM Livro WHERE id_genero = (SELECT id FROM Genero WHERE nome_genero = genero_nome);
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO livro_id;
        
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        
        SET total = total + 1;
    END LOOP;
    
    CLOSE cur;
    
    RETURN total;
END;
//
DELIMITER ;

-- 2. Função para Listar Livros de um Autor Específico

DELIMITER //
CREATE FUNCTION listar_livros_por_autor(primeiro_nome VARCHAR(255), ultimo_nome VARCHAR(255)) RETURNS TEXT
BEGIN
    DECLARE lista_de_livros TEXT DEFAULT '';
    DECLARE done INT DEFAULT 0;
    DECLARE livro_id INT;
    
    DECLARE cur CURSOR FOR
    SELECT LA.id_livro
    FROM Livro_Autor LA
    JOIN Autor A ON LA.id_autor = A.id
    WHERE A.primeiro_nome = primeiro_nome AND A.ultimo_nome = ultimo_nome;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO livro_id;
        
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        
        SELECT titulo INTO lista_de_livros FROM Livro WHERE id = livro_id;
        SET lista_de_livros = CONCAT(lista_de_livros, ', ', titulo);
    END LOOP;
    
    CLOSE cur;
    
    RETURN SUBSTRING(lista_de_livros, 3); -- Remove a vírgula e espaço inicial
END;
//
DELIMITER ;
