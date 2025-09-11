-- 1.   จงแสดงให้เห็นว่าพนักงานแต่ละคนขายสินค้าประเภท Beverage ได้เป็นจำนวนเท่าใด และเป็นจำนวนกี่ชิ้น เฉพาะครึ่งปีแรกของ 2540(ทศนิยม 4 ตำแหน่ง)

SELECT 
  e.EmployeeID,
  CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalAmount,
  SUM(od.Quantity) AS TotalQuantity
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Beverages'
  AND o.OrderDate BETWEEN '1997-01-01' AND '1997-06-30'
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY e.EmployeeID;
-- 2.   จงแสดงชื่อบริษัทตัวแทนจำหน่าย  เบอร์โทร เบอร์แฟกซ์ ชื่อผู้ติดต่อ จำนวนชนิดสินค้าประเภท Beverage ที่จำหน่าย โดยแสดงจำนวนสินค้า จากมากไปน้อย 3 อันดับแรก
SELECT
  s.SupplierID,
  s.CompanyName,
  s.Phone,
  s.Fax,
  s.ContactName,
  COUNT(DISTINCT p.ProductID) AS BeverageProductCount
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Beverages'
GROUP BY s.SupplierID, s.CompanyName, s.Phone, s.Fax, s.ContactName
ORDER BY BeverageProductCount DESC
LIMIT 3;

-- 3.   จงแสดงข้อมูลชื่อลูกค้า ชื่อผู้ติดต่อ เบอร์โทรศัพท์ ของลูกค้าที่ซื้อของในเดือน สิงหาคม 2539 ยอดรวมของการซื้อโดยแสดงเฉพาะ ลูกค้าที่ไม่มีเบอร์แฟกซ์
SELECT
  c.CustomerID,
  c.CompanyName,
  c.ContactName,
  c.Phone,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1996 AND MONTH(o.OrderDate) = 8
  AND (c.Fax IS NULL OR TRIM(c.Fax) = '')
GROUP BY c.CustomerID, c.CompanyName, c.ContactName, c.Phone
ORDER BY TotalAmount DESC;
--4.รหัสสินค้า ชื่อสินค้า จำนวนขายทั้งหมดในปี 2541 (1998) และยอดรวม — เรียงตามจำนวนจากน้อย→มาก พร้อมลำดับ
    SELECT
  ROW_NUMBER() OVER (ORDER BY SUM(od.Quantity) ASC) AS RankNo,
  p.ProductID,
  p.ProductName,
  SUM(od.Quantity) AS TotalQuantity,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalAmount
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 1998
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantity ASC;
--5.สินค้าที่ขายใน ม.ค.2540 (1997) — top 5 ตามจำนวน (มาก→น้อย) พร้อมลำดับและราคาเฉลี่ยที่ขาย (weighted avg)
SELECT
  ROW_NUMBER() OVER (ORDER BY SUM(od.Quantity) DESC) AS RankNo,
  p.ProductID,
  p.ProductName,
  SUM(od.Quantity) AS TotalQuantity,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalAmount,
  ROUND(
    CASE WHEN SUM(od.Quantity)=0 THEN 0
         ELSE SUM(od.UnitPrice * od.Quantity * (1 - od.Discount))/SUM(od.Quantity)
    END,4) AS WeightedAvgPrice
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate)=1997 AND MONTH(o.OrderDate)=1
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantity DESC
LIMIT 5;

-----6.ชื่อพนักงาน จำนวนใบสั่งซื้อ และยอดรวม ที่แต่ละคนขายได้ ใน ธ.ค.2539 (1996) — แสดง 5 อันดับสูงสุด
SELECT
  e.EmployeeID,
  CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
  COUNT(DISTINCT o.OrderID) AS OrderCount,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate)=1996 AND MONTH(o.OrderDate)=12
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSales DESC
LIMIT 5;

---- 7.สินค้ายอดขายสูงสุด 10 รายการ ใน ธ.ค.2539 (1996) — แสดงรหัส ชื่อ ประเภท ยอดและจำนวน
SELECT
  p.ProductID,
  p.ProductName,
  c.CategoryName,
  SUM(od.Quantity) AS TotalQuantity,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalAmount
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE YEAR(o.OrderDate)=1996 AND MONTH(o.OrderDate)=12
GROUP BY p.ProductID, p.ProductName, c.CategoryName
ORDER BY TotalAmount DESC
LIMIT 10;

8.แสดงใบสั่งซื้อ + ลูกค้า + พนักงาน + ยอดรวม + จำนวนรายการในใบ — เฉพาะที่จำนวนรายการ > 2
SELECT
  o.OrderID,
  c.CompanyName,
  c.Address,
  c.City,
  c.Country,
  CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS OrderTotal,
  COUNT(od.ProductID) AS LineItemCount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, c.CompanyName, c.Address, c.City, c.Country, e.FirstName, e.LastName
HAVING COUNT(od.ProductID) > 2
ORDER BY o.OrderID;

---9.ชื่อลูกค้า และยอดสั่งซื้อทั้งหมดใน ธ.ค.2539 สำหรับลูกค้าที่ มี เบอร์แฟกซ์
SELECT
  c.CustomerID,
  c.CompanyName,
  c.ContactName,
  c.Phone,
  c.Fax,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate)=1996 AND MONTH(o.OrderDate)=12
  AND (c.Fax IS NOT NULL AND TRIM(c.Fax) <> '')
GROUP BY c.CustomerID, c.CompanyName, c.ContactName, c.Phone, c.Fax
ORDER BY TotalAmount DESC;

-----10.ชื่อเต็มพนักงาน จำนวนใบสั่งซื้อ ยอดขายรวม เฉพาะไตรมาสสุดท้ายของ 2539 (1996-10-01 ถึง 1996-12-31) — เรียงจากมาก→น้อย, แสดงทศนิยม 4 ตำแหน่ง
SELECT
  e.EmployeeID,
  CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
  COUNT(DISTINCT o.OrderID) AS OrderCount,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-10-01' AND '1996-12-31'
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSales DESC;

-----11. ชื่อพนักงาน กับยอดขายรวมของสินค้าประเภท Beverages ที่ส่งไป Japan
SELECT
  e.EmployeeID,
  CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalBeverageSalesToJapan
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Beverages' AND o.ShipCountry = 'Japan'
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalBeverageSalesToJapan DESC;

-----12.Suppliers (รหัส-ชื่อ-ติดต่อ-โทร) + ชื่อสินค้า เฉพาะ Seafood พร้อมยอดรวมแต่ละชนิด (ทศนิยม 4) — top 10
SELECT
  s.SupplierID,
  s.CompanyName AS SupplierName,
  s.ContactName,
  s.Phone,
  p.ProductID,
  p.ProductName,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalAmount
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Seafood'
GROUP BY s.SupplierID, s.CompanyName, s.ContactName, s.Phone, p.ProductID, p.ProductName
ORDER BY TotalAmount DESC
LIMIT 10;

-----13.ชื่อเต็มพนักงานทุกคน วันเกิด (รูปแบบ 105 = dd-mm-yyyy) อายุเป็นปีและเดือน พร้อมชื่อหัวหน้า (
SELECT
  e.EmployeeID,
  CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
  DATE_FORMAT(e.BirthDate, '%d-%m-%Y') AS BirthDate_105,
  TIMESTAMPDIFF(YEAR, e.BirthDate, CURDATE())
    - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(e.BirthDate, '%m%d')) AS AgeYears,
  (TIMESTAMPDIFF(MONTH, e.BirthDate, CURDATE())
    - (TIMESTAMPDIFF(YEAR, e.BirthDate, CURDATE()) * 12)) AS AgeMonths,
  CONCAT(m.FirstName,' ',m.LastName) AS ManagerName
FROM Employees e
LEFT JOIN Employees m ON e.ReportsTo = m.EmployeeID
ORDER BY e.EmployeeID;

---14.ลูกค้าที่อยู่ใน USA และยอดเงินการซื้อแยกตามประเภทสินค้า
SELECT
  c.CustomerID,
  c.CompanyName,
  cat.CategoryName,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS TotalByCategory
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
WHERE c.Country = 'USA'
GROUP BY c.CustomerID, c.CompanyName, cat.CategoryName
ORDER BY c.CompanyName, TotalByCategory DESC;

----15.ข้อมูล suppliers, ชื่อสินค้า, จำนวนที่ขายได้ และราคาเฉลี่ยของสินค้าที่ขายไป (ทศนิยม 4)
SELECT
  s.SupplierID,
  s.CompanyName AS SupplierName,
  p.ProductID,
  p.ProductName,
  COALESCE(SUM(od.Quantity),0) AS TotalQuantitySold,
  ROUND(
    CASE WHEN SUM(od.Quantity)=0 THEN 0
         ELSE SUM(od.UnitPrice * od.Quantity * (1 - od.Discount))/SUM(od.Quantity)
    END,4) AS AvgPricePerUnit
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
LEFT JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY s.SupplierID, s.CompanyName, p.ProductID, p.ProductName
ORDER BY s.CompanyName, TotalQuantitySold DESC;

----16.ผู้ผลิต (country = Japan) พร้อมชื่อสินค้า และจำนวนที่ขายได้หลัง 1998-01-01
SELECT
  s.SupplierID,
  s.CompanyName,
  s.ContactName,
  s.Phone,
  s.Fax,
  p.ProductID,
  p.ProductName,
  COALESCE(SUM(od.Quantity),0) AS QuantitySoldAfter1998
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
LEFT JOIN Orders o ON od.OrderID = o.OrderID AND o.OrderDate > '1998-01-01'
WHERE s.Country = 'Japan'
GROUP BY s.SupplierID, s.CompanyName, s.ContactName, s.Phone, s.Fax, p.ProductID, p.ProductName
ORDER BY s.CompanyName, QuantitySoldAfter1998 DESC;

-----17.ชื่อบริษัทขนส่ง (Shippers) เบอร์โทร จำนวนรายการที่ส่งไป USA และ Canada และค่าขนส่งรวม
SELECT
  sh.ShipperID,
  sh.CompanyName AS ShipperName,
  sh.Phone,
  COUNT(o.OrderID) AS OrdersShippedToUSorCA,
  ROUND(SUM(o.Freight),4) AS TotalFreight
FROM Shippers sh
JOIN Orders o ON sh.ShipperID = o.ShipVia
WHERE o.ShipCountry IN ('USA','Canada')
GROUP BY sh.ShipperID, sh.CompanyName, sh.Phone
ORDER BY OrdersShippedToUSorCA DESC;

----18.รายชื่อลูกค้าที่ซื้อ Seafood และมีเบอร์แฟกซ์เท่านั้น
SELECT DISTINCT
  c.CustomerID,
  c.CompanyName,
  c.ContactName,
  c.Phone,
  c.Fax
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
WHERE cat.CategoryName = 'Seafood'
  AND (c.Fax IS NOT NULL AND TRIM(c.Fax) <> '');


---19.ชื่อเต็มพนักงาน วันเริ่มงาน (รูปแบบ 105), อายุงานเป็นปีและเดือน, ยอดขายรวมของสินค้าประเภท Condiments ในปี 2540 (1997)
SELECT
  e.EmployeeID,
  CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
  DATE_FORMAT(e.HireDate, '%d-%m-%Y') AS HireDate_105,
  TIMESTAMPDIFF(YEAR, e.HireDate, CURDATE())
    - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(e.HireDate, '%m%d')) AS YearsOfService,
  (TIMESTAMPDIFF(MONTH, e.HireDate, CURDATE()) - (TIMESTAMPDIFF(YEAR, e.HireDate, CURDATE())*12)) AS RemainingMonths,
  ROUND(SUM(
    CASE WHEN cat.CategoryName = 'Condiments' AND YEAR(o.OrderDate)=1997
         THEN od.UnitPrice * od.Quantity * (1 - od.Discount) ELSE 0 END
  ),4) AS TotalCondimentSalesIn1997
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
LEFT JOIN OrderDetails od ON o.OrderID = od.OrderID
LEFT JOIN Products p ON od.ProductID = p.ProductID
LEFT JOIN Categories cat ON p.CategoryID = cat.CategoryID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, e.HireDate
ORDER BY e.EmployeeID;

---20.หมายเลขใบสั่งซื้อ วันที่ (รูปแบบ 105) และยอดขายรวมในแต่ละใบสั่ง — top 10 (ยอดสูงสุด)
SELECT
  o.OrderID,
  DATE_FORMAT(o.OrderDate, '%d-%m-%Y') AS OrderDate_105,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),4) AS OrderTotal
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.OrderDate
ORDER BY OrderTotal DESC
LIMIT 10;


