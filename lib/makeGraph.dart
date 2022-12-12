import 'package:flutter/material.dart';

class MakeGraph extends CustomPainter {
  List<Offset> centers;
  MakeGraph(this.centers);
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.lightBlue
      ..style = PaintingStyle.fill;

    for (int i = 0; i < centers.length; i++) {
      TextSpan span =
          TextSpan(style: TextStyle(color: Colors.black), text: "${i + 1}");
      TextPainter textPainter = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      textPainter.layout();
      canvas.drawCircle(centers[i], 10, paint1);
      textPainter.paint(canvas, Offset(centers[i].dx - 5, centers[i].dy - 5));
    }
  }

  @override
  bool shouldRepaint(MakeGraph oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(MakeGraph oldDelegate) => false;
}
