import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:graphx/Helper/GraphHelpers.dart';
import 'package:graphx/models/edge.dart';
import '../models/node.dart';
import 'dart:math' as math;

class MakeGraphProvider extends ChangeNotifier {
  Map<int,Node> _nodes = new HashMap();
  List<Edge> _edges = [];
  bool _isDirected = false;
  int _maxNode = 1;
  void addNode({required Node node}) {
    node.nodeNo = _maxNode++;
    _nodes.putIfAbsent(node.nodeNo, () => node);
    // _nodes.add(node);s
    notifyListeners();
  }
  
  void addEdge({required Edge edge}) {
    _edges.add(edge);
    notifyListeners();
  }
  void setNodeVisited({required int nodeNo}){
    _nodes[nodeNo]!.SetVisited(vis: true);
    notifyListeners();
  }
  set setIsDirected(bool isDirected) {
    _isDirected = isDirected;
  }


  get getIsDirected {
    return _isDirected;
  }
   void setAllNodesUnvisited(){
    for(int key in _nodes.keys){
      _nodes[key]!.SetVisited(vis: false);
    }
    notifyListeners();
  }
  void makeEdge(int nodeNo1, int nodeNo2, bool isDirected,
      {int? weight, int? textAboveEdge}) {
    Node? node1 =_nodes[nodeNo1];
    Node? node2 =_nodes[nodeNo2];
    _edges.add(Edge(
        node1: node1!, node2: node2!, weight: weight, isDirected: isDirected));
    notifyListeners();
  }

  void removeNode(Offset point1) {
    for (int nodeNo in _nodes.keys) {
      Node node = _nodes[nodeNo]!;
      Offset point2 = node.coordinates;
      double distance =
          GraphHelpers.distanceBwPoints(point1: point1, point2: point2);
      // node should be removed
      if (distance <= 18) {
        _nodes.remove(nodeNo);
        //index's of edges that should be removed
        List<int> _indToRemove = [];
        //get the indexes to be removed
        for (int j = 0; j < _edges.length; j++) {
          Edge e = _edges[j];
          if (nodeCompare(e.node1, node) || nodeCompare(e.node2, node)) {
            _indToRemove.add(j);
          }
        }
        //traverse from back else it will create problem
        for (int j = _indToRemove.length - 1; j >= 0; j--)
          _edges.removeAt(_indToRemove[j]);
        break;
      }
    }
    if (_nodes.length == 0) _maxNode = 1;
    notifyListeners();
  }

  bool nodeCompare(Node node1, Node node2) {
    return node1.nodeNo == node2.nodeNo;
  }

  get nodesMap {
    return _nodes;
  }

  get  edgeList {
    return _edges;
  }
}
