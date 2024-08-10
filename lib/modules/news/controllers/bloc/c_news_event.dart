import 'package:equatable/equatable.dart';
import 'package:news_z/modules/news/data/models/m_news.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadNews extends NewsEvent {}

class FetchNewsByCategory extends NewsEvent {
  final int categoriaId;

  const FetchNewsByCategory(this.categoriaId);

  @override
  List<Object> get props => [categoriaId];
}

class EditNews extends NewsEvent {
  final News news;
  EditNews(this.news);
}

class DeleteNews extends NewsEvent {
  final int newsId;
  DeleteNews(this.newsId);
}

class CreateNews extends NewsEvent {
  final News news;
  CreateNews(this.news);
}