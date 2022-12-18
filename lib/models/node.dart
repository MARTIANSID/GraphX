import 'package:flutter/material.dart';

class Node {
  int nodeNo;
  Offset coordinates;
  bool _visited=false;
  Node({ required this.nodeNo, required this.coordinates});
  get visited{
    return _visited;
  }
  void SetVisited({required bool vis}){
    _visited=vis;
  }
}
