## Base de datos

Este proyecto utiliza una base de datos MySQL llamada `tienda_db`, que almacena información de productos, categorías e imágenes.

### Estructura de la base de datos

La base de datos contiene tres tablas:

- **categorias:** almacena las categorías de los productos.
- **productos:** contiene la información general de los productos, incluyendo nombre, descripción, precio e imagen principal.
- **imagenes_producto:** almacena las imágenes adicionales de cada producto.

### Instalación

1. Iniciar los servicios Apache y MySQL desde XAMPP.
2. Abrir SQLyog o phpMyAdmin.
3. Ejecutar el script `tienda_db.sql` incluido en el repositorio.

El script incluye la creación de las tablas, sus relaciones y registros de ejemplo.