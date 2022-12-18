import 'dart:collection';
import 'package:flutter/material.dart';

import '../models/node.dart';

class Algorithms extends ChangeNotifier{
  void bfs(HashMap<int, List<Node>> graph,Node startNode ) async {
    HashSet<int> visited = HashSet();
    Queue<Node> que = Queue();
    visited.add(startNode.nodeNo);
    startNode.SetVisited(vis: true);
    que.add(startNode);
    while (que.length != 0) {
      int size = que.length;
      await Future.delayed(Duration(seconds: 2));
      while (size-- > 0) {
        Node node = que.removeFirst();
        print(node.nodeNo);
        List<Node>? listOfNodes = graph[node.nodeNo];
        for (int i = 0; i < listOfNodes!.length; i++) {
          Node child = listOfNodes[i];
          if (visited.contains(child.nodeNo)) continue;
          que.add(child);
          visited.add(child.nodeNo);
          child.SetVisited(vis: true);
        }
        notifyListeners();
      }
    }
  }

}
