-- สร้างฐานข้อมูล Zoo
CREATE DATABASE Zoo;
GO

-- แสดงรายการฐานข้อมูล
SELECT name FROM sys.databases;
GO

-- ปรับ Collation ให้รองรับภาษาไทย
ALTER DATABASE Zoo COLLATE Thai_CI_AS;
GO

-- ใช้งานฐานข้อมูล Zoo
USE Zoo;
GO

-- สร้างตาราง AnimalType
CREATE TABLE AnimalType (
    TypeID NCHAR(3) NOT NULL PRIMARY KEY,
    TName NVARCHAR(50) NOT NULL
);
GO

-- เพิ่มข้อมูล
INSERT INTO AnimalType VALUES ('T01', N'สัตว์ปีก');
INSERT INTO AnimalType VALUES ('T02', N'สัตว์น้ำ');
GO

-- แสดงข้อมูลทั้งหมด
SELECT * FROM AnimalType;
GO
