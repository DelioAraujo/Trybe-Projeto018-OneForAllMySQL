-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

//---------------------------------------------------------------------------------------------

CREATE TABLE SpotifyClone.tabela_pessoas_usuarias(
    pessoa_usuaria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_pessoa_usuaria VARCHAR(100),
    idade INT,
    plano VARCHAR(20),
    FOREIGN KEY (plano) REFERENCES SpotifyClone.tabela_plano (plano)
) engine = InnoDB;

INSERT INTO SpotifyClone.tabela_pessoas_usuarias (nome_pessoa_usuaria, idade, plano)
VALUES
    ('Barbara Liskov', 82, 'gratuito'),
    ('Robert Cecil Martin', 58, 'gratuito'),
    ('Ada Lovelace', 37, 'gratuito'),
    ('Martin Fowler', 46, 'familiar'),
    ('Sandi Metz', 58, 'familiar'),
    ('Paulo Freire', 19, 'familiar'),
    ('Bell Hooks', 26, 'universitário'),
    ('Christopher Alexander', 85, 'universitário'),
    ('Judith Butler', 45, 'pessoal'),
    ('Jorge Amado', 58, 'pessoal');

//---------------------------------------------------------------------------------------------

CREATE TABLE SpotifyClone.tabela_plano (
    plano VARCHAR(20) PRIMARY KEY,
    valor_plano DECIMAL(10,2)
) engine = InnoDB;


INSERT INTO SpotifyClone.tabela_plano (plano, valor_plano)
VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

//---------------------------------------------------------------------------------------------

CREATE TABLE SpotifyClone.tabela_historico_reproducoes (
    pessoa_usuaria_id INT,
    nome_musica VARCHAR(100),
    data_reproducao DATETIME,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.tabela_pessoas_usuarias(pessoa_usuaria_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.tabela_historico_reproducoes (pessoa_usuaria_id, nome_musica, data_reproducao)
VALUES
    (1, 'Samba em Paris', '2022-02-28 10:45:55'),
    (1, 'VIRGO&apos;S GROOVE', '2020-05-02 05:30:35'),
    (1, 'Feeling Good', '2020-03-06 11:22:33'),
    (2, 'Feeling Good', '2022-08-05 08:05:17'),
    (2, 'O Medo de Amar é o Medo de Ser Livre', '2020-01-02 07:40:33'),
    (3, 'Feeling Good', '2020-11-13 16:55:13'),
    (3, 'VIRGO\'S GROOVE', '2020-12-05 18:38:30'),
    (4, 'Samba em Paris', '2021-08-15 17:10:10'),
    (5, 'Samba em Paris', '2022-01-09 01:44:33'),
    (5, 'Under Pressure', '2020-08-06 15:23:43'),
    (6, 'O Medo de Amar é o Medo de Ser Livre', '2017-01-24 00:31:17'),
    (6, 'BREAK MY SOUL', '2017-10-12 12:35:20'),
    (7, 'Don\'t Stop Me Now', '2011-12-15 22:30:49'),
    (8, 'Don\'t Stop Me Now', '2012-03-17 14:56:41'),
    (9, 'The Bard\'s Song', '2022-02-24 21:14:22'),
    (10, 'ALIEN SUPERSTAR', '2015-12-13 08:30:22');

//--------------------------------------------------------------------------------------------------

CREATE TABLE SpotifyClone.tabela_artista (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    artista VARCHAR(100)
) engine = InnoDB;

INSERT INTO SpotifyClone.tabela_artista (artista)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

//-------------------------------------------------------------------------------------------------

CREATE TABLE SpotifyClone.tabela_album (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(100),
    artista VARCHAR(100),
    ano_lancamento INT,
    FOREIGN KEY (artista) REFERENCES SpotifyClone.tabela_artistas(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.tabela_album (album_id, album, artista, ano_lancamento)
VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);

//----------------------------------------------------------------------------------------------

CREATE TABLE SpotifyClone.tabela_cancoes (
    id_cancao INT AUTO_INCREMENT PRIMARY KEY,
    cancao VARCHAR(100),
    duracao_segundos INT,
    album INT,
    FOREIGN KEY (album) REFERENCES SpotifyClone.tabela_album(album_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.tabela_cancoes (cancao, duracao_segundos, album)
VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO\'S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don\'t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105,4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard\s Song', 244, 7),
    ('Feeling Good', 100, 8);

//----------------------------------------------------------------------------------------------

CREATE TABLE SpotifyClone.tabela_seguindo_artistas (
    pessoa_usuaria_id INT,
    seguindo_artista INT,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.tabela_pessoas_usuarias(pessoa_usuaria_id),
    FOREIGN KEY (seguindo_artista) REFERENCES SpotifyClone.tabela_artistas(id)
) engine = InnoDB;

INSERT INTO SpotifyClone.tabela_seguindo_artistas (pessoa_usuaria_id, seguindo_artista)
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

//---------------------------------------------------------------------------------------------------------