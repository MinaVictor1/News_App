import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/Utils/custom_Loading_indicator.dart';
import 'package:newsapp/core/Utils/custom_error_widget.dart';
import 'package:newsapp/feature/home/presentation/manger/latest_news/latest_news_cubit.dart';
import 'package:newsapp/feature/home/presentation/view/widgets/latestnews.dart';

class LatestNewsListView extends StatelessWidget {
  const LatestNewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestNewsCubit, LatestNewsState>(
      builder: (context, state) {
        if (state is LatestNewsSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: LatestNews(news: state.books[index]),
                );
              },
            ),
          );
        } else if (state is LatestNewsFaluire) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
