
//creamos la clase llama producto
class Producto {
  int id;
  String nombre;
  String descripcion;
  double precio;
  int stock;
  bool disponible;

  // Constructor
  Producto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
    required this.disponible,
  });

  // Mapeo de datos a un objeto Producto
  factory Producto.fromMap(Map<String, dynamic> mapa) {
    return Producto(
      id: mapa['id'],
      nombre: mapa['nombre'],
      descripcion: mapa['descripcion'],
      precio: (mapa['precio'] as num).toDouble(),
      stock: mapa['stock'],
      disponible: mapa['disponible'],
    );
  }
}