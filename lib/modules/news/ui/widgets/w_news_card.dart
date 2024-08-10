// lib/widgets/news_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_bloc.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_event.dart';
import 'package:news_z/modules/news/data/models/m_news.dart';
import 'package:news_z/modules/news/ui/pages/P_news_form.dart';
import 'package:news_z/modules/news/ui/widgets/w_custom_text.dart';
import 'package:news_z/modules/news/ui/widgets/w_news_card_image.dart';
import 'package:news_z/modules/news/ui/widgets/w_theme_button.dart';
import 'package:news_z/theme/theme_colors.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detalle', arguments: news);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
        child: SizedBox(
          //width: 300.0,
          child: Card(
            elevation: 4,
            surfaceTintColor: ThemeColors.white,
            color: ThemeColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(
                color: ThemeColors.primary,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  NewsCardImage(
                    news: news,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: news.titulo,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                      //bottom: 10.0,
                    ),
                    child: CustomText(
                      text: DateFormat(
                        'MMMM d, HH:mm',
                      ).format(
                        news.fecha,
                        //color: ThemeColors.tertiary.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ThemeButton(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        elevation: 4,
                        onPressed: () {
                           context.read<NewsBloc>().add(DeleteNews(news.id));
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: ThemeColors.white,
                        ), // Ícono sin texto
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      ThemeButton(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        elevation: 4,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewsForm(
                                news: news, // Pasa la noticia al formulario
                                isEditing:
                                    true, // Indica que estamos en modo edición
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: ThemeColors.white,
                        ), // Ícono sin texto
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
