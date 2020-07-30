SELECT ProductID, SUM(Quantity) AS algo
	FROM order_details
	GROUP BY ProductID 
	ORDER BY 2 DESC;


SELECT ProductID, SUM(Quantity) AS algo
	FROM order_details
	GROUP BY ProductID 
	ORDER BY 2 DESC
    LIMIT 1;


SELECT CustomerID, COUNT(CustomerID) AS pedidos
	FROM orders
	GROUP BY CustomerID
	ORDER BY pedidos DESC;


SELECT CustomerID, COUNT(CustomerID) AS pedidos 
    FROM orders 
    GROUP BY CustomerID 
    ORDER BY pedidos DESC 
    LIMIT 1;


SELECT TOP 3 p.ProductID, p.Name AS NameProduct, COUNT(s.ProductID) AS VecesVendido
    FROM Production.Product AS p
    INNER JOIN Sales.SalesOrderDetail AS s
    ON p.ProductID = s.ProductID
    GROUP BY p.ProductID, p.Name
    ORDER BY VecesVendido DESC;


SELECT TOP 1 SUM(SalesQuota) AS CantidadVentas, YEAR(QuotaDate) AS AñoDeVenta
    FROM Sales.SalesPersonQuotaHistory AS s
    INNER JOIN Person.Person AS p
    ON s.BusinessEntityID = p.BusinessEntityID
    GROUP BY YEAR(QuotaDate)
    ORDER BY CantidadVentas ASC