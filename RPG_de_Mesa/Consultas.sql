--GROUP BY/HAVING : Retorna o nivel e a qtd de jogadores em cada nivel, que possuem nivel acima da media
SELECT nivel, COUNT(*) as Qnt_personagens
FROM personagens
WHERE nivel > (SELECT AVG(P.nivel)
    			FROM personagens P)
GROUP BY nivel
ORDER BY nivel ASC;

--  juncao externa: Retorna jogadores sem personagens
SELECT J.nome
FROM jogadores J LEFT JOIN personagens P ON (J.cod_j = P.cod_j)
WHERE P.cod_j IS NULL
ORDER BY J.nome;

-- Juncao interna: jogadores e seus personagens que desafiaram e sairam vitoriosos no PVP ordenado por nivel do menor para o maior
SELECT J.nome as PLAYER, P.NOME as PERSONAGEM, P.nivel as NIVEL
FROM jogadores J INNER JOIN personagens P ON (J.cod_j = P.cod_j)
INNER JOIN playervsplayer PVP ON (P.cod_p = PVP.desafiante)
WHERE vencedor = 0
ORDER BY nivel ASC;

--Semi join: Mostrar as colunas dos lugares onde ocorreram boss fight (player e o jogador venceu) 
SELECT *
FROM lugares l
WHERE EXISTS (SELECT c.COD_L
    	      FROM combate c
              WHERE l.COD_L = c.COD_L
              AND c.vencedor = 1
              AND c.COD_M IN (SELECT m.COD_M 
    			      FROM monstros m
    			      WHERE m.classificacao = 'Boss'));


-- ANTI-JUNÇÃO: Retorna o nome dos personagens que não tem armadur
SELECT nome as vulneravel
FROM personagens 
WHERE cod_p NOT IN (SELECT cod_p
    		    FROM equipamento
		    WHERE equipamento.armadura IS NOT NULL);

--SUBCONSULTA ESCALAR: retorna a data do drop do combate de um determinado local
SELECT data_hora
FROM combate 
WHERE cod_l =  (SELECT cod_l
		FROM recompensas
    		WHERE id= '7006');
		
--Subconsulta do tipo linha: Retorna o nome e apelido do jogador que possui o  mesmo sexo e idade do jogador 1002
SELECT nome, apelido
FROM jogadores
WHERE (sexo, idade) =  (SELECT sexo, idade
                        FROM jogadores
                        WHERE cod_j = '1002');

		     
--SUBCONSULTA TABELA: retorna o código do local em que o vencedor do combate foi o jogador
SELECT cod_l
FROM lugares 
WHERE cod_l in (SELECT cod_l
		FROM combate
    		WHERE vencedor = 1);

--Operacao de Conjunto: Retorna todos os possiveis participantes em combate (Monstros e personagens)
SELECT nome AS PARTICIPANTES_DE_COMBATE
FROM personagens
UNION
SELECT nome
FROM monstros;



--Procedimentos/Funções

--Trigger: Retorna mensagem de erro quando se tenta inserir um nível de personagem negativo
CREATE or REPLACE TRIGGER nivel_personagm_negativo
BEFORE INSERT on personagens
FOR EACH ROW
DECLARE
    nivel_personagm_negativo EXCEPTION;
BEGIN
    IF : NEW.nivel < 0 THEN
        DBMS_OUTPUT.PUT_LINE('NIVEL DE PERSONAGEM NEGATIVO');
        RAISE nivel_personagm_negativo;
    END IF;
EXCEPTION
    WHEN nivel_personagm_negativo THEN
    Raise_application_error(-20202, 'Nivel do personagem negativo.' || ' Não é possível inserir nível negativo!');
END;


--Trigger: Retorna mensagem de erro quando se tenta inserir um nível de monstro negativo
CREATE or REPLACE TRIGGER nivel_monstro_negativo
BEFORE INSERT on monstros
FOR EACH ROW
DECLARE
    nivel_monstro_negativo EXCEPTION;
BEGIN
    IF : NEW.nivel < 0 THEN
        DBMS_OUTPUT.PUT_LINE('NIVEL DE MONSTRO NEGATIVO');
        RAISE nivel_monstro_negativo;
    END IF;
EXCEPTION
    WHEN nivel_monstro_negativo THEN
    Raise_application_error(-20202, 'Nível do monstro negativo.' || '  Não é possível inserir nível negativo.');
END;

--Procedimento que mostro todos os personagens do jogador BielzinGL
CREATE PROCEDURE personagens_BielzinGL IS
	player VARCHAR(10) := '1002';
	CURSOR  cur_character IS
		SELECT nome, nivel
		FROM personagens
		WHERE cod_j = player;
	nm personagens.nome%TYPE;
	nv personagens.nivel%TYPE;
BEGIN
	OPEN cur_character;
	LOOP 
		FETCH cur_character INTO nm, nv;
		EXIT WHEN cur_character%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE (nm || ' ' || nv);
	END LOOP;
	CLOSE cur_character;
END;

–Procedimento para mostrar todos os personagens que possuem nomes iguais a monstros
CREATE PROCEDURE personagens_nome_monstro IS
BEGIN
  FOR entidade IN (SELECT nome
  		   FROM personagens 
    		   WHERE nome IN (SELECT nome FROM monstros))
	  LOOP
	 	dbms_output.put_line(entidade.nome);
  	  END LOOP;
END;
