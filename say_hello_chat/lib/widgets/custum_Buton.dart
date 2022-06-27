import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  customButton({
    required this.title,
    this.onTap,
  });
  String? title;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              title!,
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
          )),
    );
  }
}
