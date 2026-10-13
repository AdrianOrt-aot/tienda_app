
<?php
// detalle_producto.php

header("Content-Type: application/json; charset=UTF-8");
require_once "config/conexion.php";

// 1. Recibimos 'producto_id' en lugar de 'id' (tal como lo envía ApiService.kt)
$producto_id = isset($_GET['producto_id']) ? intval($_GET['producto_id']) : 0;

if ($producto_id <= 0) {
    header("HTTP/1.1 400 Bad Request");
    echo json_encode(["error" => "El ID de producto proporcionado no es válido"]);
    exit;
}

try {
    // 2. Consultamos la tabla de imágenes secundarias
    $stmt = $pdo->prepare("SELECT id, producto_id, url_imagen FROM imagenes_producto WHERE producto_id = ?");
    $stmt->execute([$producto_id]);
    $imagenes = $stmt->fetchAll();

    // 3. Convertimos los tipos numéricos
    foreach ($imagenes as &$img) {
        $img['id'] = (int)$img['id'];
        $img['producto_id'] = (int)$img['producto_id'];
    }

    // 4. Retornamos el arreglo [...] para que matchee con List<dataImagenesProducto> en Android
    echo json_encode($imagenes);

} catch (Exception $e) {
    header("HTTP/1.1 500 Internal Server Error");
    echo json_encode(["error" => "Error al obtener el detalle del producto: " . $e->getMessage()]);
}
?>
