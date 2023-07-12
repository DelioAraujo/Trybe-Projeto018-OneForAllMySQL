SELECT
    COUNT(*) AS musicas_no_historico
FROM
    tabela_pessoas_usuarias
    INNER JOIN tabela_historico_reproducoes ON tabela_pessoas_usuarias.pessoa_usuaria_id = tabela_historico_reproducoes.pessoa_usuaria_id
WHERE
    tabela_pessoas_usuarias.nome_pessoa_usuaria = 'Barbara Liskov';
