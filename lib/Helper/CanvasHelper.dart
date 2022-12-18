import 'package:flutter/cupertino.dart';
import 'package:graphx/models/node.dart';

import '../models/edge.dart';
import 'GraphHelpers.dart';
import 'PaintsHelper.dart';
import 'PathsHelper.dart';
import 'TextPainterHelper.dart';

class CanvasHelper {
  static void buildNode(
      {required Node node,
      required Canvas canvas,
      required double nodedRadius}) {
    String nodeName = "${node.nodeNo}";
    TextPainter nodeCenterPaint =
        TextPainterHelper.nodeCenterPaint(nodeName: nodeName);
    //inner color of node
    canvas.drawCircle(
        node.coordinates!,
        nodedRadius,
        node!.visited
            ? PaintsHelper.nodeInnerPaintSelected
            : PaintsHelper.nodeInnerPaint);
    //boundary of a node

    canvas.drawCircle(
        node.coordinates!,
        nodedRadius,
        node!.visited
            ? PaintsHelper.nodeOutterPaintSelected
            : PaintsHelper.nodeOutterPaint);

    //node number
    nodeCenterPaint.paint(
        canvas,
        GraphHelpers.getTextPaintCordinates(
            coordinates: node!.coordinates!, nodeName: nodeName));
  }

    /*
        make the edges directed and undirected
    */
  static void buidEdge(
      {required Canvas canvas,
      required Edge edge,
      required double nodeRadius}) {
    Edge e = edge;
    Offset point1 = e.node1.coordinates;
    Offset point2 = e.node2.coordinates;
    bool isDirected = e.isDirected;

    List<Offset> updatedOffSetsForEdgeBW2Nodes =
        GraphHelpers.findUpdatedOffSetsForEdgeBW2Nodes(
            point1: point1, point2: point2, nodedRadius: nodeRadius);

    Offset p1 = updatedOffSetsForEdgeBW2Nodes[0];
    Offset p2 = updatedOffSetsForEdgeBW2Nodes[1];

    if (isDirected) {
      canvas.drawLine(p1, p2, PaintsHelper.edgePaint);
      //draw arrow
      canvas.drawPath(
          PathsHelper.pathOfLineArrow(p1: p1, p2: p2), PaintsHelper.edgePaint);
    } else {
      canvas.drawLine(p1, p2, PaintsHelper.edgePaint);
    }
  }

  static void buildWeight({required Canvas canvas, required Edge edge}) {
    Edge e = edge;
    Offset point1 = e.node1.coordinates;
    Offset point2 = e.node2.coordinates;
    if (e.weight != null) {
      String weightOfEdge = "${e.weight}";
      TextPainter weightTextPaint =
          TextPainterHelper.weightPainter(weight: weightOfEdge);
      //path of weight
      Path pathOfWeight =
          PathsHelper.pathOfRectangleWeight(point1: point1, point2: point2);

      Path pathOfWeightBorder = PathsHelper.pathOfRectangleWeightBorder(
          point1: point1, point2: point2);
      //draw weighted rectangle
      canvas.drawPath(pathOfWeight, PaintsHelper.paintOfWeightNode);
      canvas.drawPath(pathOfWeightBorder, PaintsHelper.paintOfWeightNodeBorder);
      //print text of weight
      weightTextPaint.paint(
          canvas,
          GraphHelpers.cordiantesForPrintIngWeight(
              point1: point1, point2: point2, weight: e.weight.toString()));
    }
  }
}
