import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:graphx/models/edge.dart';
import '../models/node.dart';
import 'dart:math' as math;

class MakeGraphProvider extends ChangeNotifier {
  List<Node> _nodes = [];
  List<Edge> _edges = [];
  bool _isDirected = false;

  void addNode({required Node node}) {
    node.nodeNo = _nodes.length + 1;
    _nodes.add(node);
    notifyListeners();
  }

  void addEdge({required Edge edge}) {
    _edges.add(edge);
    notifyListeners();
  }

  set setIsDirected(bool isDirected) {
    _isDirected = isDirected;
  }

  get getIsDirected {
    return _isDirected;
  }

  void makeEdge(int nodeNo1, int nodeNo2, bool isDirected,
      {int? weight, int? textAboveEdge}) {
    Node node1 = _nodes[nodeNo1 - 1];
    Node node2 = _nodes[nodeNo2 - 1];
    _edges.add(Edge(
        node1: node1, node2: node2, weight: weight, isDirected: isDirected));
    notifyListeners();
  }

  void removeNode(Offset point1) {
    for (int i = _nodes.length-1; i >=0; i--) {
      Node node = _nodes[i];
      Offset point2 = node.coordinates;
      double distance = math.sqrt(math.pow(point1.dx - point2.dx, 2) +
          math.pow(point1.dy - point2.dy, 2));
      // node should be removed
      if (distance <= 18) {
        _nodes.removeAt(i);
        for (int j = 0; j < _edges.length; j++) {
          Edge e = _edges[j];
          if (nodeCompare(e.node1.coordinates, point2) ||
              nodeCompare(e.node2.coordinates, point2)) {
            _edges.removeAt(j);
          }
        }
        break;
      }
    }
    notifyListeners();
  }

  bool nodeCompare(Offset point1, Offset point2) {
    if (point1.dx == point2.dx && point1.dy == point2.dy) return true;
    return false;
  }

  get nodesList {
    return _nodes;
  }

  get edgeList {
    return _edges;
  }
}
