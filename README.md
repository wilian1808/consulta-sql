## TAREAS SOBRE CONSULTAS SQL

El gestor de base de datos utilizada es **mysql** para *Northwind* y **sql-server** para *AdventureWorks* se trabajo de esta manera debido a algunos inconvenientes que ocurrieron al momento de instalar las respectivas bases de datos, se adjuntan los enlaces donde se encuentras las bases de datos de ejemplos usados para realizar la tarea.

- [Base de datos NorthWind para mysql](https://documentation.alphasoftware.com/documentation/pages/GettingStarted/GettingStartedTutorials/Basic%20Tutorials/Northwind/northwindMySQL.xml)
- [Base de datos AventureWorks para sql-server](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms)

#### 1. ¿Cuál es la mejor descripción para las siguientes consultas en la BD Northwind? ¿Qué devuelve cada una?
Trabajado con *MySql*

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
Cuando agregamos **Top 1** hacemos que nos devuelva tan solo la primera fila que cumpla con la consulta. El equivalente en **Mysql** es **Limit 1**.

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

Trabajado con *Sql-Server*

#### 1. Realizar una consulta que muestre los 3 productos más vendidos

```sql
SELECT TOP 3 p.ProductID, p.Name AS NameProduct, COUNT(s.ProductID) AS VecesVendido
    FROM Production.Product AS p
    INNER JOIN Sales.SalesOrderDetail AS s
    ON p.ProductID = s.ProductID
    GROUP BY p.ProductID, p.Name
    ORDER BY VecesVendido DESC;
```
> 1. Pedimos que nos seleccione el *p.ProductID*, *p.NameProduct* y la cantidad que se vendio de un producto esto lo obtenemos usando *COUNT* de *s.ProductID* de la tabla *Production.Product* que es renombrado a *p* y realizamos el respectivo *INNER JOIN* con la tabla *Sales.SalesOrderDetail* que es renombrado a *s* luego usando *ON* pasamos los valores *p.ProductID* que se compara con *s.ProductID* esto se hace para que coincidan las filas de acuerdo a los valores que se encuentran en ambas tablas, con ayuda de *GROUP BY* agrupamos las columnas que no estan ligadas a la tabla resultante y usando *ORDER BY* ordenamos de acuerdo a la cantidad de veces que se vendio un producto de forma descendente *DESC* como la pregunta nos pide los 3 productos mas vendidos agregamos despues del *SELECT* esto *TOP 3*;


| ProductID |      NameProduct     | VecesVendido |
| --------- | -------------------  | ------------ |
|    870    | Water Bottle - 30 oz |     4688     |
|    712    | AWC Logo Cap         |     3382     |
|    873    | Patch kit/8 Patches  |     3354     | 


#### 2. ¿Cual año fue el peor para las ventas?

```sql
SELECT TOP 1 SUM(SalesQuota) AS CantidadVentas, YEAR(QuotaDate) AS AñoDeVenta
    FROM Sales.SalesPersonQuotaHistory AS s
    INNER JOIN Person.Person AS p
    ON s.BusinessEntityID = p.BusinessEntityID
    GROUP BY YEAR(QuotaDate)
    ORDER BY CantidadVentas ASC;
```

| CantidadVentas | AñoDeVenta |
| -------------- | ---------- |
|   10359000.00  |    2014    |
