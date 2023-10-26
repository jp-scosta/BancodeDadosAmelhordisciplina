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

