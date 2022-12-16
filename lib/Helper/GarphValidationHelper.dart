import 'package:flutter/material.dart';
import 'package:graphx/models/edge.dart';
import 'package:graphx/models/node.dart';
import 'dart:math' as math;
mixin GraphHelpers{
  static bool isEdgeThere({required int first,required int second,required List<Edge> edgesList}){
    for(Edge edge in edgesList){
      if((first==edge.node1.nodeNo&&second==edge.node2.nodeNo)||(first==edge.node2.nodeNo&&second==edge.node1.nodeNo))return true;
    }
    return false;
  }
  static bool isNodePresent({required int nodeNo,required List<Node> nodesList}){
    for(Node node in nodesList){
      if(node.nodeNo==nodeNo)return true;
    }
    return false;
  }
  static Node? getNodeWithNodeNo({required int nodeNo,required List<Node> nodeList}){
    for(Node node in nodeList){
      if(node.nodeNo==nodeNo)return node;
    }
    return null;
  }
  static double distanceBwPoints({required Offset point1,required Offset point2}){
    return math.sqrt(math.pow(point1.dx - point2.dx, 2) +
          math.pow(point1.dy - point2.dy, 2));
  }
}