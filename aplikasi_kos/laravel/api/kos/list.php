<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");

require_once '../../config/database.php';

try {
    $query = "SELECT k.*, 
              (SELECT file_nama FROM foto_kos WHERE id_kos = k.id_kos LIMIT 1) as foto_utama
              FROM kos k 
              ORDER BY k.id_kos DESC";

    $stmt = $conn->prepare($query);
    $stmt->execute();
    
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // --- BASE URL CONFIGURATION ---
    // Auto-detect host (works for Web/Postman)
    $host = $_SERVER['HTTP_HOST'];
    $base_url = "http://" . $host . "/aplikasi_kos/backend_api/uploads/kos/";

    // --- OVERRIDES FOR FLUTTER APP ---
    // Uncomment this if testing on Android Emulator:
    // $base_url = "http://10.0.2.2/aplikasi_kos/backend_api/uploads/kos/";
    
    // Uncomment this if testing on Physical Device (Replace with your WiFi IP):
    // $base_url = "http://192.168.1.x/aplikasi_kos/backend_api/uploads/kos/";

    foreach ($data as $key => $row) {
        // 1. Process Foto Utama
        if (!empty($row['foto_utama'])) {
            $data[$key]['foto_utama'] = $base_url . $row['foto_utama'];
        } else {
            $data[$key]['foto_utama'] = null;
        }

        // 2. Clean Data Types
        if (isset($row['harga_per_bulan'])) {
            $data[$key]['harga_per_bulan'] = (float) $row['harga_per_bulan'];
        }
        if (isset($row['jumlah_kamar'])) {
            $data[$key]['jumlah_kamar'] = (int) $row['jumlah_kamar'];
        }
        if (isset($row['status_tersedia'])) {
            $data[$key]['status_tersedia'] = (int) $row['status_tersedia'];
        }

        // 3. Remove Optional Fields
        if (isset($data[$key]['id_pemilik'])) {
            unset($data[$key]['id_pemilik']);
        }

        // 4. Trim Long Text Fields & 5. Add Safe Defaults
        // Iterate over all keys to ensure nulls are converted to ""
        foreach ($data[$key] as $field_name => $field_value) {
            // Skip foto_utama as it should remain null if empty
            if ($field_name === 'foto_utama') continue;

            if ($field_value === null) {
                $data[$key][$field_name] = "";
            } else if (is_string($field_value)) {
                // Clean excessive line breaks (\r\n\r\n -> \n)
                $cleaned = preg_replace("/[\r\n]+/", "\n", trim($field_value));
                $data[$key][$field_name] = $cleaned;
            }
        }
    }

    if (empty($data)) {
        echo json_encode([
            "status" => "success",
            "message" => "No data available",
            "data" => []
        ]);
    } else {
        echo json_encode([
            "status" => "success",
            "message" => "Data retrieved successfully",
            "data" => $data
        ]);
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Terjadi kesalahan pada server: " . $e->getMessage(),
        "data" => []
    ]);
}
?>
