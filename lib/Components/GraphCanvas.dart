import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphx/Providers/OperationButtonSelected.dart';
import 'package:graphx/makeGraph.dart';
import 'package:provider/provider.dart';

class GraphCanvas extends StatefulWidget {
  @override
  State<GraphCanvas> createState() => _GraphCanvasState();
}

class _GraphCanvasState extends State<GraphCanvas> {
  List<Offset> centers = [];
  @override
  Widget build(BuildContext context) {
    OperationButtonSelected operationButton =
        Provider.of<OperationButtonSelected>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: GestureDetector(
          onTapDown: ((details) {
            if (operationButton.selected == 1) {
              setState(() {
                centers.add(
                    Offset(details.localPosition.dx, details.localPosition.dy));
              });
            }
          }),
          child: CustomPaint(
            painter: MakeGraph(centers),
          )),
    );
  }
}
