import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:graphx/Helper/GraphHelpers.dart';

import '../models/node.dart';
import '../Providers/MakeGraphProvider.dart';

class Algorithms {
  void bfs(
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

  void dfs(
      {required MakeGraphProvider provider,
      required HashSet<int>? visited,
      required Node src,
      required List<Node>? order}) async {
    visited!.add(src.nodeNo);
    order!.add(src);

    List<Node>? graph =
        GraphHelpers.getGraph(edgeList: provider.edgeList)[src.nodeNo];
    for (int i = 0; i < graph!.length; i++) {
      Node node = graph[i];
      if (visited.contains(node.nodeNo)) continue;
      dfs(provider: provider, visited: visited, src: node, order: order);
    }
  }

  void dfsHelper(List<Node>? visited, MakeGraphProvider provider) async {
    for (int i = 0; i < visited!.length; i++) {
      Node ele = visited.elementAt(i);
      provider.setNodeVisited(nodeNo: ele.nodeNo);
      await Future.delayed(Duration(seconds: 2));
    }
  }
}
