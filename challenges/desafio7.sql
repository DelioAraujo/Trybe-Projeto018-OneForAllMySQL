SELECT
    tabela_artista.artista AS artista,
    tabela_album.album AS album,
    COUNT(tabela_seguindo_artistas.pessoa_usuaria_id) AS pessoas_seguidoras
FROM
    tabela_artista
    LEFT JOIN tabela_album ON tabela_artista.artista_id = tabela_album.artista_id
    LEFT JOIN tabela_seguindo_artistas ON tabela_artista.artista_id = tabela_seguindo_artistas.seguindo_artista
GROUP BY
    tabela_artista.artista_id,
    tabela_album.album_id
ORDER BY
    pessoas_seguidoras DESC,
    tabela_artista.artista ASC,
    tabela_album.album ASC;
