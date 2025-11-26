<?php
// ==============================
// ข้อมูลส่วนตัว
// ==============================
$university = "มหาวิทยาลัยราชภัฏอุดรธานี";
$faculty = "คณะวิทยาศาสตร์";
$major = "สาขาเทคโนโลยีสารสนเทศ";
$name = "จิราพร แหล้มี (Jiraporn Laemee)";
$studentId = "67040233101";
$intro = "นักศึกษาปีที่ 2 สนใจ AI, Web Development และระบบอัจฉริยะ";
$picture = "pic/jiji.jpg";   // <-- ใส่รูป JPG จริง
?>
<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<title>PHP Loop Showcase</title>
<style>
    body {
        font-family: "Prompt", sans-serif;
        background: linear-gradient(to bottom, #c9e6ff, #f8fcff);
        padding: 30px;
    }
    .page-box {
        width: 85%;
        margin: auto;
        background: #ffffff;
        border-radius: 20px;
        padding: 25px;
        box-shadow: 0px 0px 20px rgba(0,0,0,0.1);
    }
    h1 {
        text-align: center;
        color: #2a4b8d;
    }
    .student-img {
        display: block;
        margin: 0 auto 20px auto;
        width: 160px;
        height: 160px;
        border-radius: 50%;
        border: 3px solid #4a6cf7;
        object-fit: cover;
    }
    .info {
        background: #e8f0ff;
        border-left: 8px solid #4a6cf7;
        padding: 15px;
        margin-bottom: 30px;
        border-radius: 12px;
        font-size: 18px;
    }
    .section-title {
        color: #4450a3;
        margin-top: 35px;
        font-size: 22px;
        font-weight: bold;
    }
    .result-box {
        background: #f3f6ff;
        padding: 15px;
        border-radius: 12px;
        font-size: 20px;
        white-space: pre-line;
        border: 1px dashed #8a9cff;
        color: #2a2d51;
    }
</style>
</head>

<body>
<div class="page-box">

    <h1>ข้อมูลส่วนตัว</h1>

    <!-- รูปนักศึกษา -->
    <img src="<?= $picture ?>" alt="รูปนักศึกษา" class="student-img">

    <!-- ข้อมูลส่วนตัว -->
    <div class="info">
        <strong>รหัสนักศึกษา:</strong> <?= $studentId ?><br>
        <strong>ชื่อ - นามสกุล:</strong> <?= $name ?><br>
        <strong>มหาวิทยาลัย:</strong> <?= $university ?><br>
        <strong>คณะ:</strong> <?= $faculty ?><br>
        <strong>สาขา:</strong> <?= $major ?><br>
        <strong>ข้อมูลแนะนำตัว:</strong> <?= $intro ?>
    </div>

    <!-- ==========================
        1) Loop for
    =========================== -->
    <div class="section-title">🔵 ตัวอย่างที่ 1 — ใช้ Loop: for (รูปสามเหลี่ยมดาวเพิ่มขึ้น)</div>
    <div class="result-box">
<?php
for ($i = 1; $i <= 4; $i++) {
    echo str_repeat("*", $i) . "\n";
}
?>
    </div>

    <!-- ==========================
        2) Loop while
    =========================== -->
    <div class="section-title">🟣 ตัวอย่างที่ 2 — ใช้ Loop: while (แสดงตัวเลขแนวนอน)</div>
    <div class="result-box">
<?php
$a = 1;
while ($a <= 3) {
    echo str_repeat("$a ", 4) . "\n";
    $a++;
}
?>
    </div>

    <!-- ==========================
        3) Loop do...while
    =========================== -->
    <div class="section-title">🟠 ตัวอย่างที่ 3 — ใช้ Loop: do...while (ตัวเลขเป็นขั้นบันได)</div>
    <div class="result-box">
<?php
$b = 1;
do {
    echo str_repeat("$b ", $b) . "\n";
    $b++;
} while ($b <= 3);
?>
    </div>

    <!-- ==========================
        4) กรอบดาว + ตัวเลข
    =========================== -->
    <div class="section-title">🟢 ตัวอย่างที่ 4 — ใช้ Loop: for (กรอบดาวล้อมตัวเลข)</div>
    <div class="result-box">
<?php
$rows = 5;
$cols = 6;
for ($r = 1; $r <= $rows; $r++) {
    for ($c = 1; $c <= $cols; $c++) {
        if ($r == 1 || $r == $rows || $c == 1 || $c == $cols) {
            echo "* ";
        } else {
            echo ($r - 1) . " ";
        }
    }
    echo "\n";
}
?>
    </div>

    <!-- ==========================
        5) ตัวเลขกลับด้าน
    =========================== -->
    <div class="section-title">🔴 ตัวอย่างที่ 5 — ใช้ Loop: for (ตัวเลขแบบกลับหัว)</div>
    <div class="result-box">
<?php
for ($i = 3; $i >= 1; $i--) {
    echo str_repeat("$i ", $i) . "\n";
}
?>
    </div>

</div>
</body>
</html>
