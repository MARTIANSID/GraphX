import 'package:flutter/animation.dart';

class CostumColor {
  static Color? _primary = Color.fromRGBO(51, 122, 183, 1);
  static Color? _darkPrimary = Color.fromARGB(255, 34, 101, 160);
  static Color? _nodeOuterColor=Color.fromRGBO(168, 180, 195, 1);
  static Color? _nodeInnerColor=Color.fromRGBO(104, 174, 186, 1);
  static Color? _weightRectangleFillColor=Color.fromARGB(255, 83, 150, 161);
  static get primay {
    return _primary;
  }
  static get nodeOuterColor{
    return _nodeOuterColor;
  }
  static get nodeInnerColor{
    return _nodeInnerColor;
  }

  static get darkPrimary {
    return _darkPrimary;
  }
  static get weightRectangleFillColor{
    return _weightRectangleFillColor;
  }

}
