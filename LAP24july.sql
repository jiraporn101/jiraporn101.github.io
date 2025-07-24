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


 --1. แสดงจำนวนชนิดสินค้าที่มีเก็บไว้ต่ำกว่า 15 ชิ้น
SELECT COUNT(*) AS จำนวนสินค้า
FROM Products
WHERE UnitsInStock < 15;

-- 2. จำนวนลูกค้าที่อยู่ในประเทศ USA
SELECT COUNT(*) AS จำนวนลูกค้า
FROM Customers
WHERE Country = 'USA';

-- 3. จำนวนพนักงานที่อยู่ใน London
SELECT COUNT(*) AS จำนวนพนักงาน
FROM Employees
WHERE City = 'London';

-- 4. จำนวนใบสั่งซื้อที่เกิดขึ้นในปี 1997
SELECT COUNT(*) AS จำนวนใบสั่งซื้อ
FROM Orders
WHERE YEAR(OrderDate) = 1997;

SELECT count(*) FROM [Order Details] WHERE ProductID = 1

--Function Sum 
--จำนวนสินค้าที่ขายได้ทั้งหมด
SELECT Sum(Quantity)
From  [Order Details]
WHERE ProductID =2
--มูลค่าสินค้าในคลังทั้งหมด
SELECT sum (Unitprice * UnitsInStock)
From Products
--จำนวนสินค้ารหัสประเภท 8 ที่สั่งซื้อแล้ว
SELECT sum(UnitsOnOrder)
from Products
where CategoryID = 8
--function Max, min
--ราคาสินค้ารหัส 1 ที่ขายได้ราคาสูงสุดและต่ำสุด
SELECT max (Unitprice), min (Unitprice)
from [Order Details]
where productID = 71
--function AVG
--ราคาสินค้าเฉลี่ยทั้งหมดที่เคยขายได้ เฉพาะสินค้ารหัส 5
SELECT avg(UnitPrice), min (UnitPrice), max(UnitPrice)
WHERE  productID = 5

--การจัดกลุ่มข้อมูล โดยใช้ GROUP BY 
--ประเทศ และจำนวนลูกค้า
SELECT Country, count(*)
from   Customers
GROUP BY Country
--รหัสประเภทสินค้า ราคาเฉลี่ยของสินค้าประเดียวกัน
SELECT* oderID, count(*) 
from [Order Details]
GROUP BY ORDERID
--ประเทศปลายทาง และจำนวนใบสั่งซื้อที่ส่งสินค้าไปถึงปลายทาง
SELECT ShipCountry, count(*)
FROM Orders
group by ShipCountry
--
SELECT shipCountry, count(*) numOfOrders
from   Orders
GROUP BY ShipCountry
 --เงื่อนไขในการจัดกลุ่ม โดยผู้ใช้ Having
 --ต้องการเฉพาะที่มีจำนวนใบสั่งซื้อ ตั้งแต่ 100 ขึ้นไป
 SELECT ShipCountry 
 HAVING count(*)>=100
 --ข้ออมูลรหัสใบสั่งซื้อ ยอดเงินรวมใบสั้้งซื้อนั้น แสดงเฉพาะใบสั้งซื้อที่มียอดเงินน้อยกว่า 100[order details]
 SELECT orderID, sum(UnitPrice*Quantity*)(1-Discount)
 from   [oder Details]
 GROUP BY ORDERID
 HAVING sum(UnitPrice*Quantity*(1-Discount))< 100
 --ประเทศใดที่มีจำนวนใบสั่งซื้อที่ส่งสินค้าไปปลายทางต่ำกว่า 20 รายการ ในปี 1997
 SELECT Shipcountry , COUNT(*) AS numoofofrdeers
 FROM Orders
 WHERE YEAR(OrderDate)= 1997
 GROUP BY ShipCountry
 HAVING COUNT(*)<20
 ORDER BY COUNT(*) DESC

 --ใบาั่งซื้อใดมียอดขายสูงที่สุด 5 อันดับ แสดงรหัสใบสั่งซื้อและยอดขาย
 SELECT top 5 [orderID],SUM(UnitPrice*Quantity*(1-Discount)) as Total 
 from [order Details]
 GROUP BY OrderID
 ORDER BY total ASC
