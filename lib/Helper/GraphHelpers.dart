import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:graphx/models/edge.dart';
import 'package:graphx/models/node.dart';
import 'dart:math' as math;

mixin GraphHelpers {
  static bool isEdgeThere(
      {required int first,
      required int second,
      required List<Edge> edgesList}) {
    for (Edge edge in edgesList) {
      if ((first == edge.node1.nodeNo && second == edge.node2.nodeNo) ||
          (first == edge.node2.nodeNo && second == edge.node1.nodeNo))
        return true;
    }
    return false;
  }

  static bool isNodePresent(
      {required int nodeNo, required HashSet<int> nodeSet}) {
    return nodeSet.contains(nodeNo);
  }

  static Node? getNodeWithNodeNo(
      {required int nodeNo, required List<Node> nodeList}) {
    for (Node node in nodeList) {
      if (node.nodeNo == nodeNo) return node;
    }
    return null;
  }

  static double distanceBwPoints(
      {required Offset point1, required Offset point2}) {
    return math.sqrt(math.pow(point1.dx - point2.dx, 2) +
        math.pow(point1.dy - point2.dy, 2));
  }

  static Offset pointsAtPerticularAngleAndDistance(
      {required Offset point1,
      required double distance,
      required double angleInDegree}) {
    double updatedX = point1.dx +
        (distance * math.cos(degreeToRadian(degree: angleInDegree)));
    double updatedY = point1.dy +
        (distance * math.sin(degreeToRadian(degree: angleInDegree)));
    return Offset(updatedX, updatedY);
  }

  static List<Offset> findUpdatedOffSetsForEdgeBW2Nodes(
      {required Offset point1,
      required Offset point2,
      required double nodedRadius}) {
    double updatedX1, updatedX2, updatedY1, updatedY2;

    if (point1.dx < point2.dx) {
      updatedX2 = point2.dx -
          (point2.dx - point1.dx) *
              nodedRadius /
              (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                  (point2.dy - point1.dy) * (point2.dy - point1.dy)));
      updatedX1 = point1.dx +
          (point2.dx - point1.dx) *
              nodedRadius /
              (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                  (point2.dy - point1.dy) * (point2.dy - point1.dy)));
    } else {
      updatedX2 = point2.dx +
          (point1.dx - point2.dx) *
              nodedRadius /
              (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                  (point2.dy - point1.dy) * (point2.dy - point1.dy)));
      updatedX1 = point1.dx -
          (point1.dx - point2.dx) *
              nodedRadius /
              (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                  (point2.dy - point1.dy) * (point2.dy - point1.dy)));
    }

    if (point1.dy < point2.dy) {
      updatedY2 = point2.dy -
          (point2.dy - point1.dy) *
              nodedRadius /
              (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                  (point2.dy - point1.dy) * (point2.dy - point1.dy)));
      updatedY1 = point1.dy +
          (point2.dy - point1.dy) *
              nodedRadius /
              (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                  (point2.dy - point1.dy) * (point2.dy - point1.dy)));
    } else {
      updatedY2 = point2.dy +
          (point1.dy - point2.dy) *
              nodedRadius /
              (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                  (point2.dy - point1.dy) * (point2.dy - point1.dy)));
      updatedY1 = point1.dy -
          (point1.dy - point2.dy) *
              nodedRadius /
              (math.sqrt((point2.dx - point1.dx) * (point2.dx - point1.dx) +
                  (point2.dy - point1.dy) * (point2.dy - point1.dy)));
    }
    return [Offset(updatedX1, updatedY1), Offset(updatedX2, updatedY2)];
  }

  static double angleOf(Offset p1, Offset p2) {
    final double deltaY = (p1.dy - p2.dy);
    final double deltaX = (p2.dx - p1.dx);
    final double result = radianToDegree(radian: math.atan2(deltaY, deltaX));
    return 360 - ((result < 0) ? (360 + result) : result);
  }

  static Offset getTextPaintCordinates(
      {required Offset coordinates, required String nodeName}) {
    if (nodeName.length == 1) {
      return Offset(coordinates.dx - 5, coordinates.dy - 5);
    } else if (nodeName.length == 2) {
      return Offset(coordinates.dx - 9, coordinates.dy - 5);
    }
    return Offset(coordinates.dx - 13, coordinates.dy - 5);
  }

  static Offset centerCordiantesOfLine(
      {required Offset point1, required Offset point2}) {
    double updatedX = (point2.dx + point1.dx) / 2;
    double updatedY = (point2.dy + point1.dy) / 2;
    return Offset(updatedX, updatedY);
  }

  static Offset cordiantesForPrintIngWeight(
      {required Offset point1,
      required Offset point2,
      required String weight}) {
    double sideOfSquare = 30;
    double diagonalOfSquare = math.sqrt(2) * sideOfSquare;
    double distance;
    if (weight.length == 1) {
      distance = 14;
    } else if (weight.length == 2) {
      distance = 10;
    } else {
      distance = 5;
    }
    Offset centerPointOfLine =
        GraphHelpers.centerCordiantesOfLine(point1: point1, point2: point2);
    Offset bCoordinate = GraphHelpers.pointsAtPerticularAngleAndDistance(
        point1: centerPointOfLine,
        distance: (diagonalOfSquare / 2) - distance,
        angleInDegree: 45 + 180);
    return bCoordinate;
  }

  static double degreeToRadian({required double degree}) {
    return degree * math.pi / 180;
  }

  static double radianToDegree({required double radian}) {
    return radian * 180 / math.pi;
  }

  static HashMap<int, List<Node>> getGraph({required List<Edge> edgeList}) {
    HashMap<int, List<Node>> graph = HashMap();

    for (int i = 0; i < edgeList.length; i++) {
      Edge edge = edgeList[i];
      Node point1 = edge.node1;
      Node point2 = edge.node2;
      if (edge.isDirected) {
        graph.putIfAbsent(point1.nodeNo, () => []);
        graph[point1.nodeNo]!.add(point2);
      } else {
        graph.putIfAbsent(point1.nodeNo, () => []);
        graph.putIfAbsent(point2.nodeNo, () => []);
        graph[point1.nodeNo]!.add(point2);
        graph[point2.nodeNo]!.add(point1);
      }
    }

    return graph;
  }
  static void setAllNodesUnvisited({required List<Node> nodeList}){
    for(Node node in nodeList){
      node.SetVisited(vis: false);
    }
  }
}
