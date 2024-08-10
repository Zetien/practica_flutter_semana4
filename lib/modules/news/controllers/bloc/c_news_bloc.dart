import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_event.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_state.dart';
import 'package:news_z/modules/news/data/repositories/r_news.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsLoading()) {
    on<FetchNewsByCategory>(_onFetchNewsByCategory);
    on<EditNews>(_onEditNews);
    on<DeleteNews>(_onDeleteNews);
    on<CreateNews>(_onCreateNews);
  }

  Future<void> _onFetchNewsByCategory(
      FetchNewsByCategory event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final noticias =
          await newsRepository.getNoticiasByCategoria(event.categoriaId);
      emit(NewsLoaded(noticias));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onEditNews(EditNews event, Emitter<NewsState> emit) async {
    try {
      await newsRepository.updateNews(event.news);
      emit(NewsEdited(event.news));
      add(FetchNewsByCategory(event.news.categoriaId));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onDeleteNews(DeleteNews event, Emitter<NewsState> emit) async {
    try {
      await newsRepository.deleteNews(event.newsId);
      emit(NewsDeleted(event.newsId));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onCreateNews(CreateNews event, Emitter<NewsState> emit) async {
    try {
      await newsRepository.createNews(event.news);
      emit(NewsCreated(event.news));
      add(FetchNewsByCategory(event.news.categoriaId));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
