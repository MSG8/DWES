-- SELECIONA TODAS LAS COLUMNAS * DE LA TABLA employee
SELECT * 
FROM employee;

--SELECCIONA UNAS COLUMNAS ESPECIFICAS DE LA TABLA employee, y su orden mostrado
SELECT fname, title, end_date, start_date 
FROM employee;

SELECT fname, end_date, title,  start_date 
FROM employee;

-- Tambien puedo colocarles alias de diferentes formas
SELECT fname AS Nombre, title, end_date AS 'fecha fin', start_date 'fecha inicio'
FROM employee;

-- EL SELECT DISTINCT SELECIONA A FILAS QUE SEAN DISTINTAS, ES DECIR, SI HAY VARIAS IGUALES SOLO TOMA 1
SELECT open_date   
FROM account;

SELECT DISTINCT open_date  --CON TANTAS COLUMNAS COMO LE PONGAMOS
FROM account;

-- SI QUEREMOS FILTRAR LA INFORMACION USAREMOS EL WHERE
SELECT * 
FROM account
WHERE open_date = '2000-01-15';

-- WHERE CON COMPARATIVOS
-- MAYOR O IGUAL
SELECT *   
FROM product
WHERE date_offered >= '2000-06-01';

-- MENOR O IGUAL
SELECT *   
FROM product
WHERE date_offered <= '2000-06-01';

-- IGUAL
SELECT *   
FROM product
WHERE date_offered = '2000-06-01';

-- DIFERENTE
SELECT *   
FROM product
WHERE date_offered <> '2000-06-01';

-- ES IGUAL QUE EL DIFERENTE
SELECT *   
FROM product
WHERE NOT date_offered = '2000-06-01';

-- ORDENAR EL SELECT
-- ORDENAS POR UN CAMPO DE MANERA ASCENDENTE, DE MENOR A MAYOR
SELECT *   
FROM product
WHERE date_offered <> '2000-06-01'
ORDER BY date_offered ASC;

-- ORDENAS POR UN CAMPO DE MANERA ASCENDENTE, DE MENOR A MAYOR, SI NO PONES NADA LO HACE TAMBIEN
SELECT *   
FROM product
WHERE date_offered <> '2000-06-01'
ORDER BY date_offered ;

-- ORDENAS POR UN CAMPO DE MANERA DESCENDIENTE, DE MAYOR A MENOR
SELECT *   
FROM product
WHERE date_offered <> '2000-06-01'
ORDER BY date_offered DESC; --SE PUEDE ORDENAR POR UN CAMPO DE LA TABLA AUNQUE NO SE INDIQUE ESTE EN EL SELECT, EL SELECT SOLO MUESTRA LOPEDIDO PERO SE TABLA CON TODA LA TABLA

-- OPERADORES LOGICOS
-- Con AND le decimos que debe cumplir ambos where
SELECT CONCAT(CONCAT(fname,' '),lname)AS 'Nombre completo', birth_date AS nacimiento
FROM individual
WHERE birth_date > '1950-01-01' AND birth_date < '1970-01-01' 
ORDER BY 'Nombre completo';

-- Con OR le decimos que debe cumplir uno o otro where
SELECT CONCAT(CONCAT(fname,' '),lname)AS 'Nombre completo', birth_date AS nacimiento
FROM individual
WHERE birth_date < '1950-01-01' OR birth_date > '1970-01-01' 
ORDER BY 'Nombre completo';

-- WHERE CON IN, IS, BETWEEN, LIKE
-- LIKE, USA PARA UN WHERE DONDE SE BUSCA ALGO PARECIDO, SE USA PARA CADENA DE CARACTERES
SELECT CONCAT(CONCAT(fname,' '),lname)AS 'Nombre completo', birth_date AS nacimiento
FROM individual
WHERE fname LIKE '%char%' --BUSCA SI SU NOMBRE CUENTA CON LOS CARACTERES CHAR EN ALGUN MOMENTO
-- WHERE NOT fname LIKE '%char%' 
-- WHERE lname LIKE 't%' BUSCA QUE EMPIECE CON T Y LO DEMAS LOS CARACTERES QUE SEAN
ORDER BY nacimiento;

-- IN, USADO PARA UN VALOR EXACTO, ES MAS EFICAZ Y CORRECCTO QUE USAR = Y SE USA EN LAS CADENAS
SELECT CONCAT(CONCAT(fname,' '),lname)AS 'Nombre completo', birth_date AS nacimiento
FROM individual
WHERE fname IN ('John','Charles') -- SACA LAS FILAS QUE COINCIDA SU NOMBRE
WHERE NOT fname IN ('John','Charles') -- SE PUEDE APLICAR EL NOT Y LO QUE HARAS SERA LO CONTRARIO
ORDER BY nacimiento;

-- BETWEEN, BUSCA LOS VALORES ENTRE UN RANGO
SELECT CONCAT(CONCAT(fname,' '),lname)AS 'Nombre completo', birth_date AS nacimiento
FROM individual
WHERE birth_date BETWEEN '1950-01-01' AND '1970-01-01' 
ORDER BY 'Nombre completo';

--IS NULL / IS NOT NULL USADO PARA SABER SI UN VALOR ESTA VACIO O NO
SELECT fname, lname
FROM employee 
WHERE end_date IS NOT NULL;

SELECT fname, lname
FROM employee
WHERE end_date IS NULL;

-- UNION, SIRVE PARA UNIR UNA TABLA, ES DIFERENTE A JOIN. LOS UNES VERTICALMENTE 
-- DEBE RESPETAR LA CANTIDAD DE CAMPOS
-- NO PUEDES MEZCLAR CAMPOS DE DIFERENTES TIPOS, DEBEN SER PARECIDOS
-- HACE COMO SELECT DISTINCT, SI HAY MAS DE UNA FILA IGUAL TOMA SOLA 1
-- EN SI SE USA PARA SUMAR FILAS IGUALES DE DIFERENTES TABLAS, PARA ORDENARLAS O USAR UN FILTRO PARA TODOS
SELECT fname AS Nombre,lname AS Apellido
FROM employee
UNION
SELECT fname,lname
FROM individual;

SELECT fname AS Nombre,lname AS Apellido
FROM employee
UNION
SELECT fname,lname
FROM individual
ORDER BY Nombre; --SE PUEDE ORDENAR LA TABLA RESULTANTE POR UN MISMO FILTRO

SELECT fname AS Nombre -- COMPROBAMOS QUE COMO EL DISTINCT, COMO SE REPITE VALORES SOLO SE PONE UNA FILA
FROM employee
UNION
SELECT fname
FROM individual
ORDER BY Nombre;

SELECT fname AS Nombre
FROM employee
UNION ALL -- CON UNION ALL NO REALIZA EL 'DISTINCT'
SELECT fname
FROM individual
ORDER BY Nombre;

SELECT CONCAT(fname,' ',lname) AS Nombre
FROM employee
UNION
SELECT CONCAT(fname,' ',lname)
FROM individual
ORDER BY Nombre;

-- SUBCONSULTAS, SON CONSULTAS DENTRO DE CONSULTAS, SE HACEN EN CASCADAS Y TANTAS COMO NECESITEMOS
SELECT emp_id AS Identificador, CONCAT(fname,' ',lname) AS 'Nombre Completo'
FROM employee
WHERE title IN (SELECT title 
                FROM employee 
                WHERE title LIKE '%Teller%')
ORDER BY CONCAT(fname,' ',lname);

--FUNCIONES ESCALARES, SON FUNCIONES QUE SUELEN SER INDIVIDUALES
LCASE(titulo) --Los convierte en minusculas
CONCAT(string,string,string) --CONCATENA
* --MULTIPLICA

--https://mariadb.com/kb/en/built-in-functions/ enlace de las funciones (XAMPP)

--FUNCIONES AGREGADOS, SON FUNCIONES DIRIGIDAS A GRUPOS
--CUENTA LO QUE LE PIDAS, COUNT()
SELECT COUNT(*) AS 'Cantidad Empleados'
FROM employee; 
--CUENTA LOS COUNT DIFERENTES
SELECT COUNT(DISTINCT, IdDpto) --TOTAL DE DEPARTAMENTOS CON ALGUN EMPLEADO
FROM Empleados

SELECT COUNT(IdDpto) --TOTAL DE EMPLEADO DE LOS DEPARTAMENTOS
FROM Empleados

--MAX toma el mayor de la columna, MIN toma el menor de la columna
SELECT COUNT(*) AS 'Cantidad de account', MAX(avail_balance) AS 'balance maximo', MIN(avail_balance) AS 'balance minimo'
FROM account;
--AVG da la media de la columna, SUM da la suma de la columna
SELECT COUNT(*) AS 'Cantidad de account', MAX(avail_balance) AS 'balance maximo', MIN(avail_balance) AS 'balance minimo', AVG(avail_balance) AS 'balance media', SUM(avail_balance) AS 'suma de balance'
FROM account;

--CONSULTAS DE AGRUPACIONES, PARA HACER UN DISTINT COMO EN SLEECT PERO PARA FUNCIONES AGREGADAS USAREMOS GROUP BY
-- NO TIENE SENTIDO USAR EL GROUP BY Y PEDIR ALGO INDIVIDUAL COMO UN TITULO, NOMBRE, APELLIDO..
-- PODEMOS FILTRAR LA CANTIDAD POR UN WHERE

-- CONTAMOS CUANTOS ACCOUNT HAY EN UNA DETERMINADA EMPRESA
SELECT COUNT(account_id), open_branch_id, AVG(open_date)
FROM account
GROUP BY open_branch_id; -- PUEDE AGRUPAR MAS DE UNA VEZ COMO anio,mes , primero agrupa por año y despues por mes

-- LO FILTRAMOS POR LOS ACCOUNT MAYORES DE PRINCIPIOS DE 2002
SELECT COUNT(account_id), open_branch_id, AVG(open_date)
FROM account
WHERE open_date >= '2002-01-02'
GROUP BY open_branch_id
ORDER BY AVG(open_date);

--HAVING, PERMITE FILTRAR LA TABLA, ES DECIR, DESPUES DEL WHERE QUE FILTRA LAS FILAS QUE SACA EL SELECT, HAVING FILTRARIA ESAS FILAS TOTALES (TABLA DEL SELECT)
-- SE APLICA CUANDO BUSCAS FILTRAR POR UN CONJUNTO DE VALORES
SELECT COUNT(account_id), open_branch_id, AVG(open_date)
FROM account
WHERE open_date >= '2002-01-02'
GROUP BY open_branch_id
HAVING COUNT(account_id) > 3
ORDER BY AVG(open_date);

--CONSULTAS DE DOS TABLAS, JOIN
-- PARA QUE SE REALIZEN CONSULTAS MULTITABLAS NECESITAS QUE ALGUN CAMPO ESTE RELACIONDO ENTRE SI EN LAS TABLAS

-- CONSULTA MULTITABLAS SIN JOIN, NO RECOMENDADO
SELECT p.name, t.name, p.product_type_cd
FROM product AS p, product_type AS t 
WHERE p.product_type_cd = t.product_type_cd --USO EXTRAÑO DEL WHERE
AND p.date_retired IS NOT NULL;

-- TENEMOS VARIOS JOIN 
-- INNER JOIN[TIENE TODOS RELACIONADOS SI QUEDA ALGUNO SIN COMPARATIVA NO LO MUESTRA]
-- CUANDO HACES UN INNER JOIN DEBES TENER CUIDADO CON LA AMBIGÜEDAD
SELECT p.name, t.name, p.product_type_cd
FROM product p INNER JOIN product_type t
ON p.product_type_cd = t.product_type_cd;

SELECT p.name, t.name, p.product_type_cd
FROM product p INNER JOIN product_type t
ON p.product_type_cd = t.product_type_cd
WHERE p.date_retired IS NOT NULL; --MAS ESTRUCTURADO
-- LEFT JOIN[TIENE LOS RELACIONADOS Y LOS QUE NO DE LA TABLA IZQUIERDA]
SELECT p.name, t.name, p.product_type_cd
FROM product p LEFT JOIN product_type t
ON p.product_type_cd = t.product_type_cd
WHERE p.date_retired IS NOT NULL; --MAS ESTRUCTURADO
-- RIGHT JOIN[TIENE LOS RELACIONADOS Y LOS QUE NO DE LA TABLA DERECHA]
SELECT p.name, t.name, p.product_type_cd
FROM product p RIGHT JOIN product_type t
ON p.product_type_cd = t.product_type_cd
WHERE p.date_retired IS NOT NULL; --MAS ESTRUCTURADO
-- FULL JOIN[TIENE LOS RELACIONADOS Y LOS QUE NO DE LAS DOS TABLA]
SELECT p.name, t.name, p.product_type_cd
FROM product p FULL JOIN product_type t
ON p.product_type_cd = t.product_type_cd
WHERE p.date_retired IS NOT NULL; --MAS ESTRUCTURADO
-- CROSS JOIN, CRUZA LOS VALORES DE COLUMNAS ENTRE SI, ES DECIR SI EN UNA TABLA TIENE 10 FILAS Y EN OTRA TENEMOS 5, SACARA 50 FILAS
-- ES COMO USAR UNA CONSULTA MULTI-TABLA SIN INNER
SELECT p.name, t.name, p.product_type_cd
FROM product p CROSS JOIN product_type t;
-- SE SUELE USAR CON UNA TABLA SIN RELACION DE UNA TABLA CON SOLO UNA FILA, ASI SI PARA TODAS LAS FILAS SIEMPRE VAS A TENER QUE COLOCAR ESE DATO NO HACE FALTA QUE LA PONGAS
SELECT name,precioD,precioC
FROM inscripcion CROSS JOIN datos;
-- Devuelve todas las filas inscripciones junto al campo precio de la tabla datos

-- PRUEBAS
-- SACA LAS CONSULTAS QUE COINCIDAD EL ID DEL CUST
SELECT name AS 'Nombre Empresa', address AS Direccion, city AS Ciudad
FROM customer c INNER JOIN business b
ON c.cust_id = b.cust_id;
--SACA TODAS LAS FILAS DE BUSINESS Y LAS QUE JUNTO A ESAS COINCIDAN
SELECT name AS 'Nombre Empresa', address AS Direccion, city AS Ciudad
FROM customer c RIGHT JOIN business b
ON c.cust_id = b.cust_id;
-- SACA TODAS LAS FILAS DE CUSTOMER, COINCIDAN O NO CON BUSINESS, SI NO LO HACE SE COLOCARA NULL
SELECT name AS 'Nombre Empresa', address AS Direccion, city AS Ciudad
FROM customer c LEFT JOIN business b
ON c.cust_id = b.cust_id;

--INNER JOIN DE 3 TABLAS, USO EL LEFT PARA QUE SIEMPRE TENGA TODAS LAS FILAS DE CUSTOMER, ASI VERE LAS FILAS QUE NO TENGAN NOMBRE DE INDIVIDUAL Y LAS QUE NO TENGAN NOMBRE DE EMPRESA
SELECT CONCAT(fname,' ',lname) AS 'Nombre Indicual', name AS 'Nombre Empresa', address AS Direccion, city AS Ciudad
FROM customer c LEFT JOIN individual i
ON c.cust_id = i.cust_id
LEFT JOIN business b
ON c.cust_id = b.cust_id

-- CONSULTAS REFLEXIVAS
-- Trata de usar una misma tabla para hacer un JOIN, por ejemplo si tenemos una tabla empleado que cuenta con un campo jefe y un campo id_empleado, puede darse el caso que un empleado sea jefe de alguien y asu vez empleado de alguien
-- Para eso usaremos un AS para cada tabla, aunque sea la misma tabla, asi se duplicara y podremos copararlas entre si.
SELECT e.emp_id ID, CONCAT(e.fname,' ',e.lname) AS nombreEmpleado, CONCAT(s.fname,' ',s.lname) AS nombreSuperior, e.title AS tituloEmpleado
FROM employee e LEFT JOIN employee s 
ON s.emp_id = e.superior_emp_id -- TOMA A TODOS LOS EMPLEADOS, Y SI EL ID DEL EMPLEADO COINCIDE CON EL ID DEL SUPERIOR COLOCA EL NOMBRE DEL SUPERIOR
ORDER BY e.emp_id;

-- CONSULTAS CON SU MISMA TABLA
-- Simplemente, se usa un AS diferente para cada tabla, cuando le aplicas el AS estas copiando esta tabla.
SELECT e.emp_id ID, CONCAT(e.fname,' ',e.lname) AS nombreEmpleado, CONCAT(s.fname,' ',s.lname) AS nombreSuperior, e.title AS tituloEmpleado
FROM employee e LEFT JOIN employee s 
ON s.emp_id = e.superior_emp_id -- TOMA A TODOS LOS EMPLEADOS, Y SI EL ID DEL EMPLEADO COINCIDE CON EL ID DEL SUPERIOR COLOCA EL NOMBRE DEL SUPERIOR
ORDER BY e.emp_id;

SELECT e.emp_id ID, CONCAT(e.fname,' ',e.lname) AS nombreEmpleado, CONCAT(s.fname,' ',s.lname) AS nombreSuperior, e.title AS tituloEmpleado
FROM employee e INNER JOIN employee s 
ON s.emp_id = e.superior_emp_id --  SI EL ID DEL EMPLEADO COINCIDE CON EL ID DEL SUPERIOR COLOCA EL NOMBRE DEL SUPERIOR, PONDRA LAS QUE LO TENGA, SI NO TIENE VALOR NOO LO CALACARA
ORDER BY e.emp_id;