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

-- exercício 11
SELECT livros.titulo, autores.nome AS autor
FROM livros
JOIN autores ON livros.autor_id = autores.id;

-- exercício 12
SELECT alunos.nome, matriculas.curso
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;

-- exercício 13
SELECT autores.nome, livros.titulo
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id;

-- exercício 14
SELECT matriculas.curso, alunos.nome
FROM matriculas
RIGHT JOIN alunos ON matriculas.aluno_id = alunos.id;

-- exercício 15 
SELECT alunos.nome, matriculas.curso
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id;

-- exercício 16
SELECT autores.nome, COUNT(livros.id) AS numero_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.id
ORDER BY numero_de_livros DESC
LIMIT 1;

-- exercício 17
SELECT produto, MIN(receita) AS menor_receita
FROM vendas
GROUP BY produto;

-- exercício 19
SELECT alunos.nome, COUNT(matriculas.id) AS numero_de_matriculas
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.id;

-- exercício 20
SELECT produto, COUNT(*) AS quantidade_de_vendas
FROM vendas
GROUP BY produto
ORDER BY quantidade_de_vendas DESC
LIMIT 1;
