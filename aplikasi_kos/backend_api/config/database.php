<?php
// backend_api/config/database.php

$host = "localhost";
$db_name = "db_mykos";
$username = "root";
$password = ""; // Kosongkan jika pakai XAMPP default

try {
    $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    // Set error mode ke exception agar mudah didebug
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // Set default fetch mode ke associative array
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    echo "Koneksi Gagal: " . $e->getMessage();
}
?>