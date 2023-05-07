<?php
$dbhost = $_POST["ip"]; //database host
$dbuser = "MyProject"; //database username
$dbpassword = "123"; //database password
$db = "project"; //database name

$return["error"] = false;
$return["message"] = "";

$link = mysqli_connect($dbhost, $dbuser, $dbpassword, $db);
//connecting to database server

$val = isset($_POST["id"]) && isset($_POST["nickname"]) && isset($_POST["nickname"])
    && isset($_POST["birthday"]) && isset($_POST["diagnosis_left"])
    && isset($_POST["diagnosis_right"]) && isset($_POST["diagnosis_hemorrhagic"])
    && isset($_POST["diagnosis_ischemic"]) && isset($_POST["affected_side_left"])
    && isset($_POST["affected_side_right"]) && isset($_POST["phone"])
    && isset($_POST["emergency_contact"]) && isset($_POST["emergency_contact_phone"])
    && isset($_POST["joindate"]);

// $test=isset($_POST["joindate"]);

if ($val) { //確認有啟用
    $id = $_POST["id"];
    $name = $_POST["name"];
    $nickname = $_POST["nickname"];
    $birthday = $_POST["birthday"];
    $diagnosis_left = $_POST["diagnosis_left"];
    $diagnosis_right = $_POST["diagnosis_right"];
    $diagnosis_hemorrhagic = $_POST["diagnosis_hemorrhagic"];
    $diagnosis_ischemic = $_POST["diagnosis_ischemic"];
    $affected_side_left = $_POST["affected_side_left"];
    $affected_side_right = $_POST["affected_side_right"];
    $phone = $_POST["phone"];
    $emergency_contact = $_POST["emergency_contact"];
    $emergency_contact_phone = $_POST["emergency_contact_phone"];
    $joindate = $_POST["joindate"];

    //如果沒有任何錯誤，就將data寫入資料庫
    if ($return["error"] == false) {
        //轉義在 SQL 語句中使用的字符串中的特殊字符
        $id = mysqli_real_escape_string($link, $id);
        $name = mysqli_real_escape_string($link, $name);
        $nickname = mysqli_real_escape_string($link, $nickname);
        $birthday = mysqli_real_escape_string($link, $birthday);
        $diagnosis_left = mysqli_real_escape_string($link, $diagnosis_left);
        $diagnosis_right = mysqli_real_escape_string($link, $diagnosis_right);
        $diagnosis_hemorrhagic = mysqli_real_escape_string($link, $diagnosis_hemorrhagic);
        $diagnosis_ischemic = mysqli_real_escape_string($link, $diagnosis_ischemic);
        $affected_side_left = mysqli_real_escape_string($link, $affected_side_left);
        $affected_side_right = mysqli_real_escape_string($link, $affected_side_right);
        $phone = mysqli_real_escape_string($link, $phone);
        $emergency_contact = mysqli_real_escape_string($link, $emergency_contact);
        $emergency_contact_phone = mysqli_real_escape_string($link, $emergency_contact_phone);
        $joindate = mysqli_real_escape_string($link, $joindate);

        $sql = "UPDATE patient_database SET name='$name', nickname='$nickname',
        birthday='$birthday', diagnosis_left='$diagnosis_left',
        diagnosis_right='$diagnosis_right', diagnosis_hemorrhagic='$diagnosis_hemorrhagic',
        diagnosis_ischemic='$diagnosis_ischemic', affected_side_left='$affected_side_left',
        affected_side_right='$affected_side_right', phone='$phone',
        emergency_contact='$emergency_contact', emergency_contact_phone='$emergency_contact_phone', 
        joindate='$joindate' WHERE id='$id'";

        $res = mysqli_query($link, $sql);
        if ($res) {
        } else {
            $return["error"] = true;
            $return["message"] = "Database error";
        }
    }
} else {
    $return["error"] = true;
    $return["message"] = 'Send all parameters.';
}

mysqli_close($link); //關閉mysqli

header('Content-Type: application/json');   //讓瀏覽器知道它是一個 json 的格式
echo json_encode($return);  //將陣列轉換成JSON的格式
?>