import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/Utils/service_locator.dart';
import 'package:newsapp/feature/search/data/repo/search_repo_implement.dart';
import 'package:newsapp/feature/search/presentation/manger/search/search_cubit.dart';
import 'widgets/searchpage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(getIt.get<SearchRepoImplement>()),
        child: const SafeArea(child: SearchPageBody()),
      ),
    );
  }
}
