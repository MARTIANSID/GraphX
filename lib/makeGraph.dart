import 'package:flutter/material.dart';
import 'package:graphx/Helper/CanvasHelper.dart';
import 'package:graphx/Helper/CostumColor.dart';
import 'package:graphx/Helper/TextPainterHelper.dart';

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
    double nodeRadius = 18;
    for (int i = 0; i < nodes.length; i++) {
      CanvasHelper.buildNode(node: nodes[i]!, canvas: canvas, nodedRadius: nodeRadius);
    }

    for (int i = 0; i < edges.length; i++) {
        CanvasHelper.buidEdge(canvas: canvas, edge: edges[i]!, nodeRadius: nodeRadius);
        CanvasHelper.buildWeight(canvas: canvas, edge: edges[i]!);
    }
  }

  @override
  bool shouldRepaint(MakeGraph oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(MakeGraph oldDelegate) => false;
}
