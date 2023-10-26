-- Exercício 1

CREATE TRIGGER clientePosInserir
AFTER INSERT ON Clientes FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (mensagem) VALUES (CONCAT('Novo cliente adicionado em ', NOW()));
END;
