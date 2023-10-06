import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/feature/home/presentation/manger/hottest_news/hottest_news_cubit.dart';
import 'package:newsapp/feature/home/presentation/manger/latest_news/latest_news_cubit.dart';
import 'core/Utils/app_router.dart';
import 'core/Utils/service_locator.dart';
import 'core/theme/color_schemes.g.dart';
import 'core/theme/typography.dart';
import 'feature/home/data/repo/home_repo_implement.dart';

void main() {
  setupservicelocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HottestNewsCubit>(
          create: (BuildContext context) =>
              HottestNewsCubit(getIt.get<HomeRepoImplement>())
                ..fetchHottestNews(),
        ),
        BlocProvider<LatestNewsCubit>(
          create: (BuildContext context) =>
              LatestNewsCubit(getIt.get<HomeRepoImplement>())
                ..fetchLattestNews(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: Approute.router,
        theme: ThemeData(
            textTheme: textTheme,
            colorScheme: lightColorScheme,
            useMaterial3: true),
      ),
    );
  }
}
