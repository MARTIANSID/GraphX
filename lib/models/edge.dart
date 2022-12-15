import 'package:flutter/material.dart';

import 'node.dart';

class Edge {
  int? weight;
  bool isDirected = false;
  Node node1;
  Node node2;
  Edge(
      {this.weight,
      required this.isDirected,
      required this.node1,
      required this.node2});
}
