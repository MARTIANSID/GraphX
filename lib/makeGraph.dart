import 'package:flutter/material.dart';

import 'models/node.dart';
import 'models/edge.dart';

class MakeGraph extends CustomPainter {
  List<Node> nodes;
  List<Edge> edges;
  MakeGraph({required this.nodes, required this.edges});
  @override
  void paint(Canvas canvas, Size size) {
    var nodeInnerPaint = Paint()
      ..color = Color.fromRGBO(104, 174, 186, 1)
      ..style = PaintingStyle.fill;
    var nodeOutterPaint= Paint()
      ..color = Color.fromRGBO(168, 180, 195, 1)
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

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
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
