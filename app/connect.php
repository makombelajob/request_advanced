<?php
$host = 'mysql';
$db = 'weekEnd';
$user = 'root';
$pass = 'rootAdmin';
$dsn = "mysql:host=$host;dbname=$db;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $user, $pass);
    echo 'Connected !';
}catch (PDOException $e) {
    echo "Errors db_not connected :" .  $e->getMessage();
}