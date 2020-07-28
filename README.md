## TAREAS SOBRE CONSULTAS SQL

El gestor de base de datos utilizado es **mysql** por problemas que ocurrieron al momento de instalar el gestor de **sql server** se adjuntan los enlaces donde se encuentras las bases de datos de ejemplos usados para realizar la tarea.

- [Base de datos NorthWind para mysql](https://documentation.alphasoftware.com/documentation/pages/GettingStarted/GettingStartedTutorials/Basic%20Tutorials/Northwind/northwindMySQL.xml)
- [Base de datos AventureWorks para mysql](https://github.com/tapsey/AdventureWorksMYSQL)

#### 1. ¿Cuál es la mejor descripción para las siguientes consultas en la BD Northwind? ¿Qué devuelve cada una?

En la base de datos *NorthWind* se realizo un cambio a la tabla llamada *order details* esta fue renombrada a: *order_details*.

```sql
SELECT ProductID, SUM(Quantity) AS algo
	FROM order_details
	GROUP BY ProductID 
	ORDER BY 2 DESC;
```
> 1. Pedimos que nos retorne el *ProductID* y la suma total de la *Quantity* del producto ordenado estos deben ser ordenados de acuerdo a la cantidad de productos de forma descendiente, el numero 2 representa a la segunda columna.
> 2. Nos retorna el id del producto y la cantidad de pedidos que tuvo.

| ProductID | algo |
| --------- | ---- |
| 60        | 1577 |
| 59        | 1496 |
| 31        | 1397 |
| ...       | ...  |
| 9         | 95   |

```sql
SELECT CustomerID, COUNT(CustomerID) AS pedidos
	FROM orders
	GROUP BY CustomerID
	ORDER BY pedidos DESC;
```
> 1. Pedimos que nos retorne el *CustomerID* que tomaron un pedido y cuente de acuerdo al *CustomerID* cuantas veces el cliente realizo pedidos y lo renombramos con el nombre de *pedidos* de la tabla *orders*, los registros deben ir ordenados de acuerdo a la columna *pedidos* en forma *descendente*.
>  2. Nos retorna el id del cliente junto a la cantidad de pedidos que realizo.

| CustomerID | pedidos |
| ---------- | ------- |
| SAVEA      | 31      |
| ERNSH      | 30      |
| QUICK      | 28      |
| ...        | ...     |
| CENTC      | 1       |

#### 2. ¿Que pasa agregando TOP 1?
Cuando agregamos **Top 1** hacemos que nos devuelva tan solo la primera fila que complu con la consulta. El equivalente en **Mysql** es **Limit 1**.

```sql
SELECT ProductID, SUM(Quantity) AS algo
	FROM order_details
	GROUP BY ProductID 
	ORDER BY 2 DESC
	LIMIT 1;
```
> nos devuelve solo la primer fila:

| ProductID | algo |
| --------- | ---- |
| 60        | 1577 |

```sql
SELECT CustomerID, COUNT(CustomerID) AS pedidos 
	FROM orders 
	GROUP BY CustomerID 
	ORDER BY pedidos DESC 
	LIMIT  1;
```
> nos devuelve solo la primera fila:

| CustomerID | pedidos |
| ---------- | ------- |
| SAVEA      | 31      |

## En la base de datos AdventureWorks (explique el proceso)

#### 1. Realizar una consulta que muestre los 3 productos más vendidos

```sql
SELECT p.ProductID, p.name, COUNT(s.ProductID) AS cantidad_ventas
	FROM Product AS p INNER  JOIN SalesOrderDetail AS s
	ON p.ProductID = s.ProductID
	GROUP BY p.ProductID, p.name
	ORDER BY cantidad_ventas DESC
	LIMIT  3;
```


#### 2. ¿Cual año fue el peor para las ventas?

```sql

```