<?php

$host = "localhost";
$db = "tienda_db";
$user = "root"; // Cambia esto si tu MySQL tiene otro usuario
$pass = "";    // Cambia esto si tu MySQL tiene contraseña

try {
    // Nos conectamos definiendo el charset utf8 para que no haya problemas con tildes o la 'ñ'
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);

    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

    // Configuramos PDO para que lance excepciones si ocurre un error en los queries
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Configuramos para que por defecto devuelva los datos como un array asociativo
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    // Si la conexión falla, devolvemos un código de error HTTP 500 y un JSON explicando el problema
    header("Content-Type: application/json", true, 500);

    echo json_encode([
        "error" => "Error crítico de conexión al servidor",
        "detalle" => $e->getMessage()
    ]);

    exit;
}
?>