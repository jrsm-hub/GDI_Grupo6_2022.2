--Criação de tabelas 

--Jogadores
CREATE TABLE jogadores (
    apelido VARCHAR2 (20),
    nome    VARCHAR2 (255) NOT NULL,
    Sexo CHAR,
    idade NUMBER NOT NULL,

    CONSTRAINT Jogadores_pkey PRIMARY KEY (apelido),
    CONSTRAINT jogadores_checkGenero CHECK (sexo = 'M'or sexo = 'F' or sexo = 'O')
);

--Personagens
CREATE TABLE personagens (
    nome VARCHAR2 (20),
    sexo CHAR,
    nivel NUMBER NOT NULL,
    apelido_j VARCHAR2 (20),

    CONSTRAINT personagens_pkey PRIMARY KEY (nome),
    CONSTRAINT personagens_fkey FOREIGN KEY (apelido_j) REFERENCES jogadores (apelido)
);

--Equipamento 
CREATE TABLE equipamento (
    nome_p VARCHAR2 (20),
    arma VARCHAR2 (30),
    armadura VARCHAR2 (20),

    CONSTRAINT equipamento_pkey PRIMARY KEY (nome_p),
    CONSTRAINT equipamento_fkey FOREIGN KEY (nome_p) REFERENCES personagens(nome)
);

--Elfo
CREATE TABLE elfo (
    nome_e VARCHAR2 (20),
    raça VARCHAR2 (20), 

    CONSTRAINT elfo_pkey PRIMARY KEY (nome_e),
    CONSTRAINT elfo_fkey FOREIGN KEY (nome_e) REFERENCES personagens(nome)
);

--Humano
CREATE TABLE humano (
    nome_h VARCHAR2 (20), 
    nacao VARCHAR2 (20),

    CONSTRAINT humano_pkey PRIMARY KEY (nome_h),
    CONSTRAINT humano_fkey FOREIGN KEY (nome_h) REFERENCES personagens(nome)
);

--Anão
CREATE TABLE anao (
    nome_a VARCHAR2 (20),
    tribo VARCHAR2 (20),

    CONSTRAINT anao_pkey PRIMARY KEY (nome_a),
    CONSTRAINT anao_fkey FOREIGN KEY (nome_a) REFERENCES personagens (nome)
);

--Monstros
CREATE TABLE monstros (
    nome VARCHAR2 (20),
    elemento VARCHAR2 (10),
    nivel NUMBER,
    classificacao VARCHAR2 (20),

    CONSTRAINT monstros_pkey PRIMARY KEY (nome)
);

--Lugares 
CREATE TABLE lugares (
    nome VARCHAR2 (20),
    estado VARCHAR2 (15),

    CONSTRAINT lugares_pkey PRIMARY KEY (nome)
);

--Recompensas 
CREATE TABLE recompensas (
    id VARCHAR2 (5),
    item VARCHAR2 (20),
    nome_p VARCHAR2 (20),
    nome_m VARCHAR2 (20),
    nome_l VARCHAR2 (20),

    CONSTRAINT recompensas_pkey PRIMARY KEY (id),
    CONSTRAINT recompensas_fkey1 FOREIGN KEY (nome_p) REFERENCES personagens (nome),
    CONSTRAINT recompensas_fkey2 FOREIGN KEY (nome_m) REFERENCES monstros (nome),
    CONSTRAINT recompensas_fkey3 FOREIGN KEY (nome_l) REFERENCES lugares (nome)
);

--Habilidades
CREATE TABLE habilidades (
    nome_m VARCHAR2 (20), 
    habilidade VARCHAR2 (30),

    CONSTRAINT habilidades_pkey PRIMARY KEY (nome_m),
    CONSTRAINT habilidades_fkey FOREIGN KEY (nome_m) REFERENCES monstros(nome)
);

--NPC
CREATE TABLE npc (
    nome_l VARCHAR2 (20),
    nome VARCHAR2 (20),
    funcao VARCHAR2 (10),

    CONSTRAINT npc_pkey PRIMARY KEY (nome_l, nome),
    CONSTRAINT npc_fkey FOREIGN KEY (nome_l) REFERENCES lugares(nome)
);

--Tutor
CREATE TABLE tutor (
    aprendiz VARCHAR2 (20),
    mestre VARCHAR2 (20),

    CONSTRAINT tutor_pkey PRIMARY KEY (aprendiz),
    CONSTRAINT tutor_fkey1 FOREIGN KEY (aprendiz) REFERENCES jogadores(apelido),
    CONSTRAINT tutor_fkey2 FOREIGN key (mestre) REFERENCES jogadores(apelido)
);

--Player vc Player

CREATE TABLE playervsplayer (
    desafiante VARCHAR2 (20),
    desafiado VARCHAR2 (20),

    CONSTRAINT playervsplayer_pkey PRIMARY KEY (desafiado, desafiante),
    CONSTRAINT playervsplayer_fkey1 FOREIGN KEY (desafiado) REFERENCES personagens(nome),
    CONSTRAINT playervsplayer_fkey2 FOREIGN KEY (desafiante) REFERENCES personagens (nome)
);

--Combate
CREATE TABLE combate (
    nome_p VARCHAR2 (20),
    nome_m VARCHAR2 (20),
    nome_l VARCHAR2 (20) NOT NULL,
    data_hora TIMESTAMP NOT NULL,

    CONSTRAINT combate_pkey PRIMARY KEY (nome_p, nome_m, nome_l, data_hora),
    CONSTRAINT combate_fkey1 FOREIGN KEY (nome_p) REFERENCES personagens(nome),
    CONSTRAINT combate_fkey2 FOREIGN KEY (nome_m) REFERENCES monstros(nome),
    CONSTRAINT combate_fkey3 FOREIGN KEY (nome_l) REFERENCES lugares(nome)
);

--Drop
CREATE TABLE drops (
    id_c VARCHAR2 (5),
    data_hora_c TIMESTAMP NOT NULL,

    CONSTRAINT drops_pkey PRIMARY KEY (id_c),
    CONSTRAINT drops_fkey1 FOREIGN KEY (id_c) REFERENCES recompensas(id),
    CONSTRAINT drops_fkey2 FOREIGN KEY (data_hora_c) REFERENCES combate(data_hora)
);


