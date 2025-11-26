<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>Portfolio นักศึกษา</title>
    <style>
        body {
            font-family: "TH Sarabun New", sans-serif;
            background: #f0f4f8;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        .card {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 25px;
            margin-bottom: 25px;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
        }

        h2 {
            color: #4a90e2;
            margin-top: 0;
        }

        .profile-box {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            align-items: center;
        }
        .profile-box img {
            width: 160px;
            height: 160px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #4a90e2;
            box-shadow: 0 3px 12px rgba(0,0,0,0.2);
        }
        .profile-info p {
            margin: 5px 0;
            font-size: 16px;
        }
        .profile-info b {
            color: #4a90e2;
        }

        .loop-container {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .col {
            flex: 1 1 30%;
            background: #fefefe;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        .col h3 {
            text-align: center;
            margin-top: 0;
            color: #f39c12;
        }
        pre {
            background: #f7f9fc;
            padding: 10px;
            border-radius: 8px;
            overflow-x: auto;
            font-size: 16px;
        }

        .contact-info p {
            margin: 8px 0;
            font-size: 16px;
        }
        .contact-info a {
            color: #4a90e2;
            text-decoration: none;
        }
        .contact-info a:hover {
            text-decoration: underline;
        }

        @media(max-width:900px){
            .col { flex: 1 1 45%; }
        }
        @media(max-width:600px){
            .col { flex: 1 1 100%; }
        }
    </style>
</head>
<body>

<?php
$university = "มหาวิทยาลัยราชภัฏอุดรธานี";
$faculty = "คณะวิทยาศาสตร์";
$major = "สาขาเทคโนโลยีสารสนเทศ";
$fullname = "จิราพร แหล้มี";
$nickname = "ทับทิม";
$intro = "ทำงานรีวิวสินค้า/สถานที่";
$picture = "pic/jiji.jpg"; 
$email = "67040233101@udru.ac.th";
$phone = "0610730797";
?>

<div class="card">
    <h2>ข้อมูลนักศึกษา</h2>
    <div class="profile-box">
        <img src="<?= $picture ?>" alt="profile">
        <div class="profile-info">
            <p><b>มหาวิทยาลัย:</b> <?= $university ?></p>
            <p><b>คณะ:</b> <?= $faculty ?></p>
            <p><b>สาขา:</b> <?= $major ?></p>
            <p><b>ชื่อ–นามสกุล:</b> <?= $fullname ?></p>
            <p><b>ชื่อเล่น:</b> <?= $nickname ?></p>
            <p><b>งานอดิเรก:</b> <?= $intro ?></p>
        </div>
    </div>
</div>

<div class="card">
    <h2>Loop</h2>
    <div class="loop-container">

        <!-- FOR -->
        <div class="col">
            <h3>Loop FOR</h3>
            <pre>
<?php
// รูป 1
for($i=1;$i<=4;$i++){
    echo str_repeat("*",$i)."\n";
}
echo "\n";

// รูป 2
for($i=1;$i<=3;$i++){
    echo str_repeat($i." ",4)."\n";
}
echo "\n";

// รูป 3
for($i=1;$i<=3;$i++){
    echo str_repeat("  ",$i-1).$i."\n";
}
echo "\n";

// รูป 4
$size=5;
for($r=1;$r<=$size;$r++){
    if($r==1 || $r==$size){
        echo str_repeat("* ",$size)."\n";
    }else{
        echo "* ".str_repeat("  ",$size-2)."* \n";
    }
}
echo "\n";

// รูป 5
for($i=3;$i>=1;$i--){
    echo str_repeat($i." ",$i)."\n";
}
?>
            </pre>
        </div>

        <!-- WHILE -->
        <div class="col">
            <h3>Loop WHILE</h3>
            <pre>
<?php
// รูป 1
$i=1;
while($i<=4){
    echo str_repeat("*",$i)."\n";
    $i++;
}
echo "\n";

// รูป 2
$i=1;
while($i<=3){
    echo str_repeat($i." ",4)."\n";
    $i++;
}
echo "\n";

// รูป 3
$i=1;
while($i<=3){
    echo str_repeat("  ",$i-1).$i."\n";
    $i++;
}
echo "\n";

// รูป 4
$size=5;
$r=1;
while($r<=$size){
    if($r==1 || $r==$size){
        echo str_repeat("* ",$size)."\n";
    }else{
        echo "* ".str_repeat("  ",$size-2)."* \n";
    }
    $r++;
}
echo "\n";

// รูป 5
$i=3;
while($i>=1){
    echo str_repeat($i." ",$i)."\n";
    $i--;
}
?>
            </pre>
        </div>

        <!-- DO WHILE -->
        <div class="col">
            <h3>Loop DO WHILE</h3>
            <pre>
<?php
// รูป 1
$i=1;
do{
    echo str_repeat("*",$i)."\n";
    $i++;
}while($i<=4);
echo "\n";

// รูป 2
$i=1;
do{
    echo str_repeat($i." ",4)."\n";
    $i++;
}while($i<=3);
echo "\n";

// รูป 3
$i=1;
do{
    echo str_repeat("  ",$i-1).$i."\n";
    $i++;
}while($i<=3);
echo "\n";

// รูป 4
$size=5;
$r=1;
do{
    if($r==1 || $r==$size){
        echo str_repeat("* ",$size)."\n";
    }else{
        echo "* ".str_repeat("  ",$size-2)."* \n";
    }
    $r++;
}while($r<=$size);
echo "\n";

// รูป 5
$i=3;
do{
    echo str_repeat($i." ",$i)."\n";
    $i--;
}while($i>=1);
?>
            </pre>
        </div>

    </div>
</div>

<div class="card">
    <h2>ติดต่อ</h2>
    <div class="contact-info">
        <p><b>Email:</b> <a href="mailto:<?= $email ?>"><?= $email ?></a></p>
        <p><b>โทรศัพท์:</b> <?= $phone ?></p>
        <p><b>Facebook:</b> <a href="https://www.facebook.com/" target="_blank">จิราพร แหล้มี</p>
        <p><b>Line:</b> @timtim07</p>
    </div>
</div>

</body>
</html>
