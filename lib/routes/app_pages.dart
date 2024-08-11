import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_bloc.dart';
import 'package:news_z/modules/news/data/repositories/r_news.dart';
import 'package:news_z/modules/news/ui/pages/p_detail_news.dart';
import 'package:news_z/modules/news/ui/pages/p_home_news.dart';
import 'package:news_z/modules/news/ui/pages/p_splash.dart';
import 'package:news_z/modules/news/ui/pages/P_news_form.dart';
import 'app_routes.dart';

class AppPages {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.home:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.detail:
        return CupertinoPageRoute(builder: (_) => const DetailScreen());
      case AppRoutes.newsForm:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => NewsBloc(context.read<NewsRepository>()),
            child: NewsForm(),
          ),
        );
      default:
        return CupertinoPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
