<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");

require_once '../../config/database.php';

try {
    // We join with the users table to only show Kos from active owners ('aktif')
    // and we also fetch the main photo from foto_kos table.
    $query = "SELECT k.*, 
              (SELECT file_nama FROM foto_kos WHERE id_kos = k.id_kos LIMIT 1) as foto_utama,
              u.nama_lengkap as nama_pemilik,
              u.status as status_pemilik
              FROM kos k 
              JOIN users u ON k.id_pemilik = u.id_user 
              WHERE u.status = 'aktif'
              ORDER BY k.id_kos DESC";

    $stmt = $conn->prepare($query);
    $stmt->execute();
    
    // database.php already sets PDO::FETCH_ASSOC as default, but we enforce it here
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Provide full URL for the image if it exists to make it easier for Flutter
    $base_url = "http://" . $_SERVER['HTTP_HOST'] . "/aplikasi_kos/backend_api/uploads/kos/";
    
    foreach ($data as $key => $row) {
        if (!empty($row['foto_utama'])) {
            $data[$key]['foto_utama_url'] = $base_url . $row['foto_utama'];
        } else {
            $data[$key]['foto_utama_url'] = null;
        }
    }

    echo json_encode([
        "status" => "success",
        "message" => "Data retrieved successfully",
        "data" => $data
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Terjadi kesalahan pada server: " . $e->getMessage(),
        "data" => null
    ]);
}
?>
