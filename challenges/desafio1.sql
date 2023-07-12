DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE tabela_plano (
    plano VARCHAR(20) PRIMARY KEY,
    valor_plano DECIMAL(10,2)
) ENGINE = InnoDB;

INSERT INTO tabela_plano (plano, valor_plano)
VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

CREATE TABLE tabela_artista (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    artista VARCHAR(100)
) ENGINE = InnoDB;

INSERT INTO tabela_artista (artista)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

CREATE TABLE tabela_album (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(100),
    artista_id INT,
    ano_lancamento INT,
    FOREIGN KEY (artista_id) REFERENCES tabela_artista(artista_id)
) ENGINE = InnoDB;

INSERT INTO tabela_album (album, artista_id, ano_lancamento)
VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);

CREATE TABLE tabela_cancoes (
    id_cancao INT AUTO_INCREMENT PRIMARY KEY,
    cancao VARCHAR(100),
    duracao_segundos INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES tabela_album(album_id)
) ENGINE = InnoDB;

INSERT INTO tabela_cancoes (cancao, duracao_segundos, album_id)
VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGOS GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Dont Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bards Song', 244, 7),
    ('Feeling Good', 100, 8);

CREATE TABLE tabela_pessoas_usuarias(
    pessoa_usuaria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_pessoa_usuaria VARCHAR(100),
    idade INT,
    plano VARCHAR(20),
    FOREIGN KEY (plano) REFERENCES tabela_plano (plano)
) ENGINE = InnoDB;

INSERT INTO tabela_pessoas_usuarias (nome_pessoa_usuaria, idade, plano)
VALUES
    ('Barbara Liskov', 82, 'gratuito'),
    ('Robert Cecil Martin', 58, 'gratuito'),
    ('Ada Lovelace', 37, 'familiar'),
    ('Martin Fowler', 46, 'familiar'),
    ('Sandi Metz', 58, 'familiar'),
    ('Paulo Freire', 19, 'universitário'),
    ('Bell Hooks', 26, 'universitário'),
    ('Christopher Alexander', 85, 'pessoal'),
    ('Judith Butler', 45, 'pessoal'),
    ('Jorge Amado', 58, 'pessoal');

CREATE TABLE tabela_seguindo_artistas (
    pessoa_usuaria_id INT,
    seguindo_artista INT,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES tabela_pessoas_usuarias(pessoa_usuaria_id),
    FOREIGN KEY (seguindo_artista) REFERENCES tabela_artista(artista_id),
    CONSTRAINT uc_seguindo_artistas UNIQUE (pessoa_usuaria_id, seguindo_artista)
) ENGINE = InnoDB;

INSERT INTO tabela_seguindo_artistas (pessoa_usuaria_id, seguindo_artista)
VALUES
    (1, 1), -- Beyoncé
    (1, 2), -- Queen
    (1, 3), -- Elis Regina
    (2, 1), -- Beyoncé
    (2, 3), -- Elis Regina
    (3, 2), -- Queen
    (4, 4), -- Baco Exu do Blues
    (5, 5), -- Blind Guardian
    (5, 6), -- Nina Simone
    (6, 6), -- Nina Simone
    (6, 1), -- Beyoncé
    (7, 6), -- Nina Simone
    (9, 3), -- Elis Regina
    (10, 2); -- Queen

CREATE TABLE tabela_historico_reproducoes (
    pessoa_usuaria_id INT,
    id_musica INT,
    data_reproducao DATETIME,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES tabela_pessoas_usuarias(pessoa_usuaria_id),
    FOREIGN KEY (id_musica) REFERENCES tabela_cancoes(id_cancao),
    CONSTRAINT uc_historico_reproducoes UNIQUE (pessoa_usuaria_id, id_musica)
) ENGINE = InnoDB;

INSERT INTO tabela_historico_reproducoes (pessoa_usuaria_id, id_musica, data_reproducao)
VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');


