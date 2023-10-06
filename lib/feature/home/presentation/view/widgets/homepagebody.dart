import 'package:flutter/material.dart';
import 'package:newsapp/core/Widgets/customtextformwidget.dart';
import 'package:newsapp/feature/home/presentation/view/widgets/LatestNewslistView.dart';
import 'customappbar.dart';
import 'hottestnewsscrollview.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mycontroller = TextEditingController();
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const HottestNewsListView(),
              const SizedBox(
                height: 20,
              ),
              Text('Latest News',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: LatestNewsListView(),
        ),
      ],
    );
  }
}
