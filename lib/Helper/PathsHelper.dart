import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:graphx/Helper/GraphHelpers.dart';

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
  static pathOfRectangleWeight({required Offset point1,required Offset point2}){
        double sideOfSquare=30;
        double diagonalOfSquare=math.sqrt(2)*sideOfSquare;
        Path path=Path();
        Offset centerPointOfLine=GraphHelpers.centerCordiantesOfLine(point1: point1, point2: point2);
        Offset aCoordinate=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: centerPointOfLine, distance:diagonalOfSquare/2 , angleInDegree: 45);

        Offset bCoordinate=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: centerPointOfLine, distance:diagonalOfSquare/2 , angleInDegree: 45+90);

        Offset cCoordinate=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: centerPointOfLine, distance:diagonalOfSquare/2 , angleInDegree: 45+180);

        Offset dCoordinate=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: centerPointOfLine, distance:diagonalOfSquare/2 , angleInDegree: 45+270);
        path.moveTo(aCoordinate.dx, aCoordinate.dy);
        path.lineTo(bCoordinate.dx,bCoordinate.dy);

        path.lineTo(cCoordinate.dx,cCoordinate.dy);

        path.lineTo(dCoordinate.dx,dCoordinate.dy);
        path.close();
        return path;
    }


  }
