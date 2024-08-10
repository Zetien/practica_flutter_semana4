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

  _onFetchNewsByCategory(
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

  _onEditNews(EditNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      await newsRepository.updateNews(event.news);
      emit(NewsEdited(event.news));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  _onDeleteNews(DeleteNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      await newsRepository.deleteNews(event.newsId);
      emit(NewsDeleted(event.newsId));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  _onCreateNews(CreateNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      await newsRepository.createNews(event.news);
      emit(NewsCreated(event.news));
      // Opcional: Actualizar la lista de noticias si es necesario
      final noticias =
          await newsRepository.getNoticiasByCategoria(event.news.categoriaId);
      noticias.insert(0, event.news);
      emit(NewsLoaded(noticias));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
