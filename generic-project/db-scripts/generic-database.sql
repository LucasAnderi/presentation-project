CREATE DATABASE generic-database WITH OWNER = postgres
ENCODING = 'UTF8' CONNECTION LIMIT = -1;

DROP TABLE comentario;
DROP TABLE usuario_jogo;
DROP TABLE imagem_jogo;
DROP TABLE jogo;
DROP TABLE usuario;

CREATE TABLE usuario
(
    id BIGSERIAL,
    nome_usuario VARCHAR (50) UNIQUE NOT NULL,
    senha VARCHAR (50) NOT NULL,
    nome_completo VARCHAR (150) NOT NULL,
    email VARCHAR (50) NOT NULL,
    tipo VARCHAR (20) NOT NULL,
    esta_ativo BOOLEAN NOT NULL,
    avatar bytea,
    criado_em TIMESTAMP NOT NULL,
    criado_por VARCHAR (50) NOT NULL,
    ultima_modificacao TIMESTAMP NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE jogo
(
    id BIGSERIAL,
    genero VARCHAR (50) NOT NULL,
    nome VARCHAR (50) UNIQUE NOT NULL,
    descricao VARCHAR NOT NULL,
    preco DECIMAL DEFAULT 249.90,
    desenvolvido_por VARCHAR (100) NOT NULL,
    data_lancamento VARCHAR(50) DEFAULT '-',
    plataforma VARCHAR (50) NOT NULL,
    imagem_principal VARCHAR,
    criado_em TIMESTAMP NOT NULL,
    criado_por VARCHAR (50) NOT NULL,
    ultima_modificacao TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE imagem_jogo
(
    id BIGSERIAL,
    jogo_id_fk BIGINT NOT NULL,
    imagem VARCHAR,
    PRIMARY KEY (id)
);

ALTER TABLE imagem_jogo
    ADD CONSTRAINT imagem_jogo_jogo_fk
        FOREIGN KEY (jogo_id_fk)
            REFERENCES jogo (id)
            ON DELETE CASCADE;



CREATE TABLE usuario_jogo
(
    usuario_id_fk BIGINT NOT NULL,
    jogo_id_fk BIGINT NOT NULL,
    possui_jogo BOOLEAN,
    possui_interesse BOOLEAN,
    nota BIGINT NOT NULL,
    PRIMARY KEY (usuario_id_fk, jogo_id_fk)
);

-- ALTER TABLE usuario_jogo
--     ADD CONSTRAINT usuario_jogo_usuario_fk
--         FOREIGN KEY (usuario_id_fk)
--             REFERENCES usuario (id)
--             ON DELETE SET NULL;

-- ALTER TABLE usuario_jogo
--     ADD CONSTRAINT usuario_jogo_jogo_fk
--         FOREIGN KEY (jogo_id_fk)
--             REFERENCES jogo (id)
--             ON DELETE SET NULL;

ALTER TABLE usuario_jogo
    ADD CONSTRAINT usuario_jogo_usuario_fk
        FOREIGN KEY (usuario_id_fk)
            REFERENCES usuario (id)
            ON DELETE CASCADE;

ALTER TABLE usuario_jogo
    ADD CONSTRAINT usuario_jogo_jogo_fk
        FOREIGN KEY (jogo_id_fk)
            REFERENCES jogo (id)
            ON DELETE CASCADE;

CREATE TABLE comentario
(
    id BIGSERIAL,
    jogo_id_fk BIGINT NOT NULL,
    usuario_id_fk BIGINT NOT NULL,
    enviado_em TIMESTAMP NOT NULL,
    comentario VARCHAR NOT NULL,
    criado_em TIMESTAMP NOT NULL,
    criado_por VARCHAR (50) NOT NULL,
    ultima_modificacao TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

-- ALTER TABLE comentario
--     ADD CONSTRAINT comentario_jogo_fk
--         FOREIGN KEY (jogo_id_fk)
--             REFERENCES jogo (id)
--             ON DELETE SET NULL;
--
-- ALTER TABLE comentario
--     ADD CONSTRAINT comentario_usuario_fk
--         FOREIGN KEY (usuario_id_fk)
--             REFERENCES usuario (id)
--             ON DELETE SET NULL;

ALTER TABLE comentario
    ADD CONSTRAINT comentario_jogo_fk
        FOREIGN KEY (jogo_id_fk)
            REFERENCES jogo (id)
            ON DELETE CASCADE ;

ALTER TABLE comentario
    ADD CONSTRAINT comentario_usuario_fk
        FOREIGN KEY (usuario_id_fk)
            REFERENCES usuario (id)
            ON DELETE CASCADE ;




------------------
INSERT INTO usuario
(nome_usuario, senha, nome_completo, email, tipo, esta_ativo, ultima_modificacao, criado_em, criado_por)
VALUES('admin', 'admin', 'Administrador', 'admin@gmail.com', 'ADMINISTRADOR', true, now(), now(), 'admin');
INSERT INTO usuario
(nome_usuario, senha, nome_completo, email, tipo, esta_ativo, ultima_modificacao, criado_em, criado_por)
VALUES('tiburssio', '123456', 'Tiburssio Tiburssius', 'tiburssio@gmail.com', 'USUARIO', true, now(), now(), 'tiburssio');
INSERT INTO usuario
(nome_usuario, senha, nome_completo, email, tipo, esta_ativo, ultima_modificacao, criado_em, criado_por)
VALUES('aroldo', '123456', 'Aroldo Aroldus', 'aroldo@gmail.com', 'USUARIO', true, now(), now(), 'aroldo');


------------------
INSERT INTO jogo
(genero, nome, descricao, preco, desenvolvido_por, data_lancamento, plataforma, ultima_modificacao, criado_em, criado_por)
VALUES('MMORPG', 'FINAL FANTASY?? XIV: SHADOWBRINGERS', 'Embarque na nova saga do aclamado jogo FINAL FANTASY?? XIV Online com o novo e lend??rio pacote de expans??o SHADOWBRINGERS!

Novos jobs, incluindo Gunbreaker
Nova ra??a jog??vel: Viera
Limite de n??vel aumentado de 70 para 80
Explore novas e grandes ??reas, como Rak???tika Greatwood, Amh Araeng e Il Mheg.
Novos primals, como Pixie King Titania
Novas tribos: fadas, Nu Mou, an??es.
Uma gama de novas masmorras para explorar
Novas incurs??es desafiadoras para 8 jogadores
Uma nova e emocionante s??rie de incurs??es de alian??as YoRHa: Dark Apocalypse
Explore as masmorras que aparecem na hist??ria principal de Shadowbringers ao lado de NPCs famosos com o novo sistema Trust.', 199.90, 'SQUARE ENIX CO. LTD.', '1981-01-01 21:00:00-03', 'PS4, PC', now(), now(), 'admin');

------------------
INSERT INTO jogo
(genero, nome, descricao, preco, desenvolvido_por, data_lancamento, plataforma, ultima_modificacao, criado_em, criado_por)
VALUES('Luta', 'DRAGON BALL FIGHTERZ', 'DRAGON BALL FighterZ foi inspirado no que torna a s??rie DRAGON BALL t??o famosa: lutas infinitas e espetaculares entre guerreiros poderosos.

Em parceria com a Arc System Works, DRAGON BALL FighterZ traz gr??ficos de anime de alta qualidade e oferece uma mec??nica de jogo f??cil de aprender, mas dif??cil de dominar.

Suporte/permuta no 3v3
Monte uma superequipe e aprimore suas t??cnicas para trocar de jogador com agilidade.

Incr??veis Recursos Online
Partidas ranqueadas, salas interativas, partidas malucas com 6 jogadores... Tem para todos os gostos!

Exclusivo Modo Hist??ria
Explore cen??rios in??ditos com a Androide 21, uma nova personagem criada sob a supervis??o do pr??prio Akira Toriyama.

Lutas Espetaculares
Curta combos a??reos, cen??rios destrut??veis e cenas famosas do anime DRAGON BALL reproduzidas em 60FPS e resolu????o de 1080p!', 429.99, 'BANDAI NAMCO', '8 jul 2020', 'PS4, PC, XBOX_ONE', now(), now(), 'admin');

------------------
INSERT INTO jogo
(genero, nome, descricao, preco, desenvolvido_por, data_lancamento, plataforma, ultima_modificacao, criado_em, criado_por)
VALUES('A????o', 'Assassins Creed?? Unity', 'Paris, 1789. A Revolu????o Francesa transformou uma cidade outrora magn??fica em um lugar de terror e caos. Suas ruas de paralelep??pedos ficaram manchadas com o sangue do povo que se atreveu a levantar-se contra a aristocracia opressiva. Enquanto a na????o se fragmenta, um jovem chamado Arno embarcar?? em uma viagem extraordin??ria para desmascarar as for??as ocultas por tr??s da Revolu????o. Sua busca ir?? coloc??-lo em meio a uma luta implac??vel pelo destino de uma na????o, transformando-o em um verdadeiro Mestre Assassino.

Apresentamos o jogo Assassin???s Creed?? Unity, a evolu????o desta franquia de sucesso para a pr??xima gera????o de plataformas, com um nov??ssimo engine de jogo. Da Queda da Bastilha ?? execu????o do rei Lu??s XVI, explore a Revolu????o Francesa como voc?? nunca imaginou e ajude o povo franc??s a moldar um novo destino.', 29.90, 'Ubisoft Entertainment', '11 nov 2014', 'PS4', now(), now(), 'admin');

------------------
INSERT INTO jogo
(genero, nome, descricao, preco, desenvolvido_por, data_lancamento, plataforma, ultima_modificacao, criado_em, criado_por)
VALUES('Survival', 'RESIDENT EVIL 7 biohazard', 'RESIDENT EVIL 7 biohazard, Medo e isolamento se infiltram nas paredes de uma casa de campo abandonada. 7 marca um novo in??cio para o horror de sobreviv??ncia com a Vis??o Isolada da visceral perspectiva em primeira pessoa. Atrav??s do motor gr??fico RE, o horror atinge uma imers??o incr??vel conforme os jogadores entram em um novo e aterrorizante mundo lutando para sobreviver', 74.99, 'Capcom U.S.A., Inc.', '24 jan 2017', 'PC', now(), now(), 'admin');

------------------
INSERT INTO jogo
(genero, nome, descricao, preco, desenvolvido_por, data_lancamento, plataforma, ultima_modificacao, criado_em, criado_por)
VALUES('A????o, RPG', 'Horizon Zero Dawn: The Frozen Wilds', 'Mais al??m das montanhas do norte, as regi??es fronteiri??as da tribo Banuk desafiam qualquer um que ouse tentar sobreviver ??s circunst??ncias extremas. Mas, agora, essa natureza selvagem congelada abriga uma nova amea??a e, para Aloy, um novo mist??rio. E ela est?? determinada a descobri-lo.

The Frozen Wilds possui conte??do adicional de Horizon Zero Dawn, inclusive novas hist??rias, personagens e experi??ncias em uma nova regi??o bela, mas implac??vel.', 15.45, 'Sony Interactive Entertainment', '7 nov 2017', 'PS4, XBOX_ONE', now(), now(), 'admin');




-----------------
INSERT INTO imagem_jogo
(jogo_id_fk, imagem)
VALUES(1, '/Documents/images/img-1.jpg');
INSERT INTO imagem_jogo
(jogo_id_fk, imagem)
VALUES(1, '/Documents/images/img-2.jpg');
INSERT INTO imagem_jogo
(jogo_id_fk, imagem)
VALUES(1, '/Documents/images/img-3.jpg');

INSERT INTO imagem_jogo
(jogo_id_fk, imagem)
VALUES(2, '/Documents/images/img-1.jpg');
INSERT INTO imagem_jogo
(jogo_id_fk, imagem)
VALUES(2, '/Documents/images/img-2.jpg');
INSERT INTO imagem_jogo
(jogo_id_fk, imagem)
VALUES(2, '/Documents/images/img-3.jpg');

INSERT INTO imagem_jogo
(jogo_id_fk, imagem)
VALUES(3, '/Documents/images/img-1.jpg');
INSERT INTO imagem_jogo
(jogo_id_fk, imagem)
VALUES(3, '/Documents/images/img-2.jpg');
INSERT INTO imagem_jogo
(jogo_id_fk, imagem)
VALUES(3, '/Documents/images/img-3.jpg');

-----------------

INSERT INTO usuario_jogo
(usuario_id_fk, jogo_id_fk, possui_jogo, possui_interesse, nota)
VALUES(1, 1, false, false, 5);
INSERT INTO usuario_jogo
(usuario_id_fk, jogo_id_fk, possui_jogo, possui_interesse, nota)
VALUES(1, 2, false, false, 3);
INSERT INTO usuario_jogo
(usuario_id_fk, jogo_id_fk, possui_jogo, possui_interesse, nota)
VALUES(1, 3, true, true, 4);

INSERT INTO usuario_jogo
(usuario_id_fk, jogo_id_fk, possui_jogo, possui_interesse, nota)
VALUES(2, 3, true, false, 1);
INSERT INTO usuario_jogo
(usuario_id_fk, jogo_id_fk, possui_jogo, possui_interesse, nota)
VALUES(2, 4, true, true, 4);
INSERT INTO usuario_jogo
(usuario_id_fk, jogo_id_fk, possui_jogo, possui_interesse, nota)
VALUES(2, 5, false, false, 2);

INSERT INTO usuario_jogo
(usuario_id_fk, jogo_id_fk, possui_jogo, possui_interesse, nota)
VALUES(3, 5, true, true, 3);
INSERT INTO usuario_jogo
(usuario_id_fk, jogo_id_fk, possui_jogo, possui_interesse, nota)
VALUES(3, 2, false, true, 4);
INSERT INTO usuario_jogo
(usuario_id_fk, jogo_id_fk, possui_jogo, possui_interesse, nota)
VALUES(3, 4, true, false, 1);

-----------------

INSERT INTO comentario
(jogo_id_fk, usuario_id_fk, enviado_em, comentario, ultima_modificacao, criado_em, criado_por)
VALUES(1, 1, now(), 'Comentario 1', now(), now(), 'admin');
INSERT INTO comentario
(jogo_id_fk, usuario_id_fk, enviado_em, comentario, ultima_modificacao, criado_em, criado_por)
VALUES(1, 2, now(), 'Comentario 2', now(), now(), 'tibursio');
INSERT INTO comentario
(jogo_id_fk, usuario_id_fk, enviado_em, comentario, ultima_modificacao, criado_em, criado_por)
VALUES(1, 3, now(), 'Comentario 3', now(), now(), 'aroldo');

INSERT INTO comentario
(jogo_id_fk, usuario_id_fk, enviado_em, comentario, ultima_modificacao, criado_em, criado_por)
VALUES(2, 1, now(), 'Comentario 4', now(), now(), 'admin');
INSERT INTO comentario
(jogo_id_fk, usuario_id_fk, enviado_em, comentario, ultima_modificacao, criado_em, criado_por)
VALUES(2, 2, now(), 'Comentario 5', now(), now(), 'tibursio');
INSERT INTO comentario
(jogo_id_fk, usuario_id_fk, enviado_em, comentario, ultima_modificacao, criado_em, criado_por)
VALUES(2, 3, now(), 'Comentario 6', now(), now(), 'aroldo');

INSERT INTO comentario
(jogo_id_fk, usuario_id_fk, enviado_em, comentario, ultima_modificacao, criado_em, criado_por)
VALUES(3, 1, now(), 'Comentario 7', now(), now(), 'admin');
INSERT INTO comentario
(jogo_id_fk, usuario_id_fk, enviado_em, comentario, ultima_modificacao, criado_em, criado_por)
VALUES(3, 2, now(), 'Comentario 8', now(), now(), 'tibursio');
INSERT INTO comentario
(jogo_id_fk, usuario_id_fk, enviado_em, comentario, ultima_modificacao, criado_em, criado_por)
VALUES(3, 3, now(), 'Comentario 9', now(), now(), 'aroldo');

