-- สร้างฐานข้อมูล ZooDB
CREATE DATABASE ZooDB;
-- ใช้งานฐานข้อมูล
USE ZooDB;

-- ตารางประเภทสัตว์
CREATE TABLE AnimalType (
    animal_type_id INT NOT NULL PRIMARY KEY,
    type_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX) NULL
);

-- ตารางข้อมูลชนิดของสัตว์
CREATE TABLE SpeciesInfo (
    species_info_id INT NOT NULL PRIMARY KEY,
    common_name NVARCHAR(100) NOT NULL,
    scientific_name NVARCHAR(100) NOT NULL,
    habitat NVARCHAR(MAX) NULL,
    diet NVARCHAR(MAX) NULL,
    conservation_status NVARCHAR(100) NULL,
    description NVARCHAR(MAX) NULL
);

-- ตารางกรงสัตว์
CREATE TABLE Enclosure (
    enclosure_id INT NOT NULL PRIMARY KEY,
    name NVARCHAR(200) NOT NULL,
    location NVARCHAR(200) NULL
);

-- ตารางผู้ดูแล
CREATE TABLE Keeper (
    keeper_id INT NOT NULL PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    phone NVARCHAR(50) NULL,
    email NVARCHAR(100) NULL
);

-- ตารางความสัมพันธ์ระหว่าง กรงสัตว์ กับ ผู้ดูแล
CREATE TABLE EnclosureKeeper (
    enclosure_id INT NOT NULL,
    keeper_id INT NOT NULL,
    PRIMARY KEY (enclosure_id, keeper_id),
    FOREIGN KEY (enclosure_id) REFERENCES Enclosure(enclosure_id),
    FOREIGN KEY (keeper_id) REFERENCES Keeper(keeper_id)
);

-- ตารางอาหาร
CREATE TABLE Food (
    food_id INT NOT NULL PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    type NVARCHAR(100) NULL,
    unit NVARCHAR(50) NULL
);

-- ตารางสัตว์
CREATE TABLE Animal (
    animal_id INT NOT NULL PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    gender NVARCHAR(10) NULL,
    birth_date DATE NULL,
    enclosure_id INT NULL,
    animal_type_id INT NULL,
    species_info_id INT NULL,
    FOREIGN KEY (enclosure_id) REFERENCES Enclosure(enclosure_id),
    FOREIGN KEY (animal_type_id) REFERENCES AnimalType(animal_type_id),
    FOREIGN KEY (species_info_id) REFERENCES SpeciesInfo(species_info_id)
);

-- ตารางตารางการให้อาหาร
CREATE TABLE FeedingSchedule (
    feeding_id INT NOT NULL PRIMARY KEY,
    animal_id INT NULL,
    food_id INT NULL,
    amount DECIMAL(10,2) NULL,
    feeding_date DATE NULL,
    feeding_time TIME NULL,
    keeper_id INT NULL,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id),
    FOREIGN KEY (food_id) REFERENCES Food(food_id),
    FOREIGN KEY (keeper_id) REFERENCES Keeper(keeper_id)
);