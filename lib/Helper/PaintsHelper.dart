import 'package:flutter/material.dart';

import 'CostumColor.dart';

class PaintsHelper {

  static get nodeInnerPaint {
    return Paint()
      ..color = CostumColor.nodeInnerColor
      ..style = PaintingStyle.fill;
  }

  static get nodeOutterPaint {
    return Paint()
      ..color = CostumColor.nodeOuterColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
  }
  static get nodeInnerPaintSelected {
    return Paint()
      ..color = CostumColor.nodeInnerColorSelected
      ..style = PaintingStyle.fill;
  }
  static get nodeOutterPaintSelected {
    return Paint()
      ..color = CostumColor.nodeOuterColorSelected
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
  }
  
  static get paintOfWeightNode {
    return Paint()
    ..color = CostumColor.weightRectangleFillColor
    ..style = PaintingStyle.fill;
  }
  static get paintOfWeightNodeBorder {
    return Paint()
    ..color = CostumColor.nodeOuterColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
  }
  static get edgePaint{
    return Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
  }

}
