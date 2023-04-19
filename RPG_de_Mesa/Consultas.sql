
--  juncao externa: Retorna jogadores sem personagens
SELECT J.nome
FROM jogadores J LEFT JOIN personagens P ON (J.cod_j = P.cod_j)
WHERE P.cod_j IS NULL
ORDER BY J.nome

--Operacao de Conjunto: Retorna todos os possiveis participantes em combate (Monstros e personagens)
SELECT nome AS PARTICIPANTES_DE_COMBATE
FROM personagens
UNION
SELECT nome
FROM monstros

--GROUP BY/HAVING : Retorna o nivel e a qtd de jogadores em cada nivel, que possuem nivel acima da media
SELECT nivel, COUNT(*) as Qnt_personagens
FROM personagens
WHERE nivel > (SELECT AVG(P.nivel)
    			FROM personagens P)
GROUP BY nivel
ORDER BY nivel ASC

