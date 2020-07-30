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


SELECT p.ProductID, p.name, COUNT(s.ProductID) AS cantidad_ventas
    FROM Product AS p INNER JOIN SalesOrderDetail AS s
    ON p.ProductID = s.ProductID
    GROUP BY p.ProductID, p.name
    ORDER BY cantidad_ventas DESC
    LIMIT 3;



RESTORE DATABASE AdventureWorks FROM DISK = '/var/opt/mssql/backup/AdventureWorks2019.bak' WITH MOVE 'AdventureWorks2019_Data' TO '/var/opt/mssql/data/AdventureWorks2019_Data.mdf'


19_Data.mdf', MOVE 'AdventureWorks2019_Log' TO '/var/opt/mssql/data/AdventureWorks2019_log.ldf'
2> GO
