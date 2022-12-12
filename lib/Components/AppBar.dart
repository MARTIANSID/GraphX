import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "GraphX",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(51, 122, 183, 1)),
        )
      ],
    );
  }
}
