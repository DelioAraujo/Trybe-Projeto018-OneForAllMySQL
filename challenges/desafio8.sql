SELECT
    tabela_artista.artista AS artista,
    tabela_album.album AS album
FROM
    tabela_artista
    INNER JOIN tabela_album ON tabela_artista.artista_id = tabela_album.artista_id
WHERE
    tabela_artista.artista = 'Elis Regina'
ORDER BY
    tabela_album.album ASC;
