-- แสดงชื่อสินค้า ชื่อสินค้า และ ราคาสินค้า
SELECT CategoryName, ProductName, UnitPrice
FROM Products, Categories
Where Products.CategoryID = Categories.CategoryID
and CategoryName = 'seafood'

SELECT CategoryName, ProductName, UnitPrice
FROM Products AS p JOIN Categories as C
ON p.CategoryID = C.CategoryID
WHERE CategoryName = 'seafood'

SeL


