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

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(MakeGraph oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(MakeGraph oldDelegate) => false;
}
