import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:graphx/Helper/GraphHelpers.dart';

import '../models/node.dart';
import '../Providers/MakeGraphProvider.dart';

class Bfs{
  static void run(
      {required MakeGraphProvider provider, required Node startNode}) async {
    HashSet<int> visited = HashSet();
    HashMap<int, List<Node>> graph =
        GraphHelpers.getGraph(edgeList: provider.edgeList);
    Queue<Node> que = Queue();
    visited.add(startNode.nodeNo);
    startNode.SetVisited(vis: true);
    que.add(startNode);
    while (que.length != 0) {
      int size = que.length;
      await Future.delayed(Duration(seconds: 2));
      while (size-- > 0) {
        Node node = que.removeFirst();
        List<Node>? listOfNodes = graph[node.nodeNo];
        for (int i = 0; i < listOfNodes!.length; i++) {
          Node child = listOfNodes[i];
          if (visited.contains(child.nodeNo)) continue;
          que.add(child);
          visited.add(child.nodeNo);
          provider.setNodeVisited(nodeNo: child.nodeNo);
        }
      }
    }
  }
}