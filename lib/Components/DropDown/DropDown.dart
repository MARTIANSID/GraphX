import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphx/Algorithms/Bfs.dart';
import 'package:graphx/Helper/CostumColor.dart';
import '../../Algorithms/Dfs.dart';
import '../../Providers/MakeGraphProvider.dart';
import '../../Providers/OperationButtonSelected.dart';
import '../../models/node.dart';
import '../Messages/SnackBarCostum.dart';
import 'OnHover.dart';

class DropDownBuilder extends StatefulWidget {
  MakeGraphProvider? makeGraphProvider;
  OperationButtonSelected buttonSelected;
  DropDownBuilder({required this.makeGraphProvider,required this.buttonSelected});
  @override
  State<DropDownBuilder> createState() => _DropDownBuilderState();
}

class _DropDownBuilderState extends State<DropDownBuilder> {
  List<String> data = [
    "visualize",
    "DFS",
    "BFS"
  ];
   List<Node>? orderOfDfsNodes = [];
  String initial = "visualize";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        value: initial,
        icon: Icon(Icons.keyboard_arrow_down),
        items: itemsList(),
        onChanged: (String? newvalue) async{
          setState(() {
            initial = newvalue!;
          });
          if(initial=="DFS"){
              if(widget.makeGraphProvider!.nodesMap.containsKey(1)){
                await runDfs();
                widget.makeGraphProvider!.setAllNodesUnvisited();
              }else{
                SnackBarCostum(msg: "To Run Dfs Node 1 must present").show(context: context);
              }
            }else if(initial=="BFS"){
              if(widget.makeGraphProvider!.nodesMap.containsKey(1)){
                await Bfs.run(provider: widget.makeGraphProvider!, startNode: widget.makeGraphProvider!.nodesMap[1]);
                widget.makeGraphProvider!.setAllNodesUnvisited();
              }else{
                SnackBarCostum(msg: "To Run Bfs Node 1 must present").show(context: context);
              }
          }
        },
      ),
    );
  }

  List<DropdownMenuItem<String>>? itemsList() {
    return data.map((String items) {
      return DropdownMenuItem(
          value: items,
          child: OnHover(
            builder: (isHovered) {
              final color = isHovered ? CostumColor.primay : Colors.black;
              return Text(
                '$items',
                style: TextStyle(color: color),
              );
            },
          ));
    }).toList();
  }
  Future<void> runDfs()async{
     await Dfs.run(
                  provider: widget.makeGraphProvider!,
                  src: widget.makeGraphProvider!.nodesMap[1],
                  visited: HashSet(),
                  order: orderOfDfsNodes);
           
               await Dfs.dfsHelper(orderOfDfsNodes, widget.makeGraphProvider!);
  }
}
