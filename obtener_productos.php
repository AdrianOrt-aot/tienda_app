
<?php
// obtener_productos.php
header("Content-Type: application/json; charset=UTF-8");
require_once "config/conexion.php";

$categoria_id = isset($_GET['categoria_id']) ? intval($_GET['categoria_id']) : 0;

try {
    // 1. Incluimos 'descripcion' en el SELECT (¡aquí estaba la razón de que viniera vacío!)
    if ($categoria_id > 0) {
        $stmt = $pdo->prepare("SELECT id, categoria_id, nombre, descripcion, precio, url_imagen_principal FROM productos WHERE categoria_id = ?");
        $stmt->execute([$categoria_id]);
    } else {
        $stmt = $pdo->query("SELECT id, categoria_id, nombre, descripcion, precio, url_imagen_principal FROM productos");
    }

    $productos = $stmt->fetchAll();

    // 2. Casteamos los tipos de datos para que coincidan con la data class dataProductos de Kotlin
    foreach ($productos as &$p) {
        $p['id'] = (int)$p['id'];
        $p['categoria_id'] = (int)$p['categoria_id'];
        $p['precio'] = (float)$p['precio']; // Quita las comillas para ser reconocido como Double
    }

    echo json_encode($productos);

} catch (Exception $e) {
    header("HTTP/1.1 500 Internal Server Error");
    echo json_encode(["error" => "Error al obtener catálogo de productos: " . $e->getMessage()]);
}
?>
