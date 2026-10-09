
import 'package:flutter/material.dart';
import 'producto.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Productos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PantallaProductos(),
    );
  }
}

class PantallaProductos extends StatelessWidget {
  const PantallaProductos({super.key});

  // Datos de ejemplo en formato Map
  List<Producto> obtenerProductos() {
    final List<Map<String, dynamic>> datos = [
      {'id': 1, 'nombre': 'Laptop', 'descripcion': 'Computadora portátil', 'precio': 2500.00, 'stock': 10, 'disponible': true},
      {'id': 2, 'nombre': 'Mouse', 'descripcion': 'Mouse inalámbrico', 'precio': 45.50, 'stock': 25, 'disponible': true},
      {'id': 3, 'nombre': 'Teclado', 'descripcion': 'Teclado mecánico', 'precio': 120.00, 'stock': 15, 'disponible': true},
      {'id': 4, 'nombre': 'Monitor', 'descripcion': 'Monitor de 24 pulgadas', 'precio': 650.00, 'stock': 8, 'disponible': true},
      {'id': 5, 'nombre': 'Audífonos', 'descripcion': 'Audífonos con micrófono', 'precio': 89.90, 'stock': 20, 'disponible': true},
      {'id': 6, 'nombre': 'Impresora', 'descripcion': 'Impresora multifuncional', 'precio': 450.00, 'stock': 5, 'disponible': true},
      {'id': 7, 'nombre': 'USB', 'descripcion': 'Memoria USB de 64 GB', 'precio': 35.00, 'stock': 30, 'disponible': true},
      {'id': 8, 'nombre': 'Disco SSD', 'descripcion': 'SSD de 1 TB', 'precio': 320.00, 'stock': 12, 'disponible': true},
      {'id': 9, 'nombre': 'Webcam', 'descripcion': 'Cámara web HD', 'precio': 110.00, 'stock': 7, 'disponible': false},
      {'id': 10, 'nombre': 'Parlantes', 'descripcion': 'Parlantes para PC', 'precio': 75.00, 'stock': 18, 'disponible': true},
    ];

    return datos.map((mapa) => Producto.fromMap(mapa)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final productos = obtenerProductos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${producto.id}'),
              ),
              title: Text(producto.nombre),
              subtitle: Text(
                '${producto.descripcion}\n'
                'Precio: S/ ${producto.precio.toStringAsFixed(2)}\n'
                'Stock: ${producto.stock} | '
                '${producto.disponible ? "Disponible" : "Agotado"}',
              ),
              isThreeLine: true,
              trailing: const Icon(Icons.shopping_bag),
            ),
          );
        },
      ),
    );
  }
}