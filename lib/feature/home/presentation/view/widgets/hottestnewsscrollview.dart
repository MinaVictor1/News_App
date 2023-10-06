import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/core/Utils/custom_Loading_indicator.dart';
import 'package:newsapp/core/Utils/custom_error_widget.dart';
import 'package:newsapp/feature/home/presentation/manger/hottest_news/hottest_news_cubit.dart';
import 'hottestnews.dart';

class HottestNewsListView extends StatelessWidget {
  const HottestNewsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HottestNewsCubit, HottestNewsState>(
      builder: (context, state) {
        if (state is HottestNewsSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              //physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: HottestNews(news: state.news[index]),
                );
              },
            ),
          );
        } else if (state is HottestNewsFaliure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
