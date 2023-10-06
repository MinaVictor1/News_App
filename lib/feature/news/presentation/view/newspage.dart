import 'package:flutter/material.dart';

import '../../../home/data/newsmodel/newsmodel.dart';
import 'widgets/Newspagebody.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key, required this.news}) : super(key: key);

  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NewsPageBody(news: news),
      ),
    );
  }
}
