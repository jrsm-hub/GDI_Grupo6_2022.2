
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

-- Juncao interna: jogadores e seus personagens que desafiaram e sairam vitoriosos no PVP ordenado por nivel do menor para o maior
SELECT J.nome as PLAYER, P.NOME as PERSONAGEM, P.nivel as NIVEL
FROM jogadores J INNER JOIN personagens P ON (J.cod_j = P.cod_j)
INNER JOIN playervsplayer PVP ON (P.cod_p = PVP.desafiante)
WHERE vencedor = 0
ORDER BY nivel ASC
