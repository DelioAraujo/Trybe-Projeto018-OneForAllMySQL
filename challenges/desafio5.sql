SELECT
    tabela_cancoes.cancao AS cancao,
    COUNT(tabela_historico_reproducoes.pessoa_usuaria_id) AS reproducoes
FROM
    tabela_cancoes
    LEFT JOIN tabela_historico_reproducoes ON tabela_cancoes.id_cancao = tabela_historico_reproducoes.id_musica
GROUP BY
    tabela_cancoes.cancao
ORDER BY
    reproducoes DESC, tabela_cancoes.cancao ASC
LIMIT 2;
