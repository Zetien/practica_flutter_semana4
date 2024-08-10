import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_bloc.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_event.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_state.dart';
import 'package:news_z/modules/news/data/repositories/r_news.dart';
import 'package:news_z/modules/news/ui/widgets/w_news_list.dart';

class CategoryNewsScreen extends StatelessWidget {
  final int categoriaId;

  const CategoryNewsScreen({super.key, required this.categoriaId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(context.read<NewsRepository>())..add(FetchNewsByCategory(categoriaId)),
      child: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is NewsCreated || state is NewsEdited || state is NewsDeleted) {
            // Recargar la lista de noticias después de una operación de CRUD
            context.read<NewsBloc>().add(FetchNewsByCategory(categoriaId));
          }
        },
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return NewsList(noticias: state.noticias);
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
