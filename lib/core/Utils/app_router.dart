import 'package:go_router/go_router.dart';
import 'package:newsapp/feature/home/data/newsmodel/newsmodel.dart';
import 'package:newsapp/feature/news/presentation/view/newspage.dart';
import 'package:newsapp/feature/search/presentation/view/search.dart';

import '../../feature/Splash/presentation/views/splashview.dart';
import '../../feature/home/presentation/view/homepage.dart';

abstract class Approute {
  static const kHomeview = '/HomePage';
  static const kNewsPage = '/NewsPage';
  static const kSearchPage = '/SearchPage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeview,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: kNewsPage,
        builder: (context, state) => NewsPage(news: state.extra as NewsModel),
      ),
      GoRoute(
        path: kSearchPage,
        builder: (context, state) => const SearchPage(),
      ),
    ],
  );
}
