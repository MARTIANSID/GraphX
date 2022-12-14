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

  get nodesList {
    return _nodes;
  }

  get edgeList {
    return _edges;
  }
}
