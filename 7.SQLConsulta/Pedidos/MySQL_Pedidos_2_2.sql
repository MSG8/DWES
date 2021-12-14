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
