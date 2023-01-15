import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    required this.controller,
  }) : super(key: key);
  final String hintText;
  final bool isPassword;
  final TextInputType inputType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
          ),
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 12,
            bottom: 12,
          ),
        ),
      ),
    );
  }
}
