import 'package:equatable/equatable.dart';
import 'package:news_z/modules/news/data/models/m_news.dart';


abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}
class NewsInitial extends NewsState {}
class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> noticias;

  const NewsLoaded(this.noticias);

  @override
  List<Object> get props => [noticias];
}

class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object> get props => [message];
}

class NewsEdited extends NewsState {
  final News updatedNews;
  NewsEdited(this.updatedNews);
}

class NewsDeleted extends NewsState {
  final int newsId;
  NewsDeleted(this.newsId);
}

class NewsCreated extends NewsState {
  final News createdNews;
  NewsCreated(this.createdNews);
}
