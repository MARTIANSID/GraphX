import 'package:flutter/material.dart';
import 'package:graphx/Helper/CostumColor.dart';

import 'Helper/GarphValidationHelper.dart';
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
      String nodeName = "${nodes[i].nodeNo}";
      TextSpan span =
          TextSpan(style: const TextStyle(color: Colors.yellow), text: nodeName);
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
          GraphHelpers.getTextPaintCordinates(
              coordinates: nodes[i]!.coordinates!, nodeName: nodeName));
    }
    final edgePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;


    /*
        make the edges directed and undirected
    */
    for (int i = 0; i < edges.length; i++) {
      Edge e = edges[i];
      Offset point1 = e.node1.coordinates;
      Offset point2 = e.node2.coordinates;
      bool isDirected = e.isDirected;

      List<Offset> updatedOffSetsForEdgeBW2Nodes =
          GraphHelpers.findUpdatedOffSetsForEdgeBW2Nodes(
              point1: point1, point2: point2, nodedRadius: nodedRadius);

      Offset p1 = updatedOffSetsForEdgeBW2Nodes[0];
      Offset p2 = updatedOffSetsForEdgeBW2Nodes[1];
      

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

  @override
  bool shouldRebuildSemantics(MakeGraph oldDelegate) => false;
}
