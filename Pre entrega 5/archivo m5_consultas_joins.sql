USE Ventas_Tech_DB;

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM  ventas;

SELECT 
v.fecha_venta,
cl.id_cliente,
cl.nombre,
p.nombre_producto,
cat.nombre_categoria,
cat.descripcion,
cl.ciudad,
v.cantidad,
v.precio_unitario,
(v.cantidad * v.precio_unitario) AS total_venta
FROM ventas AS v
INNER JOIN clientes AS cl
ON v.id_cliente=cl.id_cliente
INNER JOIN productos AS p
ON v.id_producto=p.id_producto
INNER JOIN categorias AS cat
ON p.id_categoria=cat.id_categoria;

SELECT 
cl.nombre,
cl.email,
cl.fecha_registro
FROM clientes AS cl
LEFT JOIN ventas AS v
ON cl.id_cliente=v.id_cliente
WHERE v.id_venta is NULL;

SELECT
p.nombre_producto,
cat.nombre_categoria,
p.precio
FROM productos AS p
INNER JOIN categorias AS cat
ON p.id_categoria=cat.id_categoria
LEFT JOIN ventas AS v
ON p.id_producto=v.id_producto
WHERE v.id_venta is NULL;

SELECT canal, SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Buenos Aires' AS canal
    FROM ventas AS v
    INNER JOIN clientes AS cl
    ON v.id_cliente=cl.id_cliente
    WHERE cl.ciudad='Buenos Aires'
    UNION ALL
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Rosario' AS canal
    FROM ventas as v
    INNER JOIN clientes as cl
    ON v.id_cliente=cl.id_cliente
    WHERE cl.ciudad='Rosario'
) AS consolidado
GROUP BY canal;
