import 'package:flutter/material.dart';

class MakeGraph extends CustomPainter {
  List<Offset> centers;
  MakeGraph(this.centers);
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xffaa44aa)
      ..style = PaintingStyle.fill;
    for (int i = 0; i < centers.length;i++){
      canvas.drawCircle(centers[i], 50, paint1);
    } 
  }

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(MakeGraph oldDelegate) => true;
  @override
  bool shouldRebuildSemantics(MakeGraph oldDelegate) => false;
}
