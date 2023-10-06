import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/feature/home/data/newsmodel/newsmodel.dart';

import '../../../../../core/Utils/app_router.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(Approute.kNewsPage, extra: news);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(news.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(news.description!,
                    maxLines: 3, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(
                  height: 3,
                ),
                Text(news.publishedAt!.substring(0, 10),
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          CachedNetworkImage(
            height: 100,
            imageUrl: news.urlToImage!,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
