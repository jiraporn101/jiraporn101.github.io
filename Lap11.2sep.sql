--- Sub Query

-- ต้องการข้อมูลคนที่มีตำแหน่งเดียวกับ Nancy
-- 1. หาตำแหน่งของ Nancy ก่อน
SELECT Title 
FROM Employees 
WHERE FirstName = 'Nancy';

-- 2. หาข้อมูลคนที่มีตำแหน่งเดียวกันกับ Nancy
SELECT * 
FROM Employees
WHERE Title = (
    SELECT Title 
    FROM Employees
    WHERE FirstName = 'Nancy'
);

-- ต้องการชื่อนามสกุลพนักงานที่มีอายุมากที่สุด (วันเกิดน้อยที่สุด)
SELECT FirstName, LastName 
FROM Employees
WHERE BirthDate = (
    SELECT MIN(BirthDate) 
    FROM Employees
);

-- ต้องการชื่อสินค้าที่มีราคามากกว่าสินค้า Ikura
SELECT ProductName 
FROM Products
WHERE UnitPrice > (
    SELECT UnitPrice 
    FROM Products
    WHERE ProductName = 'Ikura'
);

-- ต้องการชื่อบริษัทลูกค้าที่อยู่เมืองเดียวกับบริษัท Around the Horn
SELECT CompanyName 
FROM Customers
WHERE City = (
    SELECT City 
    FROM Customers
    WHERE CompanyName = 'Around the Horn'
);

-- ต้องการชื่อนามสกุลพนักงานที่เข้างานล่าสุด (วันที่เริ่มงานมากที่สุด)
SELECT FirstName, LastName 
FROM Employees
WHERE HireDate = (
    SELECT MAX(HireDate) 
    FROM Employees
);

---------------------------------------------------
-- การใส่ตัวเลขลำดับ
-- ต้องการข้อมูลสินค้าที่มีราคาน้อยกว่า 50$
SELECT ROW_NUMBER() OVER (ORDER BY UnitPrice DESC) AS RowNum,
       ProductName, UnitPrice
FROM Products
WHERE UnitPrice < 50;

---------------------------------------------------
-- คำสั่ง DML (Insert, Update, Delete)
SELECT * FROM Shippers;

-- คำสั่ง Insert (ตาราง PK เป็น AutoIncrement)
INSERT INTO Shippers (CompanyName, Phone)
VALUES ('บริษัทขนเยอะจำกัด', '081-1212145');

SELECT * FROM Customers;

-- ตาราง PK เป็น Char, NCHAR
INSERT INTO Shippers (CompanyName)
VALUES ('บริษัทมหาศาลจำกัด');

SELECT * FROM Customers;

-- ตาราง PK เป็น Char, nChar
INSERT INTO Customers (CustomerID, CompanyName)
VALUES ('A0001', 'บริษัทซื้อเยอะจำกัด');

---จงเพิ่มข้อมูลพนักงาน 1คน (ใส่ข้อมูลเท่าที่มี)
INSERT into Employees(FirstName,LastName)
VALUES ('วุ้นเส้น' , 'เขมรสกุล')

---จงเพิ่มสินค้า ปลาแดกบอง ราคา 1.5$ จำนวน 12
Insert into Products(ProductName, UniPrice, UnitsInStock)
VALUES INTO product(ProductName, UnitPrice,UnitsInstook)

---------คำสั่ง Update ปรับปรุงข้อมูล
---ปรับปรุงเบอร์โทรศัพท์ ของบริษัทขนส่ง รหัส 6
update Shippers
set Phone = '099-9999999'
where ShipperID = 6

SELECT * from Shippers
----ปรับปรุงจำนวนสินค้าคงเหลือสินค้ารหัส 1 เพิ่มจำนวนเข้าไปื 100 ชิ้น
UPDATE Products
set UnitsInstock = UnitsInStock+10
WHERE ProductID = 1

----ปรับปรุง เมือง และประเทศลูกค้า รหัส A0001 ให้เป็น อุดรธานี, Thailand
UPDATE Customers
SET City ='อุดรธานี' , Country = 'Thailand'
where CustomerID = 'A0001'

----คำสั่ง Delete ลบข้อมูล
----ลบบริษัทขนส่งสินค้า รหัส 6

DELETE From Shippers
where ShipperID = 6

SELECT * from Orders
Where ShipVia = 6

SELECT * from Employees 
---ต้องการข้อมูล รหัสและชื่อพนักงาน และรหัสชื่อหัวหน้าพนักงาน
SELECT emp.EmployeeID,  emp.firstName, boss.EmployeeID , boss.FirstName 
from Employees emp JOIN Employees boss
on emp.ReportsTo = boss.EmployeeID