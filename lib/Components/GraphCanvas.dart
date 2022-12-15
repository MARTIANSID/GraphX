import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphx/Providers/MakeGraph.dart';
import 'package:graphx/Providers/OperationButtonSelected.dart';
import 'package:graphx/makeGraph.dart';
import 'package:provider/provider.dart';

import '../models/node.dart';

class GraphCanvas extends StatefulWidget {
  @override
  State<GraphCanvas> createState() => _GraphCanvasState();
}

class _GraphCanvasState extends State<GraphCanvas> {
  @override
  Widget build(BuildContext context) {
    OperationButtonSelected operationButton =
        Provider.of<OperationButtonSelected>(context);

    MakeGraphProvider makeGraph = Provider.of<MakeGraphProvider>(context);

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
              makeGraph.addNode(
                  node: Node(
                      coordinates: Offset(
                          details.localPosition.dx, details.localPosition.dy),
                      nodeNo: makeGraph.nodesList.length + 1));
            } else if (operationButton.selected == 3) {
              makeGraph.removeNode(
                  Offset(details.localPosition.dx, details.localPosition.dy));
            }
          }),
          child: CustomPaint(
            painter: MakeGraph(
                nodes: makeGraph.nodesList, edges: makeGraph.edgeList),
          )),
    );
  }
}
