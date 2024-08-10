// lib/models/noticia.dart
class News {
  final int id;
  final String titulo;
  final String descripcion;
  final DateTime fecha;
  final String? imagen;
  final int categoriaId;

  News({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    this.imagen,
    required this.categoriaId,
  });
}
