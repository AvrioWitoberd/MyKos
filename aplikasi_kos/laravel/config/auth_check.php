<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

function cekAkses($role_wajib) {
    // Jika tidak ada session, tendang ke login
    if (!isset($_SESSION['user_id'])) {
        header("Location: ../login.php?msg=login_dulu");
        exit;
    }

    // Cek apakah role sesuai (pemilik/admin)
    if ($_SESSION['role'] !== $role_wajib) {
        header("Location: ../login.php?msg=akses_ditolak");
        exit;
    }
}