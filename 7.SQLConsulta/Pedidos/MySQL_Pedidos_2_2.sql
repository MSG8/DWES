-- CREATE DATABASE Pedidos; --CREAMOS LA BASE DE DATOS
-- DROP DATABASE Pedidos; --BORRAMOS LA BASE DE DATOS
-- USE Pedidos; --USAMOS LA  BASE DE DATOS QUE QUEREMOS

--BORRAMOS ALGUNA TABLA EN ESPECIFICO
-- DROP TABLE Articulos;
-- DROP TABLE Comprador;
-- DROP TABLE Pedidos;
-- DROP TABLE Articulos_Pedidos; 

CREATE TABLE Articulos --Creamos la tabla Articulos, donde se encontrara los detalles de cada articulo
(
    idArticulo smallint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, --Colocamos el numero de identificacion del producto, ademas hacemos que se autocomplete, con el smallint tendremos un rango suficiente grande de cantidades de productos
    nombre varchar(50) NOT NULL, --Nombre del producto
    precio float(9,2) NOT NULL, --Precio del producto, su rango es de 0 a maximo de XXXXXXX.XX (hasta el millon )
    descripcion text NOT NULL  -- Colocamos un campo text que permite colocar una amplia cantidad de caracteres para la descripcion
);--Cierre de la creacion de la tabla
CREATE TABLE Comprador --Creamos la tabla Comprador, donde se encuentra los detalles de los compradores
(
    idComprador int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, --Colocamos el numero de identificacion del producto, ademas hacemos que se autocomplete, con el int tendremos un rango suficiente grande de cantidades de productos, tendremos mas comprador que productos
    nombre varchar(50) NOT NULL, --Colocamos el nombre completo del comprador 
    dni char(9)  NULL,--Colocamos el dni del comprador, permitira que sea null, solo lo pedira si quiere la factura
    direccion varchar(100) NOT NULL UNIQUE--Colocamos la direccion 
);
CREATE TABLE Pedidos--Creamos la tabla Pedidos, donde se encuentra los detalles de los pedidos
(
    idPedidos BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,--Colocamos el numero de identificacion del producto, ademas hacemos que se autocomplete, con el bigint tendremos un rango suficiente grande de cantidades de productos, tendremos mas pedidos que productos (un comprador pueden hacer varios pedidos)
    fecha DATETIME NOT NULL DEFAULT NOW(), --Colocamos la fecha y hora que se realiza el pedido, tomara por defecto la fecha del sistema
    idComprador int UNSIGNED NOT NULL, --Campo hijo del identificador de la tabla Comprador, asi relacionamos la tabla Comprador y la tabla Pedidos
    totalCompra float(10,2) NULL DEFAULT NULL, --Campo que contendra la suma del precio total de cada articulo pedido y su cantidad, su rango es mayor al precio individual de su producto, por si la suma sale superior al millon, por defecto tomara el valor NULL hasta que se actualice cuando coloquemos todos los articulos pedidos para cada pedido
    FOREIGN KEY(idComprador) REFERENCES Comprador(idComprador) --Clave ajena que relaciona el idComprador de esta tabla con su tabla padre(Comprador)
);
CREATE TABLE Articulos_Pedidos--Creamos la tabla Articulos_Pedidos, donde se encuentra los detalles de los articulos pedidos por cada pedido
(
    idPedidos BIGINT UNSIGNED NOT NULL, --Campo hijo del identificador de la tabla Pedidos, asi relacionamos la tabla Pedidos y la tabla Articulos_Pedidos
    idArticulo smallint UNSIGNED NOT NULL, --Campo hijo del identificador de la tabla Articulos, asi relacionamos la tabla Articulos y la tabla Articulos_Pedidos
    cantidad tinyint UNSIGNED NOT NULL CHECK (cantidad <= 100), --Cantidad de productos pedido para un articulo, no te permite pedir mas de 100 unidades de un mismo producto
    precioCompra float(9,2) NOT NULL, --Guardamos el precio del articulo al momento de la compra, asi no perderemos este dato si se actualiza el precio del producto por algun descuento
    PRIMARY KEY(idArticulo, idPedidos), --Creamos la clave principal con el identificador de pedidos y articulos
    FOREIGN KEY(idArticulo) REFERENCES Articulos(idArticulo),--Clave ajena que relaciona el idArticulo de esta tabla con su tabla padre(Articulos)
    FOREIGN KEY(idPedidos) REFERENCES Pedidos(idPedidos)--Clave ajena que relaciona el idPedidos de esta tabla con su tabla padre(Pedidos)
);

--CREAR COMPRADORES, LO HACEMOS MEDIANTE INSERT INTO
--Colocamos su nombre, dni y direccion, ya que el identificador se crea solo.
--Si nuestro cliente no quiere factura no pondra nada en su dni y se colocara NULL
INSERT INTO Comprador(nombre,dni,direccion) VALUES ('Juan Solís Gómez','11111111A','Calle: Juan Carlos, Numero 38-A');
INSERT INTO Comprador(nombre,dni,direccion) VALUES ('Marina Jaén Diaz','22222222S','Calle: San Juan, Numero 5');
INSERT INTO Comprador(nombre,dni,direccion) VALUES ('Diego Gómez Carmona','33333333Z','Calle: Perez Galdos, Numero 15');
INSERT INTO Comprador(nombre,dni,direccion) VALUES ('Juan Diego Jaén Carmona',NULL,'Calle: Perez Galdos, Numero 25-B');--Colocamos su dni como null ya que el comprador no quiere factura
INSERT INTO Comprador(nombre,dni,direccion) VALUES ('Esperanza Gómez Solís',NULL,'Calle: Raul Galdos, Numero 10');
INSERT INTO Comprador(nombre,dni,direccion) VALUES ('Lucia Solís Jaén',NULL,'Calle: Galdos, Numero 1');

--PEDIDO DE VARIOS PRODUCTOS
--Colocamos los articulos si no existen aun, genera el identificador de forma automatica
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Cascos apol',1000.00,'Cascos bueno pero excesivamente caros por su marca');--como su identificador se hace de forma automatica solo tenemos que colocar: el nombre, el precio con 2 decimas y la descripcion
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Cascos epic',2.00,'Cascos bueno pero excesivamente baratos por una promocion'); 
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Televison gaming plus',1500.00,'Televisor de gama alta, perfecta para jugadores de videojuegos');
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Tele cutre',10.00,'Television antigua abandonada');
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Traje game squit',32.00,'Traje de los malos de la serie del juego del calamar'); 
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Juguete randon',5.00,'Pequeño juguete aleatorio(juguete cutre,juguete meh,juguete bueno, juguete plus mega)');
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Espada the Witcher',100.00,'Imitacion de buena calidad de la espada del persona del brujo de la serie The Witcher');

--Realizamos un pedido
INSERT INTO Pedidos(idComprador) VALUES (1); -- Solo necesitamos el identificador del comprador, la fecha y el id del pedido se creara solo. Ademas colocaremos el campo de totalCompra null de forma automatica, hasta que se pidan todos los articulos.
INSERT INTO Pedidos(idComprador) VALUES (2); 
INSERT INTO Pedidos(idComprador) VALUES (1); 
INSERT INTO Pedidos(idComprador) VALUES (3); 

--Con el identificador del pedido podremos colocar en la tabla de pedidos_articulos, los articulos que pide. 
INSERT INTO Articulos_Pedidos VALUES (1,1,5,(SELECT precio FROM Articulos WHERE idArticulo = 1)); --Colocamos el identificador del pedido, el identificador del producto, la cantidad del producto y toma ,mediante un select del precio del producto, el precio en el momento del pedido del produto, asi si varia solo tendremos el del momento de la compra
INSERT INTO Articulos_Pedidos VALUES (1,2,20,(SELECT precio FROM Articulos WHERE idArticulo = 2)); 
INSERT INTO Articulos_Pedidos VALUES (1,3,10,(SELECT precio FROM Articulos WHERE idArticulo = 3)); 
INSERT INTO Articulos_Pedidos VALUES (1,4,15,(SELECT precio FROM Articulos WHERE idArticulo = 4));


INSERT INTO Articulos_Pedidos VALUES (2,4,1,(SELECT precio FROM Articulos WHERE idArticulo = 4)); 
INSERT INTO Articulos_Pedidos VALUES (2,6,3,(SELECT precio FROM Articulos WHERE idArticulo = 6)); 
INSERT INTO Articulos_Pedidos VALUES (2,7,2,(SELECT precio FROM Articulos WHERE idArticulo = 7)); 

INSERT INTO Articulos_Pedidos VALUES (3,1,2,(SELECT precio FROM Articulos WHERE idArticulo = 1)); 
INSERT INTO Articulos_Pedidos VALUES (3,3,3,(SELECT precio FROM Articulos WHERE idArticulo = 3)); 
INSERT INTO Articulos_Pedidos VALUES (3,7,1,(SELECT precio FROM Articulos WHERE idArticulo = 7)); 
INSERT INTO Articulos_Pedidos VALUES (3,5,5,(SELECT precio FROM Articulos WHERE idArticulo = 5)); 
INSERT INTO Articulos_Pedidos VALUES (3,2,50,(SELECT precio FROM Articulos WHERE idArticulo = 2)); 

INSERT INTO Articulos_Pedidos VALUES (4,5,1,(SELECT precio FROM Articulos WHERE idArticulo = 5)); 
INSERT INTO Articulos_Pedidos VALUES (4,2,1,(SELECT precio FROM Articulos WHERE idArticulo = 2)); 
INSERT INTO Articulos_Pedidos VALUES (4,7,1,(SELECT precio FROM Articulos WHERE idArticulo = 7)); 

--ya hemos acabado de realizar todos los pedidos de los articulos, ahora lo sumaremos.
--Actualizamos la fila pedido actual para cambiar el valor del campo totalCompra por una suma de la cantidad de precio * cantidad donde idPedido corresponde con el nuestro
UPDATE Pedidos SET totalCompra = (SELECT SUM(precioCompra * cantidad) FROM Articulos_Pedidos WHERE idPedidos = 1) WHERE idPedidos = 1;
UPDATE Pedidos SET totalCompra = (SELECT SUM(precioCompra * cantidad) FROM Articulos_Pedidos WHERE idPedidos = 2) WHERE idPedidos = 2;
UPDATE Pedidos SET totalCompra = (SELECT SUM(precioCompra * cantidad) FROM Articulos_Pedidos WHERE idPedidos = 3) WHERE idPedidos = 3;
UPDATE Pedidos SET totalCompra = (SELECT SUM(precioCompra * cantidad) FROM Articulos_Pedidos WHERE idPedidos = 4) WHERE idPedidos = 4;

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