import 'package:flutter/animation.dart';

class CostumColor {
  Color? _primary = Color.fromRGBO(51, 122, 183, 1);
  Color? _darkPrimary = Color.fromARGB(255, 34, 101, 160);
  get primay {
    return _primary;
  }

  get darkPrimary {
    return _darkPrimary;
  }
}
