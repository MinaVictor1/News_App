import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final String? text;
  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: MaterialButton(
          onPressed: onPressed,
          color: Colors.black,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              const Spacer(),
              Icon(icon),
              Text(text ?? ''),
              const Spacer() // Adjust the spacing between the text and icon
            ],
          ),
        ),
      ),
    );
  }
}
