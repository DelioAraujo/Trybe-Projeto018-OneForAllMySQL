SELECT
    COUNT(DISTINCT tabela_cancoes.id_cancao) AS cancoes,
    COUNT(DISTINCT tabela_artista.artista_id) AS artistas,
    COUNT(DISTINCT tabela_album.album_id) AS albuns
FROM
    tabela_cancoes
    INNER JOIN tabela_album ON tabela_cancoes.album_id = tabela_album.album_id
    INNER JOIN tabela_artista ON tabela_album.artista_id = tabela_artista.artista_id;