--Criação de tabelas 

--Jogadores
CREATE TABLE jogadores (
    apelido VARCHAR2 (20),
    nome    VARCHAR2 (255) NOT NULL,
    Sexo CHAR,
    idade NUMBER NOT NULL

    CONSTRAINT Jogadores_pkey PRIMARY KEY (apelido),
    CONSTRAINT jogadores_checkGenero CHECK (sexo = "M" or sexo = 'F', or sexo = "O")
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
    CONSTRAINT elfo_fkey FOREIGN KEY nome_e REFERENCES personagens(nome)
);

--Humano
CREATE TABLE humano (
    nome_h VARCHAR2 (20), 
    nacao VARCHAR2 (20),

    CONSTRAINT humano_pkey PRIMARY KEY (nome_h),
    CONSTRAINT humano_fkey FOREIGN KEY nome_h REFERENCES personagens(nome)
);