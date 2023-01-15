import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.buttonText}) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: () {}, child: Text(buttonText)),
    );
  }
}
