// lib/widgets/news_list.dart

import 'package:flutter/material.dart';
import 'package:news_z/modules/news/data/models/m_news.dart';
import 'package:news_z/modules/news/ui/widgets/w_news_card.dart';

class NewsList extends StatelessWidget {
  final List<News> noticias;

  const NewsList({super.key, required this.noticias});

@override
Widget build(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.8,
    child: ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            NewsCard(news: noticias[index]),
            const SizedBox(height: 10,)
          ],
        );
      },
    ),
  );
}

}
