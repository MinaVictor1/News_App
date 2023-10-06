import 'package:flutter/material.dart';
import 'package:newsapp/feature/home/data/newsmodel/newsmodel.dart';

import '../../../../../core/Utils/networkimage.dart';

class NewsPageBody extends StatelessWidget {
  const NewsPageBody({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          CustomNetworkImage(
            url: news.urlToImage! ??
                'https://as1.ftcdn.net/v2/jpg/05/62/05/20/1000_F_562052065_yk3KPuruq10oyfeu5jniLTS4I2ky3bYX.jpg',
          ),
          Text(news.title ?? ' ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 25)),
          Text(news.description ?? '',
              style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
