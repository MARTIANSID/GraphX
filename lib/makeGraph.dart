import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math.dart';
import 'package:graphx/Helper/CostumColor.dart';

import 'models/node.dart';
import 'models/edge.dart';
import 'dart:math' as math;

class MakeGraph extends CustomPainter {
  List<Node> nodes;
  List<Edge> edges;
  MakeGraph({required this.nodes, required this.edges});
  @override
  void paint(Canvas canvas, Size size) {
    var nodeInnerPaint = Paint()
      ..color = CostumColor.nodeInnerColor
      ..style = PaintingStyle.fill;
    var nodeOutterPaint = Paint()
      ..color = CostumColor.nodeOuterColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double nodedRadius = 18;
    for (int i = 0; i < nodes.length; i++) {
      String nodeName = "${i + 1}";
      TextSpan span =
          TextSpan(style: TextStyle(color: Colors.yellow), text: nodeName);
      TextPainter textPainter = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      textPainter.layout();
      //inner color of node
      canvas.drawCircle(nodes[i].coordinates!, nodedRadius, nodeInnerPaint);
      //boundary of a node
      canvas.drawCircle(nodes[i].coordinates!, nodedRadius, nodeOutterPaint);
      //node number
      textPainter.paint(
          canvas,
          getTextPaintCordinates(
              coordinates: nodes[i]!.coordinates!, nodeName: nodeName));
    }
    final edgePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
    for (int i = 0; i < edges.length; i++) {
      Edge e = edges[i];
      Offset point1 = e.node1.coordinates;
      Offset point2 = e.node2.coordinates;
      bool isDirected = e.isDirected;

      double updatedX1, updatedX2, updatedY1, updatedY2;

      if (point1.dx < point2.dx) {
        updatedX2 = point2.dx -
            (point2.dx - point1.dx) *
                nodedRadius /
                (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                    (point2.dy - point1.dy) * (point2.dy - point1.dy)));
        updatedX1 = point1.dx +
            (point2.dx - point1.dx) *
                nodedRadius /
                (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                    (point2.dy - point1.dy) * (point2.dy - point1.dy)));
      } else {
        updatedX2 = point2.dx +
            (point1.dx - point2.dx) *
                nodedRadius /
                (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                    (point2.dy - point1.dy) * (point2.dy - point1.dy)));
        updatedX1 = point1.dx -
            (point1.dx - point2.dx) *
                nodedRadius /
                (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                    (point2.dy - point1.dy) * (point2.dy - point1.dy)));
      }

      if (point1.dy < point2.dy) {
        updatedY2 = point2.dy -
            (point2.dy - point1.dy) *
                nodedRadius /
                (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                    (point2.dy - point1.dy) * (point2.dy - point1.dy)));
        updatedY1 = point1.dy +
            (point2.dy - point1.dy) *
                nodedRadius /
                (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                    (point2.dy - point1.dy) * (point2.dy - point1.dy)));
      } else {
        updatedY2 = point2.dy +
            (point1.dy - point2.dy) *
                nodedRadius /
                (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                    (point2.dy - point1.dy) * (point2.dy - point1.dy)));
        updatedY1 = point1.dy -
            (point1.dy - point2.dy) *
                nodedRadius /
                (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                    (point2.dy - point1.dy) * (point2.dy - point1.dy)));
      }

      Offset p1 = Offset(updatedX1, updatedY1);
      Offset p2 = Offset(updatedX2, updatedY2);

      if (isDirected) {
        canvas.drawLine(p1, p2, edgePaint);
        //draw arrow
        canvas.drawPath(pathOfTriangle(p1: p1, p2: p2), edgePaint);
      } else {
        canvas.drawLine(p1, p2, edgePaint);
      }
    }
  }

  @override
  bool shouldRepaint(MakeGraph oldDelegate) {
    return true;
  }

  double angleOf(Offset p1, Offset p2) {
    final double deltaY = (p1.dy - p2.dy);
    final double deltaX = (p2.dx - p1.dx);
    final double result = math.atan2(deltaY, deltaX);
    return (result < 0) ? (360 + result) : result;
  }

  Offset getTextPaintCordinates(
      {required Offset coordinates, required String nodeName}) {
    if (nodeName.length == 1) {
      return Offset(coordinates.dx - 5, coordinates.dy - 5);
    } else if (nodeName.length == 2) {
      return Offset(coordinates.dx - 9, coordinates.dy - 5);
    }
    return Offset(coordinates.dx - 13, coordinates.dy - 5);
  }

  double degreeToRadian({required double degree}) {
    return degree * math.pi / 180;
  }

  Path pathOfTriangle({required Offset p1, required Offset p2}) {
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

  double radianToDegree({required double radian}) {
    return radian * 180 / math.pi;
  }

  @override
  bool shouldRebuildSemantics(MakeGraph oldDelegate) => false;
}
