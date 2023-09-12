-- exercício 1
SELECT titulo FROM livros;

-- exercício 2
SELECT NOME FROM autores
WHERE nascimento < '1900-01-01';

-- exercício 3
SELECT titulo 
FROM livros 
INNER JOIN autores ON autor_id=autores.id
WHERE NOME = 'J.K. Rowling';

-- exercício 4
SELECT alunos.nome
FROM alunos 
JOIN matriculas ON alunos.id = matriculas.aluno_id
WHERE matriculas.curso = 'Engenharia de Software';

-- exercício 5
SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto;

-- exercício 6
SELECT autores.nome, count(livros.id) AS numero_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.id;

-- exercício 7
SELECT curso, count(aluno_id) AS numero_de_alunos
FROM matriculas
GROUP BY curso;

-- exercício 8
SELECT produto, AVG(receita) AS media_receita
FROM vendas
GROUP BY produto;

-- exercício 9
SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto
HAVING SUM(receita) > 10000;

-- exercício 10
SELECT autores.nome, COUNT(livros.id) AS numero_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.id
HAVING COUNT(livros.id) > 2;
