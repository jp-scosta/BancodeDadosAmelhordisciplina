-- Exercício 1

CREATE TRIGGER clientePosInserir
AFTER INSERT ON Clientes FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (mensagem) VALUES (CONCAT('Novo cliente adicionado em ', NOW()));
END;

-- Exercício 2

CREATE TRIGGER clienteAntesExcluir
BEFORE DELETE ON Clientes FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (mensagem) VALUES ('Tentativa de exclusão de cliente em ' + NOW());
END;

-- Exercício 3

CREATE TRIGGER AtualizarNomeCliente
AFTER UPDATE ON Clientes FOR EACH ROW
BEGIN
    DECLARE nome_antigo VARCHAR(255);
    SET nome_antigo = OLD.nome;
    
    INSERT INTO Auditoria (mensagem) VALUES ('Nome atualizado de "', nome_antigo, '" para "', NEW.nome, '"'));
END;
