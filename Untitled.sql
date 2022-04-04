# 1- Obtener todos los datos de los clientes en USA,
#    ordenados por estado y por ciudad

SELECT *
FROM customers
WHERE country='USA'  
ORDER BY state, city;

# 2- Obtener el nombrel y el telefono de los clientes que viven en el estado de NY,
# que tienen un limite de crédito menor a 50000
SELECT customerName, phone
FROM customers
WHERE creditLimit < 50000 AND state = 'NY';
# 3- Obtener los datos de los productos que tienen una existencia menor
# a 500, ordenados por línea de producto y existencia
SELECT *
FROM products
WHERE quantityInStock < 500
ORDER BY productLine, quantityInStock;

