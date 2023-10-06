import 'package:flutter/material.dart';
import 'package:newsapp/feature/home/presentation/view/widgets/homepagebody.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomePageBody()),
    );
  }
}
