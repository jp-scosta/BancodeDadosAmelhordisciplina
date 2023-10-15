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
