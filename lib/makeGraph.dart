import 'package:flutter/material.dart';
import 'package:graphx/Helper/CostumColor.dart';

import 'models/node.dart';
import 'models/edge.dart';

class MakeGraph extends CustomPainter {
  List<Node> nodes;
  List<Edge> edges;
  MakeGraph({required this.nodes, required this.edges});
  @override
  void paint(Canvas canvas, Size size) {
    var nodeInnerPaint = Paint()
      ..color = CostumColor.nodeInnerColor
      ..style = PaintingStyle.fill;
      
    var nodeOutterPaint= Paint()
      ..color = CostumColor.nodeOuterColor
      ..strokeWidth=2
      ..style = PaintingStyle.stroke;
    double nodedRadius=18;
    for (int i = 0; i < nodes.length; i++) {
      String nodeName="${i+1}";
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
      textPainter.paint(canvas,getTextPaintCordinates(coordinates: nodes[i]!.coordinates!,nodeName: nodeName));
    }
    for (int i = 0; i < edges.length; i++) {
      Edge e = edges[i];
      // canvas.drawLine(, p2, paint)
    }
  }
  @override
  bool shouldRepaint(MakeGraph oldDelegate) {
    return true;
  }
  Offset getTextPaintCordinates({required Offset coordinates,required String nodeName}){
    if(nodeName.length==1){
      return Offset(coordinates.dx-5, coordinates.dy-5);
    }else if(nodeName.length==2){
       return Offset(coordinates.dx-9, coordinates.dy-5);
    }
     return Offset(coordinates.dx-13, coordinates.dy-5);;
  }
  @override
  bool shouldRebuildSemantics(MakeGraph oldDelegate) => false;
}
