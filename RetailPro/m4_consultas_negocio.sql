USE Ventas_Tech_DB;

SELECT * FROM ventas;

SELECT
MONTH(fecha_venta) AS mes,
sum(cantidad*precio_unitario) AS total_facturado,
count(*) AS cantidad_pedidos,
avg(precio_unitario)  AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

SELECT TOP 5
id_producto,
sum(cantidad) AS unidades_vendidas,
sum(cantidad*precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

SELECT 
id_cliente,
count(*) AS cantidad_pedidos,
sum(cantidad*precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING count(*)>1;

SELECT
MONTH(fecha_venta) AS mes,
sum(cantidad*precio_unitario) AS total_facturado,
CASE
WHEN sum(cantidad*precio_unitario) > avg(sum(cantidad*precio_unitario)) OVER()
THEN 'Por encima'
WHEN sum(cantidad*precio_unitario)< avg(sum(cantidad*precio_unitario)) OVER()
THEN 'Por debajo'
ELSE 'Igual'
END AS comparacion
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

---HALLAZGOS:--
--TODOS LOS CLIENTES TIENEN LA MISMA CANTIDAD DE PEDIDOS (2)--
--EL TOTAL GASTADO DEL CLIENTE 1 ES 5 VECES MAYOR QUE EL TOTAL GASTADO POR EL CLIENTE 4--
-- EL TOTAL GENERADO POR EL PRODUCTO 1 EQUIVALE A MÁS DEL 50% DE LA FACTURACION--



