<?php
$dbhost = $_POST["ip"]; //database host
$dbuser = "MyProject"; //database username
$dbpassword = "123"; //database password
$db = "project"; //database name

$return["error"] = false;
$return["message"] = "";

$link = mysqli_connect($dbhost, $dbuser, $dbpassword, $db);
//connecting to database server

$val = isset($_POST["id"]) && isset($_POST["name"])
    && isset($_POST["time"]) && isset($_POST["type"]) && isset($_POST["score"]);

if ($val) { //確認都不是空白
    $id = $_POST["id"];
    $name = $_POST["name"];
    $time = $_POST["time"];
    $type = $_POST["type"];
    $score = $_POST["score"];

    //如果沒有任何錯誤，就將data寫入資料庫
    if ($return["error"] == false) {
        $id = mysqli_real_escape_string($link, $id);
        $name = mysqli_real_escape_string($link, $name);
        $time = mysqli_real_escape_string($link, $time);
        $type = mysqli_real_escape_string($link, $type);
        $score = mysqli_real_escape_string($link, $score);

        $sql = "UPDATE patient_rehabilitation SET name='$name',time='$time',type='$type',score='$score' WHERE id='$id'";

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