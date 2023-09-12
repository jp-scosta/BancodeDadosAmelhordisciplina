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
