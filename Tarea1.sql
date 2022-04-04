USE classicmodels;

# 1- Obtener todos los datos de los clientes en USA,
#    ordenados por estado y por ciudad
SELECT *
FROM customers
WHERE country='USA'  
ORDER BY state, city;

# 2- Obtener el nombrel y el telefono de los clientes que viven en 
#.   el estado de NY, que tienen un limite de crédito menor a 50000
SELECT customerName, phone
FROM customers
WHERE creditLimit < 50000 AND state = 'NY';

# 3- Obtener los datos de los productos que tienen una existencia menor
# a 500, ordenados por línea de producto y existencia
SELECT *
FROM products
WHERE quantityInStock < 500
ORDER BY productLine, quantityInStock desc;

#4- Mostrar el total de productos que se manejan y su precio promedio.
SELECT COUNT(*), AVG(buyPrice)
FROM products;

#5- Obtener el total de productos de la línea "Classic Models"
SELECT COUNT(*)
FROM products
WHERE productLine = "Classic Models";
# Si ponemos Classic Cars nos retorna 32.

#6- Obtener el limite de crédito máximo que se ha otorgado.
SELECT MAX(creditLimit)
FROM customers;

#7- Obtener los datos de los productos de la línea Classic Cars
SELECT * 
FROM products p
WHERE p.productLine = "Classic Cars";

#8- Obtener los datos de los empleados que trabajan en la 
#   oficina localizada en Boston
SELECT employees.*
FROM employees, offices
WHERE city = 'Boston';

SELECT employees.*
FROM employees
INNER JOIN offices ON offices.city = "Boston";



# EXTRA
SELECT productName, products.productLine, textDescription
FROM products, productLines
WHERE products.productLine = productLines.productLine;

