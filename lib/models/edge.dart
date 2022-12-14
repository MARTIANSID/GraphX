import 'package:flutter/material.dart';

import 'node.dart';

class Edge {
  int? weight;
  bool? birderectional = false;
  Node node1;
  Node node2;
  Edge(
      {this.weight,
      this.birderectional,
      required this.node1,
      required this.node2});
}
