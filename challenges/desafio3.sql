SELECT
    tabela_pessoas_usuarias.nome_pessoa_usuaria AS pessoa_usuaria,
    COUNT(tabela_historico_reproducoes.id_musica) AS musicas_ouvidas,
    ROUND(SUM(tabela_cancoes.duracao_segundos) / 60, 2) AS total_minutos
FROM
    tabela_pessoas_usuarias
    LEFT JOIN tabela_historico_reproducoes ON tabela_pessoas_usuarias.pessoa_usuaria_id = tabela_historico_reproducoes.pessoa_usuaria_id
    LEFT JOIN tabela_cancoes ON tabela_historico_reproducoes.id_musica = tabela_cancoes.id_cancao
GROUP BY
    tabela_pessoas_usuarias.pessoa_usuaria_id
ORDER BY
    tabela_pessoas_usuarias.nome_pessoa_usuaria ASC;
