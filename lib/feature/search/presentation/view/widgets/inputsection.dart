import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Widgets/CustomButton.dart';
import '../../../../../core/Widgets/customtextformwidget.dart';
import '../../manger/search/search_cubit.dart';

class InputSection extends StatelessWidget {
  const InputSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController mycontroller = TextEditingController();
    double height = MediaQuery.of(context).size.height * 0.01;
    return Column(
      children: [
        CustomTextForm(hinttext: 'Search Here', mycontroller: mycontroller),
        SizedBox(
          height: height,
        ),
        CustomButton(
            onPressed: () {
              BlocProvider.of<SearchCubit>(context)
                  .fetchSearchNews(category: mycontroller.text);
            },
            icon: Icons.arrow_circle_right)
      ],
    );
  }
}
