-- Funções de String:
-- A)

CREATE TABLE nomes (
    nome VARCHAR(50)
);

INSERT INTO nomes (nome) VALUES ('Roberta');
INSERT INTO nomes (nome) VALUES ('Roberto');
INSERT INTO nomes (nome) VALUES ('Maria Clara');
INSERT INTO nomes (nome) VALUES ('João');

--B)

UPDATE nomes
SET nome = UPPER(nome);


--C)

SELECT nome, LENGTH(nome) AS tamanho
FROM nomes;

--D)

UPDATE nomes
SET nome = 
    CASE 
        WHEN nome IN ('Roberto', 'João') THEN CONCAT('Sr. ', nome)
        WHEN nome IN ('Roberta', 'Maria Clara') THEN CONCAT('Sra. ', nome)
        ELSE nome
    END;

-- 2. Funções Numéricas:
--A)

CREATE TABLE produtos (
    produto VARCHAR(50),
    preco DECIMAL(10, 2),
    quantidade INT
);

--B)

UPDATE produtos
SET preco = ROUND(preco, 2);

--C)

SELECT produto, ABS(quantidade) AS quantidade_absoluta
FROM produtos;

--D)

SELECT AVG(preco) AS media_precos
FROM produtos;


--3. Funções de Data:
--A)

CREATE TABLE eventos (
    data_evento DATE
);

-- Inserir algumas datas de exemplo
INSERT INTO eventos (data_evento) VALUES ('2023-10-15');
INSERT INTO eventos (data_evento) VALUES ('2023-10-20');
INSERT INTO eventos (data_evento) VALUES ('2023-10-25');


--B)

INSERT INTO eventos (data_evento) VALUES (NOW());

--C)

SELECT DATEDIFF('2023-10-25', '2023-10-15') AS dias_entre_datas;

--D)

SELECT data_evento, DAYNAME(data_evento) AS nome_dia_semana
FROM eventos;

--4. Funções de Controle de Fluxo:
--A)

SELECT produto, quantidade,
    IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

--B)

SELECT produto, preco,
    CASE
        WHEN preco <= 50 THEN 'Barato'
        WHEN preco > 50 AND preco <= 100 THEN 'Médio'
        ELSE 'Caro'
    END AS categoria_preco
FROM produtos;

--5. Função Personalizada:
--A)

DELIMITER //
CREATE FUNCTION TOTAL_VALOR(preco DECIMAL(10, 2), quantidade INT)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SET total = preco * quantidade;
    RETURN total;
END;
//
DELIMITER ;

--B)

SELECT produto, preco, quantidade, TOTAL_VALOR(preco, quantidade) AS valor_total
FROM produtos;

--6. Funções de Agregação:
--A)

SELECT COUNT(*) AS numero_total_produtos
FROM produtos;

--B)

SELECT produto, preco
FROM produtos
WHERE preco = (SELECT MAX(preco) FROM produtos);

--C)

SELECT produto, preco
FROM produtos
WHERE preco = (SELECT MIN(preco) FROM produtos);

--D)

SELECT SUM(IF(quantidade > 0, preco * quantidade, 0)) AS soma_total_em_estoque
FROM produtos;

--7. Criando funções
--A)

DELIMITER //
CREATE FUNCTION fatorial(n INT)
RETURNS INT
BEGIN
    DECLARE result INT;
    SET result = 1;
    WHILE n > 0 DO
        SET result = result * n;
        SET n = n - 1;
    END WHILE;
    RETURN result;
END;
//
DELIMITER ;

--B)

DELIMITER //
CREATE FUNCTION f_exponencial(base DECIMAL(10, 2), expoente INT)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE resultado DECIMAL(10, 2);
    SET resultado = 1;
    IF expoente >= 0 THEN
        WHILE expoente > 0 DO
            SET resultado = resultado * base;
            SET expoente = expoente - 1;
        END WHILE;
    ELSE
        SET resultado = 1 / f_exponencial(base, -expoente);
    END IF;
    RETURN resultado;
END;
//
DELIMITER ;

--C)

DELIMITER //
CREATE FUNCTION eh_palindromo(palavra VARCHAR(255))
RETURNS INT
BEGIN
    DECLARE reverso VARCHAR(255);
    SET reverso = REVERSE(palavra);
    IF palavra = reverso THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
//
DELIMITER ;
