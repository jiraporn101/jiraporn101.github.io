---Sub Query
---ต้องการข้อมูลคนที่มีตำแหน่งเดียวกัน Nancy
----1. หาตำแหน่งของ Nancy ก่อน
    SELECT title from Employee where FirstName = 'nancy'

----2. หาข้อมูลคนที่มีตำแหน่งเดียวกัข้อ 1
    SELECT * from Employee
    where title = (SELECT title 
    from Employees
    where FirstName = 'nancy')
---ต้องการชื่อนามสกุลพนักงานที่มีอายุมากที่สุด
    SELECT Firstname , LastName from Employees
    where BirthDate = (วันเกิดที่น้อยที่สุด)
---ต้องการชื่อสินค้าที่มีราคามากกว่าสินค้าซื้อ Ikura
    SELECT ProductName from Products
    where UnitPrice > (SELECT UnitPrice from Products
                        where productName = 'Ikura')

---ต้องการชื่อบริษัทลูกค้าที่อยู่เมืองเดียวกับบริษัทชื่อ Around the Horn
SELECT CompanyName from Customers
where city = (เมืองของบริษัท Around the Horn)

---ต้องการชื่อนามสกุลที่เข้างานคนล่าสุด
SELECT Firstname , Lastname from Employees
where HireDate = 

   

