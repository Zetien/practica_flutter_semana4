// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import 'package:news_z/modules/news/data/models/m_news.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final News noticia = ModalRoute.of(context)!.settings.arguments as News;

    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.titulo),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeScreen = constraints.maxWidth > 600;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      noticia.imagen!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    noticia.titulo,
                    style: TextStyle(
                      fontSize: isLargeScreen ? 32.0 : 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '${noticia.fecha.toLocal()}'.split(' ')[0],
                    style: TextStyle(
                      fontSize: isLargeScreen ? 16.0 : 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    noticia.descripcion,
                    style: TextStyle(
                      fontSize: isLargeScreen ? 20.0 : 16.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
