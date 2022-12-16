import 'package:flutter/material.dart';
import 'dart:math' as math;

class PathsHelper{
  static Path pathOfLineArrow({required Offset p1, required Offset p2}) {
    final dX = p2.dx - p1.dx;
    final dY = p2.dy - p1.dy;
    final angle = math.atan2(dY, dX);
    final arrowSize = 15;
    double arrowAngle = 25 * math.pi / 180;
    final path = Path();

    path.moveTo(p2.dx - arrowSize * math.cos(angle - arrowAngle),
        p2.dy - arrowSize * math.sin(angle - arrowAngle));
    path.lineTo(p2.dx, p2.dy);
    path.lineTo(p2.dx - arrowSize * math.cos(angle + arrowAngle),
        p2.dy - arrowSize * math.sin(angle + arrowAngle));
    path.close();
    return path;
  }
}