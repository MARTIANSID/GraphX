import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:graphx/Algorithms/dfs.dart';
import 'package:graphx/Components/Buttons/PrimaryButton.dart';
import 'package:graphx/Helper/GraphHelpers.dart';
import 'package:graphx/Providers/MakeGraphProvider.dart';
import 'package:graphx/Providers/OperationButtonSelected.dart';
import 'package:provider/provider.dart';

import '../models/node.dart';
import 'DropDown/DropDown.dart';

class OperationsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OperationButtonSelected buttonSelected =
        Provider.of<OperationButtonSelected>(context);

    MakeGraphProvider makeGraphProvider =
        Provider.of<MakeGraphProvider>(context);

    // List<Node>? orderOfDfsNodes = [];
    return Row(
      children: [
        PrimaryButton(
          buttonName: "Add Vertex",
          icon: Icons.add,
          action: () => {
            buttonSelected.setSelected(selected: 1),
          },
          disable: buttonSelected.disabled,
          selection: buttonSelected.selected == 1,
        ),
        const SizedBox(
          width: 5,
        ),
        PrimaryButton(
          buttonName: "Connect Vertics",
          icon: Icons.link,
          disable: buttonSelected.disabled,
          action: () => {
            buttonSelected.setSelected(selected: 2),
          },
          selection: buttonSelected.selected == 2,
        ),
        const SizedBox(
          width: 5,
        ),
        PrimaryButton(
          buttonName: "Remove Object",
          icon: Icons.delete_forever,
          disable: buttonSelected.disabled,
          action: () => {
            buttonSelected.setSelected(selected: 3),
          },
          selection: buttonSelected.selected == 3,
        ),
        // PrimaryButton(
        //   buttonName: "DFS",
        //   action: () => {
            // Dfs.run(
            //     provider: makeGraphProvider,
            //     src: makeGraphProvider.nodesMap[1],
            //     visited: HashSet(),
            //     order: orderOfDfsNodes),
           
            // Dfs.dfsHelper(orderOfDfsNodes,makeGraphProvider)
        //   },
        // ),
        const SizedBox(
          width: 5,
        ),
        DropDownBuilder(makeGraphProvider: makeGraphProvider,buttonSelected: buttonSelected,)
      ],
    );
  }
}
