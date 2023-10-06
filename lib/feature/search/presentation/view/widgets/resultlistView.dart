import 'package:flutter/material.dart';
import 'package:newsapp/feature/home/data/newsmodel/newsmodel.dart';
import 'result.dart';

class ResultNewsListView extends StatelessWidget {
  const ResultNewsListView({super.key, required this.news});
  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ResultNews(news: news[index]),
          );
        },
      ),
    );
  }
}
