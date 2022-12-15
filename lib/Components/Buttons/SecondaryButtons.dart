import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondaryButton extends StatelessWidget {
  String buttonName;
  Function function;

  SecondaryButton({required this.buttonName, required this.function});

  // const SecondaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(234, 245, 254, 1),
          side: BorderSide(
            width: 0.9,
            color: Color.fromRGBO(197, 218, 236, 1),
          )),
      onPressed: (){
        function();
      },
      child: Text(
        buttonName,
        style: TextStyle(color: Color.fromRGBO(45, 110, 158, 1)),
      ),
    );
  }
}
