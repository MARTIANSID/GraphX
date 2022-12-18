import 'dart:collection';
import '../models/node.dart';

class Algorithms {
  void bfs(HashMap<int, List<Node>> graph, Node startNode) async {
    HashSet<int> visited = HashSet();
    Queue<Node> que = Queue();
    startNode.SetVisited(vis: true);
    visited.add(startNode.nodeNo);
    que.add(startNode);
    while (que.length != 0) {
      int size = que.length;
      await Future.delayed(Duration(seconds: 2));
      while (size-- > 0) {
        Node node = que.removeFirst();
        List<Node>? listOfNodes = graph[node.nodeNo];
        for (int i = 0; i < listOfNodes!.length; i++) {
          Node child = listOfNodes[i];
          child.SetVisited(vis: true);
          if (visited.contains(child.nodeNo)) continue;
          que.add(child);
          visited.add(child.nodeNo);
        }
      }
    }
  }
}
