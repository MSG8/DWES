-- CREATE DATABASE Pedidos;
-- DROP DATABASE Pedidos;
-- USE Pedidos;

-- DROP TABLE Articulos;
-- DROP TABLE Comprador;
-- DROP TABLE Pedidos;
-- DROP TABLE Articulos_Pedidos; 

CREATE TABLE Articulos
(
    idArticulo smallint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    precio float(9,2) NOT NULL,
    descripcion text NOT NULL 
);
CREATE TABLE Comprador
(
    idComprador int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    dni char(9)  NULL,
    direccion varchar(100) NOT NULL UNIQUE
);
CREATE TABLE Pedidos
(
    idPedidos BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL DEFAULT NOW(),
    idComprador int UNSIGNED NOT NULL,
    FOREIGN KEY(idComprador) REFERENCES Comprador(idComprador)
);
CREATE TABLE Articulos_Pedidos
(
    idPedidos BIGINT UNSIGNED NOT NULL,
    idArticulo smallint UNSIGNED NOT NULL,
    cantidad tinyint UNSIGNED NOT NULL CHECK (cantidad <= 100),
    precioCompra float(9,2) NOT NULL,
    PRIMARY KEY(idArticulo, idPedidos),
    FOREIGN KEY(idArticulo) REFERENCES Articulos(idArticulo),
    FOREIGN KEY(idPedidos) REFERENCES Pedidos(idPedidos)
);

--CREAR COMPRADORES, LO HACEMOS MEDIANTE INSERT INTO
INSERT INTO Comprador(nombre,dni,direccion) VALUES ('Juan Solís Gómez','11111111A','Calle: Juan Carlos, Numero 38-A');
INSERT INTO Comprador(nombre,dni,direccion) VALUES ('Marina Jaén Diaz','22222222S','Calle: San Juan, Numero 5');
INSERT INTO Comprador(nombre,dni,direccion) VALUES ('Diego Gómez Carmona','33333333Z','Calle: Perez Galdos, Numero 15');

--PEDIDO DE VARIOS PRODUCTOS
--Colocamos los articulos si no existen aun
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Cascos apol',1000.00,'Cascos bueno pero excesivamente caros por su marca');
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Cascos epic',2.00,'Cascos bueno pero excesivamente baratos por una promocion');
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Televison gaming plus',1500.00,'Televisor de gama alta, perfecta para jugadores de videojuegos');
INSERT INTO Articulos(nombre,precio,descripcion) VALUES ('Tele cutre',10.00,'Television antigua abandonada');

--Realizamos un pedido
INSERT INTO Pedidos(idComprador) VALUES (1); -- Solo necesitamos el identificador del comprador, la fecha y el id del pedido se creara solo
INSERT INTO Pedidos(idComprador) VALUES (2);
INSERT INTO Pedidos(idComprador) VALUES (1);
INSERT INTO Pedidos(idComprador) VALUES (3);

--Con el identificador del pedido podremos colocar en la tabla de pedidos_articulos, los articulos que pide
INSERT INTO Articulos_Pedidos VALUES (1,1,5,(SELECT precio FROM Articulos WHERE idArticulo = 1)); --Guardara el precio del articulo en ese momento
INSERT INTO Articulos_Pedidos VALUES (1,2,20,(SELECT precio FROM Articulos WHERE idArticulo = 2));
INSERT INTO Articulos_Pedidos VALUES (1,3,10,(SELECT precio FROM Articulos WHERE idArticulo = 3));
INSERT INTO Articulos_Pedidos VALUES (1,4,15,(SELECT precio FROM Articulos WHERE idArticulo = 4));
--ya hemos acabado de realizar el pedido, el precio total de cada articulo y del pedido total se sacara por un calculo despues

--DESCUENTO DE 20% DE UN PRODUCTO
UPDATE Articulos SET precio = precio * 0.8 WHERE idArticulo = 1; --Actualiza el precio del articulo, pero si ya se han hecho pedidos se guardara el precio antiguo

--DEVOLVER UN PRODUCTOS
--Si devuelve un producto debemos quitar de su pedido el producto y devolverle el dinero
SELECT precioCompra * cantidad FROM Articulos_Pedidos WHERE idPedidos = 1 AND idArticulo = 1; --Asi sacamos el dinero que debemos devolverle 
DELETE FROM Articulos_Pedidos WHERE idPedidos = 1 AND idArticulo = 1; --Ya devuelto el dinero borramos el pedido de ese articulo