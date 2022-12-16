import 'package:flutter/material.dart';
import 'package:graphx/Helper/CostumColor.dart';

import 'Helper/GraphHelpers.dart';
import 'Helper/PaintsHelper.dart';
import 'Helper/PathsHelper.dart';
import 'models/node.dart';
import 'models/edge.dart';
import 'dart:math' as math;

class MakeGraph extends CustomPainter {
  List<Node> nodes;
  List<Edge> edges;
  MakeGraph({required this.nodes, required this.edges});
  @override
  void paint(Canvas canvas, Size size) {
    double nodedRadius = 18;
    for (int i = 0; i < nodes.length; i++) {
      String nodeName = "${nodes[i].nodeNo}";
      TextSpan span = TextSpan(
          style: const TextStyle(color: Colors.yellow), text: nodeName);
      TextPainter nodeCenterPaint = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      nodeCenterPaint.layout();
      //inner color of node
      canvas.drawCircle(
          nodes[i].coordinates!, nodedRadius, PaintsHelper.nodeInnerPaint);
      //boundary of a node
      canvas.drawCircle(
          nodes[i].coordinates!, nodedRadius, PaintsHelper.nodeOutterPaint);
      //node number
      nodeCenterPaint.paint(
          canvas,
          GraphHelpers.getTextPaintCordinates(
              coordinates: nodes[i]!.coordinates!, nodeName: nodeName));
    }

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
        canvas.drawLine(p1, p2, PaintsHelper.edgePaint);
        //draw arrow
        canvas.drawPath(PathsHelper.pathOfLineArrow(p1: p1, p2: p2),
            PaintsHelper.edgePaint);
      } else {
        canvas.drawLine(p1, p2, PaintsHelper.edgePaint);
      }
      if (e.weight != null) {
        /*
          center cordiantes where weight need to be shown
          */
        Offset centerCordiante =
            GraphHelpers.centerCordiantesOfLine(point1: p1, point2: p2);
        canvas.drawRect(
          centerCordiante & const Size(30, 20),
          PaintsHelper.paintOfWeightNode,
        );
      }
    }
  }

  @override
  bool shouldRepaint(MakeGraph oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(MakeGraph oldDelegate) => false;
}
