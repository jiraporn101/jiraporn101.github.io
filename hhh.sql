SELECT PRODUCTID, PRODUCTNAME,
UnitPrice, UnitsInStock,UnitPrice * UnitsInStock AS StockValue

FROM Products

SELECT ProductID as รหัส, ProductName as สินค้า,UnitsinStock + UnitsOnOrder as จำนสนคงเหลิอทั้งหมด,ReorderLevel as จุดคำสั่งซื้อ
FROM Products
where (UnitsInStock + UnitsOnOrder) < ReorderLevel

Select ProductID, ProductName,UnitPrice, ROUND(UnitPrice * 0.07,2) As Vat7
From Products

Select employeeID, TitleOfCourtesy+FirstName+space(1)+LastName as [Employee Name]
From Employees

Select employeeID, TitleOfCourtesy+FirstName+''+LastName as [Employee Name]
From Employees

Select orderID, ProductID, UnitPrice, Quantity, Discount,
	(UnitPrice* Quantity) as TotalPrice,
	(UnitPrice* Quantity) as DiscountPrice,
	(UnitPrice*Quantity)-(UnitPrice* Quantity*Discount) as NetPrice
from [Order Details]

Select orderID, ProductID, UnitPrice, Quantity, Discount,
	(UnitPrice* Quantity) as TotalPrice,
	(UnitPrice* Quantity) as DiscountPrice,
	UnitPrice*Quantity*(1-Discount) as NetPrice
from [Order Details]

Select (42.40*35) - (42.40*35*0.15)

Select employeeID, firstName, BirthDate, Datediff(YEAR,BirthDate,'2024-12-31') Age,
	HireDate, DATEDIFF(YEAR,HireDate,GETDATE()) YearInOffice
from employees

SELECT GETDATE()
---------------------------------------------------------------
Aggrete FUNCTION หรือ GROUP FUNCTION (Sum, COUNT, Min, AVG,......)
---แสดงจำนวนชนิดสินค้าที่มีเก็บไว้ต่ำกว่า 15 ชิ้น
    SELECT COUNT(*) AS จำนวนสินค้า, COUNT(Prodact),COUNT(proDactID), count(UnitPrive)
    FROM Prodact
    WHERE  Unitsints <15
   --- จำนวนลูกค้าที่ประเทศ USER
    SELECT count (*) from CustomersN = 'USA'
     ---จำนวนใบที่สัั่งซื้อที่อยู่ใน londov 
    SELECT count (*) FROM Employees where  Cuty ='Londonn'
--- จำนวนดอกไม้ที่ออกในปี 1997
    SELCT count (*) from order where City 



    
