<?php
// -----------------------------
//  ตัวแปรข้อมูลส่วนตัว
// -----------------------------
$university = "มหาวิทยาลัยราชภัฏอุดรธานี";
$faculty = "คณะวิทยาศาสตร์";
$major = "สาขาเทคโนโลยีสารสนเทศ";
$name = "จิราพร แหล้มี (Jiraporn Laemee)";
$intro = "นักศึกษาปี 2 ชอบงานด้าน AI และ Web Development";
?>
<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<title>PHP Loop Example</title>

<style>
    body {
        font-family: "Prompt", sans-serif;
        background: #f5f8ff;
        padding: 20px;
    }
    .container {
        width: 80%;
        margin: auto;
        background: white;
        padding: 20px;
        border-radius: 20px;
        box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
    }
    h2 {
        color: #3a4ca3;
        margin-top: 40px;
    }
    pre {
        background: #eef2ff;
        padding: 15px;
        border-radius: 10px;
        font-size: 18px;
    }
    .info-box {
        background: #d9e6ff;
        padding: 15px;
        border-radius: 10px;
        font-size: 18px;
        line-height: 1.6;
    }
</style>
</head>
<body>

<div class="container">
    <h1>ตัวอย่าง Web Page ด้วย PHP</h1>

    <!-- แสดงข้อมูลส่วนตัว -->
    <div class="info-box">
        <strong>มหาวิทยาลัย:</strong> <?= $university ?><br>
        <strong>คณะ:</strong> <?= $faculty ?><br>
        <strong>สาขา:</strong> <?= $major ?><br>
        <strong>ชื่อนักศึกษา:</strong> <?= $name ?><br>
        <strong>แนะนำตัว:</strong> <?= $intro ?>
    </div>

    <!-- ---------------------- -->
    <!-- 1) ใช้ Loop for -->
    <!-- ---------------------- -->
    <h2>ใช้ Loop: for</h2>
    <pre>
<?php
for($i = 1; $i <= 4; $i++){
    echo str_repeat("*", $i) . "\n";
}
?>
    </pre>

    <!-- ---------------------- -->
    <!-- 2) ใช้ Loop while -->
    <!-- ---------------------- -->
    <h2>ใช้ Loop: while</h2>
    <pre>
<?php
$n = 1;
while($n <= 3){
    echo str_repeat("$n ", 4) . "\n";
    $n++;
}
?>
    </pre>

    <!-- ---------------------- -->
    <!-- 3) ใช้ Loop do..while -->
    <!-- ---------------------- -->
    <h2>ใช้ Loop: do...while</h2>
    <pre>
<?php
$x = 1;
do {
    echo str_repeat("$x ", $x) . "\n";
    $x++;
} while($x <= 3);
?>
    </pre>

    <!-- ---------------------- -->
    <!-- 4) กรอบตัวเลข + ดาว -->
    <!-- ---------------------- -->
    <h2>ใช้ Loop: for (สร้างกรอบ)</h2>
    <pre>
<?php
for ($r = 1; $r <= 5; $r++) {
    for ($c = 1; $c <= 6; $c++) {

        if ($r == 1 || $r == 5 || $c == 1 || $c == 6) {
            echo "* ";
        } else {
            echo ($r - 1) . " ";
        }
    }
    echo "\n";
}
?>
    </pre>

    <!-- ---------------------- -->
    <!-- 5) ตัวเลขกลับด้าน -->
    <!-- ---------------------- -->
    <h2>ใช้ Loop: for (กลับด้าน)</h2>
    <pre>
<?php
for($i = 3; $i >= 1; $i--){
    echo str_repeat("$i ", $i) . "\n";
}
?>
    </pre>

</div>

</body>
</html>
