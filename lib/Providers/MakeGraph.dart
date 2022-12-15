import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:graphx/models/edge.dart';
import '../models/node.dart';

class MakeGraphProvider extends ChangeNotifier {
  List<Node> _nodes = [];
  List<Edge> _edges = [];

  void addNode({required Node node}) {
    node.nodeNo = _nodes.length + 1;
    _nodes.add(node);
    notifyListeners();
  }

  void addEdge({required Edge edge}) {
    _edges.add(edge);
    notifyListeners();
  }

  void makeEdge(int nodeNo1, int nodeNo2, bool isDirected,
      {int? weight, int? textAboveEdge}) {
    Node node1 = _nodes[nodeNo1 - 1];
    Node node2 = _nodes[nodeNo2 - 1];
    _edges.add(new Edge(
        node1: node1,
        node2: node2,
        weight: weight,
        isDirected: isDirected));
    notifyListeners();
  }

  get nodesList {
    return _nodes;
  }

  get edgeList {
    return _edges;
  }
}
