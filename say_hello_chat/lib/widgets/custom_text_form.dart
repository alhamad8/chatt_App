import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  Function(String)? onChangedd;
  bool? obscureText;
  CustomTextFormField({Key? key, this.hintText, this.onChangedd, this.obscureText=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Field is required";
        }
      },
      onChanged: onChangedd,
      obscureText: obscureText!,
      decoration: InputDecoration(
          labelText: hintText,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
