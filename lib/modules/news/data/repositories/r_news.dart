// lib/repositories/news_repository.dart
import 'package:news_z/modules/news/data/models/m_news.dart';

class NewsRepository {
  final List<News> _noticias = [
    News(
      id:1,
      titulo: 'Viajar en tren por Europa',
      descripcion: 'un majestuoso tren que va hacia los alpes suizos',
      fecha: DateTime.now(),
      imagen: 'https://ukmars.org/ukmars/wp-content/uploads/2020/07/pexels-photo-507410-1536x1025.jpeg',
      categoriaId: 0,
    ),
     News(
      id:2,
      titulo: 'visita la biblioteca de Oxford',
      descripcion: 'No estan las velas colgantes de la pelicula Harry Potter, pero por lo menos el salon esta impecable',
      fecha: DateTime.now(),
      imagen: 'https://cdn.pixabay.com/photo/2015/10/06/22/04/harry-potter-975362_1280.jpg',
      categoriaId: 0,
    ),
     News(
      id:3,
      titulo: 'Viaja al pais del sol naciente..!',
      descripcion: 'viajar a japon es una excelente idea para ir a akibahara a comprar regalos..!!',
      fecha: DateTime.now(),
      imagen: 'https://humanidades.com/wp-content/uploads/2017/07/japon-7-e1571188430646.jpg',
      categoriaId: 0,
    ),
    News(
      id:4,
      titulo: 'Alan Wake 2',
      descripcion: 'Un juegazo hecho por Remedy, donde controlas a 2 personajes a Alan Wake y a Saga Anderson en los alrededores de Bright Falls',
      fecha: DateTime.now(),
      imagen: 'https://cdn2.unrealengine.com/the-first-gameplay-preview-of-alan-wake-2-1920x1080-6cd1f0e9b2df.jpg',
      categoriaId: 1,
    ),
    News(
      id:5,
      titulo: 'Deadpool and Wolverine',
      descripcion: 'Una excelente pelicula que no debes perderte!!!',
      fecha: DateTime.now(),
      imagen: 'https://laud.udistrital.edu.co/sites/default/files/imagen-noticia/2024-07/deadpool-wolverine-entrada-epica.jpg',
      categoriaId: 2,
    ),
  ];

  Future<List<News>> getNoticiasByCategoria(int categoriaId) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simular retraso de red
    return _noticias.where((news) => news.categoriaId == categoriaId).toList();
  }


  Future<void> updateNews(News updatedNews) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Encuentra el índice de la noticia a actualizar y reemplázala
    final index = _noticias.indexWhere((news) => news.id == updatedNews.id);
    if (index != -1) {
      _noticias[index] = updatedNews;
    }
  }

  Future<void> deleteNews(int newsId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Elimina la noticia con el id proporcionado
    _noticias.removeWhere((news) => news.id == newsId);
  }

    Future<void> createNews(News newNews) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _noticias.add(newNews);
  }
}
