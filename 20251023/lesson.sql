-- 1
SELECT v.produto,
       c.nome
FROM CLIENTES c 
LEFT JOIN VENDAS c
ON c.id_cliente = v.cliente_id;

-- 2
SELECT v.produto,
       v.id_cliente,
       NVL(TO_CHAR(id_cliente), "sem cliente") AS hasCostumer
FROM CLIENTES c
LEFT JOIN VENDAS v
ON c.id_cliente = v.id_cliente
WHERE v.id_cliente = null;
       
-- 3
SELECT c.cidade,
       c.nome,
       v.produto,
       v.valor
FROM CLIENTES c
RIGHT JOIN VENDAS v
WHERE v.produto = null;

-- 4
SELECT NVL(SUM(v.valor), 0),
       c.cidade
FROM CLIENTES c
RIGHT JOIN VENDAS v
ON c.id_cliente = v.id_cliente
GROUP BY c.cidade;