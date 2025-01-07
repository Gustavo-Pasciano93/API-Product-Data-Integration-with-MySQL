SELECT * FROM vendas.tabela_roupas_masculinas
WHERE price = (SELECT MAX(PRICE) FROM vendas.tabela_roupas_masculinas);