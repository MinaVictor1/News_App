import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/Utils/custom_Loading_indicator.dart';
import 'package:newsapp/core/Utils/custom_error_widget.dart';
import 'package:newsapp/feature/home/data/newsmodel/newsmodel.dart';
import 'package:newsapp/feature/search/presentation/manger/search/search_cubit.dart';
import 'inputsection.dart';
import 'resultlistView.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const InputSection(),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const CustomLoadingIndicator();
                      } else if (state is SearchSuccess) {
                        final news = state.books;
                        return ResultNewsListView(news: news);
                      } else if (state is SearchFaliure) {
                        return CustomErrorWidget(errMessage: state.errMessage);
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
