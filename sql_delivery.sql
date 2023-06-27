USE db_deliverycenter;

-- 1- Qual o número de hubs por cidade?

SELECT hub_city, COUNT(*) FROM hubs GROUP BY hub_city;

-- 2- Qual o número de pedidos (orders) por status?

SELECT order_status, COUNT(*) FROM orders GROUP BY order_status;

-- 3- Qual o número de lojas (stores) por cidade dos hubs?

SELECT h.hub_city, COUNT(s.store_id) AS numero_lojas
FROM hubs h
JOIN stores s ON h.hub_id = s.hub_id
GROUP BY h.hub_city;


-- 4- Qual o maior e o menor valor de pagamento (payment_amount) registrado?

SELECT MAX(payment_amount) AS maior_valor, MIN(payment_amount) AS menor_valor
FROM payments;

-- 5- Qual tipo de driver (driver_type) fez o maior número de entregas?

SELECT driver_type, COUNT(driver_id) AS total_entregas
FROM drivers
GROUP BY driver_type
ORDER BY total_entregas DESC
LIMIT 1;

-- 6- Qual a distância média das entregas por tipo de driver (driver_modal)?

SELECT driver_id, AVG(delivery_distance_meters) AS distancia_media
FROM deliveries
GROUP BY driver_id;

-- 7- Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente?

SELECT store_id, AVG(order_amount) AS media_pedido
FROM orders
GROUP BY store_id
ORDER BY media_pedido DESC;

-- 8- Existem pedidos que não estão associados a lojas? Se caso positivo,quantos?

SELECT COUNT(*) AS total_pedidos_sem_loja
FROM orders
WHERE store_id IS NULL;


-- 9- Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'?

SELECT SUM(order_amount) AS Total_Pedido 
FROM orders 
INNER JOIN channels 
ON orders.channel_id = channels.channel_id WHERE channel_name = 'FOOD PLACE';


-- 10- Quantos pagamentos foram cancelados (chargeback)?

SELECT COUNT(*) AS pagamentos_cancelados
FROM payments 
WHERE payment_status = 'chargeback';



-- 11- Qual foi o valor médio dos pagamentos cancelados (chargeback)?

SELECT AVG(payment_amount) AS valor_medio_PagCancelados 
FROM payments 
WHERE payment_status = 'chargeback';

-- 12- Qual a média do valor de pagamento por método de pagamento
-- (payment_method) em ordem decrescente?

SELECT AVG(payment_amount) AS average_payment, payment_method 
FROM payments 
GROUP BY payment_method
ORDER BY average_payment DESC;

-- 13- Quais métodos de pagamento tiveram valor médio superior a 100?

SELECT AVG(payment_amount) AS average_payment, payment_method 
FROM payments 
GROUP BY payment_method
HAVING average_payment > '100';

-- 14- Qual a média de valor de pedido (order_amount) por estado do hub
-- (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type)?


-- 15- Qual estado do hub (hub_state), segmento da loja (store_segment) e tipo
-- de canal (channel_type) teve média de valor de pedido (order_amount) maior que 450?
