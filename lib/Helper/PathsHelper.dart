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
    Path path=Path();
    if(point2.dx-point1.dx>=0){
      Offset pointA=GraphHelpers.centerCordiantesOfLine(point1: point1, point2: point2);
      double angleToB=GraphHelpers.angleOf(point1, point2);
      path.moveTo(pointA.dx, pointA.dy,);
      Offset pointB=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: pointA, distance: 30, angleInDegree: angleToB);
      path.lineTo(pointB.dx, pointB.dy);

      double angleToC=(angleToB-90);
      angleToC=angleToC<0?angleToC+360:angleToC;
      Offset pointC=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: pointB, distance: 20, angleInDegree: angleToC);
      path.lineTo(pointC.dx, pointC.dy);

      double angleToD=angleToB-180;
      angleToD=angleToD<0?angleToD+360:angleToD;
      Offset pointD=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: pointC, distance: 30, angleInDegree: angleToD);
      path.lineTo(pointD.dx, pointD.dy);
      path.close();
    }else{
      Offset pointA=GraphHelpers.centerCordiantesOfLine(point1: point1, point2: point2);
      double angleToB=GraphHelpers.angleOf(point1, point2);
      angleToB=angleToB-180;
      angleToB=angleToB<0?angleToB+360:angleToB;
      path.moveTo(pointA.dx, pointA.dy,);
      Offset pointB=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: pointA, distance: 30, angleInDegree: angleToB);
      path.lineTo(pointB.dx, pointB.dy);

      double angleToC=(angleToB-90);
      angleToC=angleToC<0?angleToC+360:angleToC;
      Offset pointC=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: pointB, distance: 20, angleInDegree: angleToC);
      path.lineTo(pointC.dx, pointC.dy);

      double angleToD=angleToB-180;
      angleToD=angleToD<0?angleToD+360:angleToD;
      Offset pointD=GraphHelpers.pointsAtPerticularAngleAndDistance(point1: pointC, distance: 30, angleInDegree: angleToD);
      path.lineTo(pointD.dx, pointD.dy);
      path.close();
    }
    
    
    return path;
  }
}