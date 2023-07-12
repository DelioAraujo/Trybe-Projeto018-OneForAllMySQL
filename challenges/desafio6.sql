SELECT
    ROUND(MIN(tabela_plano.valor_plano), 2) AS faturamento_minimo,
    ROUND(MAX(tabela_plano.valor_plano), 2) AS faturamento_maximo,
    ROUND(AVG(tabela_plano.valor_plano), 2) AS faturamento_medio,
    ROUND(SUM(tabela_plano.valor_plano), 2) AS faturamento_total
FROM
    tabela_pessoas_usuarias
    JOIN tabela_plano ON tabela_pessoas_usuarias.plano = tabela_plano.plano;