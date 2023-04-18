--Criação de tabelas 

--Jogadores
CREATE TABLE jogadores (
    cod_j VARCHAR2 (4),
    apelido VARCHAR2 (20) NOT NULL,
    nome    VARCHAR2 (255) NOT NULL,
    Sexo CHAR,
    idade NUMBER NOT NULL,

    CONSTRAINT Jogadores_pkey PRIMARY KEY (cod_j),
    CONSTRAINT jogadores_checkGenero CHECK (sexo = 'M'or sexo = 'F' or sexo = 'O')
);

--Personagens
CREATE TABLE personagens (
    cod_p VARCHAR2 (4),
    nome VARCHAR2 (20) NOT NULL,
    sexo CHAR NOT NULL,
    nivel NUMBER NOT NULL,
    cod_j VARCHAR2 (20),

    CONSTRAINT personagens_pkey PRIMARY KEY (cod_p),
    CONSTRAINT personagens_fkey FOREIGN KEY (cod_j) REFERENCES jogadores (cod_j)
);

--Equipamento 
CREATE TABLE equipamento (
    cod_p VARCHAR2 (4),
    arma VARCHAR2 (30),
    armadura VARCHAR2 (20),

    CONSTRAINT equipamento_pkey PRIMARY KEY (cod_p),
    CONSTRAINT equipamento_fkey FOREIGN KEY (cod_p) REFERENCES personagens(cod_p)
);

--Elfo
CREATE TABLE elfo (
    cod_e VARCHAR2 (4),
    deidade VARCHAR2 (20), 

    CONSTRAINT elfo_pkey PRIMARY KEY (cod_e),
    CONSTRAINT elfo_fkey FOREIGN KEY (cod_e) REFERENCES personagens(cod_p)
);

--Humano
CREATE TABLE humano (
    cod_h VARCHAR2 (4), 
    nacao VARCHAR2 (20),

    CONSTRAINT humano_pkey PRIMARY KEY (cod_h),
    CONSTRAINT humano_fkey FOREIGN KEY (cod_h) REFERENCES personagens(cod_p)
);

--Orc
CREATE TABLE orc (
    cod_o VARCHAR2 (4),
    tribo VARCHAR2 (20),

    CONSTRAINT anao_pkey PRIMARY KEY (cod_o),
    CONSTRAINT anao_fkey FOREIGN KEY (cod_o) REFERENCES personagens (cod_p)
);

--Monstros
CREATE TABLE monstros (
    cod_m VARCHAR2 (4),
    nome VARCHAR2 (20) NOT NULL,
    elemento VARCHAR2 (10) NOT NULL,
    nivel NUMBER NOT NULL,
    classificacao VARCHAR2 (20) NOT NULL,

    CONSTRAINT monstros_pkey PRIMARY KEY (cod_m)
);

--Lugares 
CREATE TABLE lugares (
    cod_l VARCHAR2 (4),
    nome VARCHAR2 (20) NOT NULL,
    tipo VARCHAR2 (15) NOT NULL,

    CONSTRAINT lugares_pkey PRIMARY KEY (cod_l)
);



--Habilidades
CREATE TABLE habilidades (
    cod_m VARCHAR2 (4), 
    habilidade VARCHAR2 (30),

    CONSTRAINT habilidades_pkey PRIMARY KEY (cod_m),
    CONSTRAINT habilidades_fkey FOREIGN KEY (cod_m) REFERENCES monstros(cod_m)
);

--NPC
CREATE TABLE npc (
    cod_l VARCHAR2 (4),
    nome VARCHAR2 (20),
    funcao VARCHAR2 (10),

    CONSTRAINT npc_pkey PRIMARY KEY (cod_l, nome),
    CONSTRAINT npc_fkey FOREIGN KEY (cod_l) REFERENCES lugares(cod_l)
);

--Conversa
CREATE TABLE conversa (
    cod_p VARCHAR2 (4),
    cod_l VARCHAR2 (4),
    nome VARCHAR2 (20),

    CONSTRAINT conversa_pkey PRIMARY KEY (cod_p, cod_l),
    CONSTRAINT conversa_fkey1 FOREIGN KEY (cod_p) REFERENCES personagens(cod_p),
    CONSTRAINT conversa_fkey3 FOREIGN KEY (cod_l, nome) REFERENCES npc(cod_l, nome)
);


--Tutor
CREATE TABLE tutor (
    aprendiz VARCHAR2 (4),
    mestre VARCHAR2 (4),

    CONSTRAINT tutor_pkey PRIMARY KEY (aprendiz),
    CONSTRAINT tutor_fkey1 FOREIGN KEY (aprendiz) REFERENCES jogadores(cod_j),
    CONSTRAINT tutor_fkey2 FOREIGN key (mestre) REFERENCES jogadores(cod_j)
);

--Player vc Player

CREATE TABLE playervsplayer (
    desafiante VARCHAR2 (4),
    desafiado VARCHAR2 (4),
    vencedor VARCHAR2 (1),

    CONSTRAINT playervsplayer_pkey PRIMARY KEY (desafiado, desafiante),
    CONSTRAINT playervsplayer_fkey1 FOREIGN KEY (desafiado) REFERENCES personagens(cod_p),
    CONSTRAINT playervsplayer_fkey2 FOREIGN KEY (desafiante) REFERENCES personagens (cod_p)
);

--Combate
CREATE TABLE combate (
    cod_p VARCHAR2 (4),
    cod_m VARCHAR2 (4),
    cod_l VARCHAR2 (4) ,
    data_hora DATE NOT NULL,
    vencedor VARCHAR2 (1),

    CONSTRAINT combate_pkey PRIMARY KEY (cod_p, cod_m, cod_l, data_hora),
    CONSTRAINT combate_fkey1 FOREIGN KEY (cod_p) REFERENCES personagens(cod_p),
    CONSTRAINT combate_fkey2 FOREIGN KEY (cod_m) REFERENCES monstros(cod_m),
    CONSTRAINT combate_fkey3 FOREIGN KEY (cod_l) REFERENCES lugares(cod_l)
);

--Recompensas 
CREATE TABLE recompensas (
    id VARCHAR2 (4),
    item VARCHAR2 (20),
    cod_p VARCHAR2 (4),
    cod_m VARCHAR2 (4),
    cod_l VARCHAR2 (4),

    CONSTRAINT recompensas_pkey PRIMARY KEY (id),
    CONSTRAINT recompensas_fkey1 FOREIGN KEY (cod_p, cod_m, cod_l)  REFERENCES combate (cod_p, cod_m, cod_l)
    
);

