--DESCUENTO DE 20% DE UN PRODUCTO
UPDATE Articulos SET precio = precio * 0.8 WHERE idArticulo = 1; --Actualiza el precio del articulo, pero no en precio que se guarda al hacer el pedido. Asi cuando se hagan nuevos pedidos se haran con el precio actual y si necesitamos sacar un precio anterior por un pedido se encontrara en nuestro campo precioCompra de Articulo_Pedido

--DEVOLVER UN PRODUCTOS
--Si devuelve un producto debemos quitar de su pedido el producto y devolverle el dinero, si se ha pedido devolver menos de la cantidad del pedido se devolvera lo pedido y se actualizara la fila
SELECT precioCompra * 5, NOW() FROM Articulos_Pedidos WHERE idPedidos = 1 AND idArticulo = 2; --Asi sacamos el dinero que debemos devolverle y la fecha de la devolucion
UPDATE Articulos_Pedidos SET cantidad = cantidad - 5 WHERE idPedidos = 1 AND idArticulo = 2; --Actualiza la fila de para colocar la cantidad del producto ahora pedido
UPDATE Pedidos SET totalCompra = (SELECT SUM(precioCompra * cantidad) FROM Articulos_Pedidos WHERE idPedidos = 1) WHERE idPedidos = 1;--Actualizamos el total de la compra ya que ahora hay menos productos

--Si pide la cantidad total del producto le devolveremos el dinero total y vaciar la cantidad de producto pedido
SELECT precioCompra * cantidad, NOW() FROM Articulos_Pedidos WHERE idPedidos = 1 AND idArticulo = 2; --Asi sacamos el dinero que debemos devolverle y la fecha de la devolucion 
UPDATE Articulos_Pedidos SET cantidad = 0 WHERE idPedidos = 1 AND idArticulo = 2; --Actualiza la fila si la cantidad del producto es 0, significa que el articulo se ha devuelto por completo, pero quedamos registro de que se pidio ese producto
UPDATE Pedidos SET totalCompra = (SELECT SUM(precioCompra * cantidad) FROM Articulos_Pedidos WHERE idPedidos = 1) WHERE idPedidos = 1;--Actualizamos el total de la compra ya que ahora hay un articulo menos


--CONSULTAS AGREGADOS

--PARA SABER EL NUMERO DE COMPRADORES QUE NO PIDIERON FACTURACION
SELECT COUNT(nombre) 
FROM Comprador 
WHERE dni IS NOT NULL; --SI TIENE DNI PUESTO SIGNIFICARIA QUE SI DESEABA UNA FACTURA

--PARA SABER EL NUMERO DE COMPRADORES QUE PIDIERON FACTURACION
SELECT COUNT(nombre) 
FROM Comprador 
WHERE dni IS NULL;

--CUENTAME CUANTOS ARTICULOS Y LA MEDIA DE ESOS ARTICULOS
SELECT COUNT(nombre), AVG(precio) 
FROM Articulos;

--CUENTA LA CANTIDAD Y LA MEDIA DE ARTICULOS QUE SU PRECIO ES MAYOR A 300
SELECT COUNT(nombre), AVG(precio) 
FROM Articulos 
WHERE precio >= 300;

--CUENTA EL NUMERO DE PEDIDOS, LA SUMA DEL IMPORTE DE TODAS LAS COMPRAS TOTALES, EL IMPORTE TOTAL MAYOR, EL IMPORTE TOTAL MENOR Y LA MEDIA DE IMPORTE TOTALES DE LOS PEDIDOS HECHOS EN 2021
SELECT COUNT(*) 'Cantidad de pedidos', SUM(totalCompra) 'Suma de todas las ventas', MAX(totalCompra) 'La compra maxima', MIN(totalCompra) 'La compra minima', AVG(totalCompra) 'La media de compras' 
FROM Pedidos 
WHERE fecha BETWEEN '2021-01-01' AND '2022-01-01';

-- CUENTA EL NUMERO DE PEDIDOS, LA MEDIA DE LAS COMPRAS, LA COMPRA MAS CARA, LA COMPRA MAS BARATA Y EL CANTIDAD DE DINERO GASTADO EN TOTAL DE CADA COMPRADOR
SELECT COUNT(*) 'Cantidad de pedidos', AVG(totalCompra) 'Media de gasto', MAX(totalCompra) 'Mayor compra', MIN(totalCompra) 'Menor compra', SUM(totalCompra) 'Total de gastos'
FROM Pedidos
GROUP BY idComprador;

--CANTIDAD DE ARTICULOS DIFERENTES COMPRADOS EN UN PEDIDO
SELECT idPedidos, COUNT(*) 'Cantidad de articulos diferentes comprados' 
FROM Articulos_Pedidos 
GROUP BY idPedidos;

--CANTIDAD DE ARTICULOS DIFERENTES Y QUE SU PRECIO SEA MAYOR A 10 COMPRADOS EN UN PEDIDO
SELECT idPedidos, COUNT(*) 'Cantidad de articulos diferentes comprados' 
FROM Articulos_Pedidos 
WHERE precioCompra > 10
GROUP BY idPedidos;

--CANTIDAD DE ARTICULOS DIFERENTES COMPRADOS EN UN PEDIDO PERO QUE TENGAN MAS DE 3 PRODUCTOS DIFERENTES COMPRADOS
SELECT idPedidos, COUNT(*) 'Cantidad de articulos diferentes comprados' 
FROM Articulos_Pedidos 
GROUP BY idPedidos
HAVING COUNT(*) > 3;

--CANTIDAD DE ARTICULOS DIFERENTES Y QUE SU PRECIO SEA MAYOR A 10 COMPRADOS EN UN PEDIDO, ADEMAS SOLO MOSTRARAS LOS DE COMO MINIMO TENGAN 2 ARTICULOS COMPRADOS
SELECT idPedidos, COUNT(*) 'Cantidad de articulos diferentes comprados' 
FROM Articulos_Pedidos 
WHERE precioCompra > 10
GROUP BY idPedidos
HAVING COUNT(*) > 3;

--CUENTAME EL NUMERO DE DEVOLUCIONES QUE HAY
SELECT COUNT(*) 'Cantidad de devoluciones' 
FROM Articulos_Pedidos 
WHERE cantidad = 0;--SABEMOS QUE ES UNA DEVOLUCION YA QUE LA CANTIDAD DE PRODUCTOS ES 0

--CUENTAME EL NUMERO DE DEVOLUCIONES QUE TIENE CADA ARTICULO
SELECT idArticulo Articulo,COUNT(*) 'Cantidad de devoluciones' 
FROM Articulos_Pedidos 
WHERE cantidad = 0
GROUP BY idArticulo;

--CUENTAME LA CANTIDAD TOTAL DE PRODUCTOS COMPRADOS EN CADA PEDIDO
SELECT idPedidos Articulo, SUM(Cantidad)  'Cantidad de productos' 
FROM Articulos_Pedidos 
GROUP BY idPedidos;

--DIME EL NOMBRE DEL PRODUCTO  DE LOS PRODUCTOS PEDIDOS Y ADEMAS SU PRECIO DE COMPRA Y ACTUAL. TAMBIEN DEBEMOS VER SU ID DE PEDIDO Y ORDENARLO POR ESTE
SELECT ap.idPedidos, a.nombre, ap.cantidad, a.precio 'Precio actual', ap.precioCompra  'Precio de compra'
FROM Articulos a INNER JOIN Articulos_Pedidos ap 
ON a.idArticulo = ap.idArticulo
ORDER BY idpedidos;

-- DIME EL IDENTIFICADOR DEL COMPRADOR DE CADA PEDIDO, ADEMAS ORDENALO POR EL ID DE LOS PEDIDOS
SELECT ap.idPedidos, idComprador
FROM Pedidos p INNER JOIN Articulos_Pedidos ap 
ON p.idPedidos = ap.idPedidos
ORDER BY p.idPedidos;

-- SACAME EL ID PEDIDOS, EL ID DEL COMPRADOR Y EL NOMBRE DEL COMPRADOR, ADEMAS ORDENALO POR ID DE LOS PEDIDOS
SELECT p.idPedidos, p.idComprador, c.nombre
FROM Pedidos p INNER JOIN Comprador c 
ON p.idComprador = c.idComprador
ORDER BY p.idPedidos;

-- SACAME EL ID DEL PEDIDO, EL NOMBRE DEL ARTICULO, LA CANTIDAD DEL ARTICULO, EL PRECIO DE COMPRA, EL PRECIO ACTUAL Y EL NOMBRE DEL COMPRADOR PARA TODOS LOS PEDIDOS. ADEMAS ORDENALO POR ID DLE PEDIDO
-- SACA SOLAS LAS QUE SU PRECIO EN EL MOMENTO DE LA COMPRA SON MAYOR A30 Y SEA MAS 1 ARTICULO DEL MISMO PRODUCTO
SELECT p.idPedidos 'Numero de pedido', c.nombre 'Nombre comprador',a.nombre 'Nombre articulo', ap.cantidad 'Cantidad', a.precio 'Precio actual', ap.precioCompra  'Precio de compra'
FROM Articulos a INNER JOIN Articulos_Pedidos ap 
ON a.idArticulo = ap.idArticulo
INNER JOIN Pedidos p
ON ap.idPedidos = p.idPedidos
INNER JOIN Comprador c
ON p.idComprador = c.idComprador
WHERE ap.precioCompra > 30 AND ap.cantidad > 1
ORDER BY p.idPedidos;

-- SACA EL ID DEL PEDIDO, LA MEDIA DEL PREIO DE COMPRA ACTUAL, LA MEDIA DEL PRECIO DE COMPRA EN EL MOMENTO DE LA COMPRA, LA FECHA DE COMPRA Y EL NOMBRE DEL COMPRADOR DE CADA PEDIDO
-- ADEMAS DEBEN SER PEDIDO QUE PIDAN ARTICULOS MAS CAROS DE 30 EUROS Y QUE LA CANTIDAD DE ESE PRODUCTO SEA MAYOR A 1
-- Y SOLO MOSTARA LAS FILAS QUE SU MEDIA DE PRECIO ACTUAL Y SU MEDIA DE PRECIO EN EL MOMENTO DE LA COMPRA NO SEA IGUAL
SELECT p.idPedidos 'Numero de pedido',  AVG(a.precio * ap.cantidad) 'Media del precio de compra actual', AVG(ap.cantidad * ap.precioCompra) 'Media del precio de compra', p.fecha 'Fecha de compra', c.nombre 'Nombre comprador'
FROM Articulos a INNER JOIN Articulos_Pedidos ap 
ON a.idArticulo = ap.idArticulo
INNER JOIN Pedidos p
ON ap.idPedidos = p.idPedidos
INNER JOIN Comprador c
ON p.idComprador = c.idComprador
WHERE ap.precioCompra > 30 AND ap.cantidad >1
GROUP BY p.idPedidos
HAVING AVG(a.precio * ap.cantidad) <> AVG(ap.cantidad * ap.precioCompra)
ORDER BY p.idPedidos;