INSERT INTO jogadores VALUES ('1001', 'Pistaulo', 'Paulo','M', 25);
INSERT INTO jogadores VALUES ('1002', 'BielzinGL', 'Gabriel' ,'M', 21);
INSERT INTO jogadores VALUES ('1003', 'Maniac', 'Tonico','M', 24);
INSERT INTO jogadores VALUES ('1004', 'BarbaRuiva', 'Rafael','M', 17);
INSERT INTO jogadores VALUES ('1005', 'Wes', 'Wesley','M', 21);
INSERT INTO jogadores VALUES ('1006', 'Aninha', 'Ana', 'F', 23);
INSERT INTO jogadores VALUES ('1007', 'PH', 'Pedro', 'M', 25);
INSERT INTO jogadores VALUES ('1008', 'Zezé', 'José', 'M', 17);
INSERT INTO jogadores VALUES ('1009', 'Joca', 'Estevam', 'M', 29);
INSERT INTO jogadores VALUES ('1010', 'croqueta', 'Gisele', 'O', 21);
INSERT INTO jogadores VALUES ('1011', 'LumeiFei', 'Luan', 'M', 33);

INSERT INTO tutor VALUES ('1001', '1003');
INSERT INTO tutor VALUES ('1001', '1005');
INSERT INTO tutor VALUES ('1001', '1006');
INSERT INTO tutor VALUES ('1001', '1007');
INSERT INTO tutor VALUES ('1002', '1001');
INSERT INTO tutor VALUES ('1002', '1004');
INSERT INTO tutor VALUES ('1008', '1010');
INSERT INTO tutor VALUES ('1009', '1011');

INSERT INTO personagens VALUES ('2001', 'Weevil', 'M', 1, '1008');
INSERT INTO personagens VALUES ('2002', 'Christensen', 'M', 1, '1010');
INSERT INTO personagens VALUES ('2003', 'Pasha', 'F', 2, '1008');
INSERT INTO personagens VALUES ('2004', 'HeiFengxi', 'M', 50, '1002');
INSERT INTO personagens VALUES ('2005', 'BaiFengxi', 'F', 60, '1002');
INSERT INTO personagens VALUES ('2006', 'Pixie', 'F', 62, '1006');
INSERT INTO personagens VALUES ('2007', 'Almondegas', 'M', 45, '1006');
INSERT INTO personagens VALUES ('2008', 'Wei', 'F', 25, '1005');
INSERT INTO personagens VALUES ('2009', '20pegar70correr', 'M', 60, '1005');
INSERT INTO personagens VALUES ('2010', 'KarlDoctor', 'M', 32,'1001');
INSERT INTO personagens VALUES ('2011', 'ShieldHadess', 'F', 99, '1007');
INSERT INTO personagens VALUES ('2012', 'BoltFreez', 'M', 70, '1009');
INSERT INTO personagens VALUES ('2013', 'DarkToto', 'F', 11, '1008');
INSERT INTO personagens VALUES ('2014', 'FireFreedom', 'M', 50, '1003');

INSERT INTO elfo VALUES ('2005', 'Khaen');
INSERT INTO elfo VALUES ('2010', 'Hen');
INSERT INTO elfo VALUES ('2011', 'Telluh');
INSERT INTO elfo VALUES ('2012', 'Eru Ilúvatar');
INSERT INTO elfo VALUES ('2013', 'Etain');
INSERT INTO elfo VALUES ('2014', 'Mok');

INSERT INTO humano VALUES ('2004', 'Serdin'); 
INSERT INTO humano VALUES ('2006', 'Morroc'); 
INSERT INTO humano VALUES ('2007', 'Alberta');
INSERT INTO humano VALUES ('2008', 'Einbech'); 
INSERT INTO humano VALUES ('2009', 'Lighthalzen');
INSERT INTO orc VALUES ('2001', 'Clã Mascaosso');
INSERT INTO orc VALUES ('2002', 'Clã Brado Guerreiro');
INSERT INTO orc VALUES ('2003', 'Clã Mok’Nathal'); 

INSERT INTO playervsplayer VALUES ('2005', '2002', 0);
INSERT INTO playervsplayer VALUES ('2013', '2009', 1);
INSERT INTO playervsplayer VALUES ('2007', '2012', 0);
INSERT INTO playervsplayer VALUES ('2014', '2005', 1);
INSERT INTO playervsplayer VALUES ('2004', '2011', 0);

INSERT INTO monstros VALUES ('4001', 'Thanatos', 'Escuridao', 99, 'Boss');
INSERT INTO monstros VALUES ('4002', 'Ente', 'Planta', 35, 'Comum');
INSERT INTO monstros VALUES ('4003', 'Elvis', 'Escuridao', 70, 'Elite');
INSERT INTO monstros VALUES ('4004', 'Formiga de fogo', 'Fogo', 10, 'Comum');
INSERT INTO monstros VALUES ('4005', 'Devorador de Mundos', 'Void', 98, 'Boss');

INSERT INTO habilidades VALUES ('4001', 'Dilacerar');
INSERT INTO habilidades VALUES ('4002', 'Boca Maldita');
INSERT INTO habilidades VALUES ('4003', 'Paralisia Temporal');
INSERT INTO habilidades VALUES ('4004', 'Explosão Infernal');
INSERT INTO habilidades VALUES ('4001', 'Nevoa Sombria');
INSERT INTO habilidades VALUES ('4002', 'Chuva de Acido');
INSERT INTO habilidades VALUES ('4003', 'Rajada de Lâminas');
INSERT INTO habilidades VALUES ('4004', 'Onda de Chamas');
INSERT INTO habilidades VALUES ('4005', 'Cancelamento Absoluto');
INSERT INTO habilidades VALUES ('4005', 'Aprisionamento Eterno');

INSERT INTO lugares VALUES ('3000', 'Prontera', 'Cidade');
INSERT INTO lugares VALUES ('3001', 'Templo Da Sintonia', 'Dungeon');
INSERT INTO lugares VALUES ('3002', 'Arredores De Serdin', 'Campo');
INSERT INTO lugares VALUES ('3003', 'Floresta Élfica', 'Floresta');
INSERT INTO lugares VALUES ('3004', 'Vulcânica', 'Montanha');
INSERT INTO lugares VALUES ('3005', 'Ruínas ancestrais', 'Ruína');
INSERT INTO lugares VALUES ('3006', 'Colinas dos mortos', 'Cemitério');
INSERT INTO lugares VALUES ('3007', 'Praia envenenada', 'Praia');
INSERT INTO lugares VALUES ('3008', 'Ravinas abissais', 'Montanha');
INSERT INTO lugares VALUES ('3009', 'Mar dos kaijus', 'Oceano');
INSERT INTO lugares VALUES ('3010', 'Cidade das Plumas', 'Cidade');
INSERT INTO lugares VALUES ('3011', 'Vila das Orquídeas', 'Vila');
INSERT INTO lugares VALUES ('3012', 'LabirintoDaAreiaViva', 'Dungeon');

INSERT INTO npc VALUES ('3000', 'Willy', 'Ferreiro');
INSERT INTO npc VALUES ('3000', 'Otto', 'Médico');
INSERT INTO npc VALUES ('3010', 'Ancião', 'Missão');
INSERT INTO npc VALUES ('3010', 'Kafra', 'Banco');
INSERT INTO npc VALUES ('3011', 'Kafra', 'Banco');
INSERT INTO npc VALUES ('3011', 'Atlan', 'Guarda');

INSERT INTO conversa VALUES ('2004', '3011', 'Kafra');
INSERT INTO conversa VALUES ('2001', '3000', 'Otto');
INSERT INTO conversa VALUES ('2009', '3000', 'Willy');
INSERT INTO conversa VALUES ('2013', '3011', 'Atlan');
INSERT INTO conversa VALUES ('2010', '3010', 'Ancião');

INSERT INTO combate VALUES ('2010', '4001', '3001', TO_DATE('12/03/2023','DD/MM/YYYY'), 0);
INSERT INTO combate VALUES ('2010', '4002', '3003',TO_DATE('25/04/2023','DD/MM/YYYY'), 1);
INSERT INTO combate VALUES ('2013' , '4003', '3005', TO_DATE('30/09/2023','DD/MM/YYYY'), 1);
INSERT INTO combate VALUES ('2010', '4001', '3001', TO_DATE('17/06/2023','DD/MM/YYYY'), 0);
INSERT INTO combate VALUES ('2003', '4003', '3003', TO_DATE('21/09/2023','DD/MM/YYYY'), 1);
INSERT INTO combate VALUES ('2001', '4004', '3003', TO_DATE('12/03/2023','DD/MM/YYYY'), 1);
INSERT INTO combate VALUES ('2005', '4001', '3002', TO_DATE('25/02/2023','DD/MM/YYYY'), 1);
INSERT INTO combate VALUES ('2014', '4004', '3001', TO_DATE('07/04/2023','DD/MM/YYYY'), 0);

INSERT INTO recompensas VALUES ('7000', 'Manto da escuridao', '2010', '4001', '3001', TO_DATE('12/03/2023','DD/MM/YYYY'));
INSERT INTO recompensas VALUES ('7001', 'Veneno mortal', '2010', '4002', '3003',TO_DATE('25/04/2023','DD/MM/YYYY'));
INSERT INTO recompensas VALUES ('7002', 'Adaga Rondel', '2003', '4003', '3003',TO_DATE('21/09/2023','DD/MM/YYYY'));
INSERT INTO recompensas VALUES ('7003', 'Antena de formiga', '2001', '4004', '3003',TO_DATE('12/03/2023','DD/MM/YYYY'));
INSERT INTO recompensas VALUES ('7005', 'Armadura de fogo', '2014', '4004', '3001',TO_DATE('07/04/2023','DD/MM/YYYY'));
INSERT INTO recompensas VALUES ('7006', 'Arco Demoniaco', '2013' , '4003', '3005',TO_DATE('30/09/2023','DD/MM/YYYY'));
