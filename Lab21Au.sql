-- แสดงชื่อสินค้า ชื่อสินค้า และ ราคาสินค้า
SELECT CategoryName, ProductName, UnitPrice
FROM Products, Categories
Where Products.CategoryID = Categories.CategoryID
and CategoryName = 'seafood'

SELECT CategoryName, ProductName, UnitPrice
FROM Products AS p JOIN Categories as C
ON p.CategoryID = C.CategoryID
WHERE CategoryName = 'seafood'

SELECT * From Orders Where OrderID = 10250
SELECT *
  
-- ต้องการรหัสสินค้า ชื่อพนักงาน บริษัทผู้จำหน่าย ประเทศ
SELECT  p.ProductID, p.ProductName,s.CompanyName, s.Country
from Products p JOIN Suppliers s on p.SupplierID = s.SupplierID
where Country in ('usa', 'uk')

SELECT e.EmployeeID, FirstName, OrderID =10250
from Employees e join orders o on e.EmployeeID = o. EmployeeID
order by EmployeeID

-- ต้องการชื่อบริษัทขนส่ง และจำนวนทั้งหมดที่ขายได้
SELECT s.CompanyName, count(*) จำนวนorders
FROM Shippers s join orders o on s.ShipperID = o.ShipVia
group by s.CompanyName
order by 2 DESC

-- ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้ 
SELECT p.ProductID, p.ProductName, sum(Quantity) จำนวนที่ขายได้
from products p join [Order Details] od on p.ProductID = od.ProductID
group by p.PROductID , p.ProductName

-- ต้องการรหัสสินค้า ชื่อสินค้า ที่ nancy ขายได้ ทั้งหมด เรียงลำดับรหัสสินค้า
SELECT p.ProductID, p.productName
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
                 join [Order Details] od  on o.OrderID = od.OrderID
                 join Products p on p.ProductID = od.ProductID
where e.FirstName = 'Nancy'
order by ProductID

--- ต้องการชื่อบริษัทลูกค้าซื้อ Around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
SELECT s.Country
from customers c join orders o on c.CustomerID = o.CustomerID
                join [Order Details ] od on o.OrderID = od.OrderID
                join Products p on p.ProductID = od.ProductID
                join Suppliers s on s.SupplierID = p.SupplierID
WHERE c.CompanyName = 'Around the Horn'

--- บริษัทลูกค้าซื้อ Around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง







