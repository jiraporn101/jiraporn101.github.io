-- แบบฝึกหัด SQL ใช้ฐานข้อมูล  Minimart
-- 1. สินค้าที่มีราคา 15 บาท
    SELECT * FROM Product
    WHERE price = 15;
 
-- 2. สินค้าที่มีจำนวนคงเหลือในสต๊อกต่ำกว่า 250
    SELECT * FROM Product
    WHERE stock_qty < 250;

-- 3. รหัสสินคา ชื่อสินค้าที่เลิกจำหน่ายแล้ว
    SELECT product_id, product_name FROM Product
    WHERE discontinued = 1;

-- 4. รหัสสินค้า ชื่อสินค้า ราคา ของสินค้าที่มีราคามากกว่า 100
    SELECT product_id, product_name, price FROM Product
    WHERE price > 100;

-- 5. รหัสสินค้า และราคาของยางลบ
    SELECT product_id, price FROM Product
    WHERE product_name LIKE '%ยางลบ%';

-- 6. หมายเลขใบเสร็จ วันที่ และ ราคารวม ของใบเสร็จที่ออกก่อนวันที่ 15 ก.พ.
    SELECT receipt_id, receipt_date, total_price FROM Receipt
    WHERE receipt_date < '2025-02-15';


-- 7. รหัสสินค้า ชื่อสินค้า ที่มีจำนวนคงเหลือตั้งแต่ 400 ขึ้นไป
    SELECT product_id, product_name FROM Product
    WHERE stock_qty >= 400;

