import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:graphx/Helper/GraphHelpers.dart';

import '../models/node.dart';
import '../Providers/MakeGraphProvider.dart';

class Dfs{
   static Future<void> run(
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
      run(provider: provider, visited: visited, src: node, order: order);
    }
  }
  static Future<void> dfsHelper(List<Node>? visited, MakeGraphProvider provider) async {
    for (int i = 0; i < visited!.length; i++) {
      Node ele = visited.elementAt(i);
      provider.setNodeVisited(nodeNo: ele.nodeNo);
      await Future.delayed(Duration(seconds: 1));
    }
  }
}