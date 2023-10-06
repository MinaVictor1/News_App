import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/core/Utils/networkimage.dart';
import 'package:newsapp/feature/home/data/newsmodel/newsmodel.dart';

import '../../../../../core/Utils/app_router.dart';

class HottestNews extends StatelessWidget {
  const HottestNews({Key? key, required this.news}) : super(key: key);
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(Approute.kNewsPage, extra: news);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .7,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: NetworkImage(news.urlToImage ??
                        'https://as1.ftcdn.net/v2/jpg/05/62/05/20/1000_F_562052065_yk3KPuruq10oyfeu5jniLTS4I2ky3bYX.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  news.title!,
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
SizedBox(
        width: 300,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: NetworkImage(news.urlToImage!),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Text widget
                Text(news.title!,
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),

 */