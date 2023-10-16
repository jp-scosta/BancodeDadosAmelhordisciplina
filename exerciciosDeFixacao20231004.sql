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

