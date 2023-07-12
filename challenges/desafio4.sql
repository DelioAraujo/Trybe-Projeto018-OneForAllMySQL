SELECT
    tabela_pessoas_usuarias.nome_pessoa_usuaria AS pessoa_usuaria,
    CASE
        WHEN MAX(tabela_historico_reproducoes.data_reproducao) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    tabela_pessoas_usuarias
    LEFT JOIN tabela_historico_reproducoes ON tabela_pessoas_usuarias.pessoa_usuaria_id = tabela_historico_reproducoes.pessoa_usuaria_id
GROUP BY
    tabela_pessoas_usuarias.pessoa_usuaria_id
ORDER BY
    tabela_pessoas_usuarias.nome_pessoa_usuaria ASC;
