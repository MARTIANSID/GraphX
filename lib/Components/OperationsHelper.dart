import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphx/Providers/OperationButtonSelected.dart';
import 'package:provider/provider.dart';

import 'BuildJoinNode.dart';

class OPerationsHelper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    OperationButtonSelected buttonSelected =
        Provider.of<OperationButtonSelected>(context);
    return Ink(
      color: const Color.fromARGB(255, 194, 241, 195),
      child: Container(
        width: width,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  gethelpforUser(selection: buttonSelected.selected),
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(60, 118, 81, 1),
                  ),
                ),
              ),
            ),
            buttonSelected.selected == 2 ? BuildJoinNode() : SizedBox(),
          ],
        ),
      ),
    );
  }

  gethelpforUser({required int selection}) {
    switch (selection) {
      case 1:
        return "Click to workspace to add a new vertex.";
      case 2:
        return "select vertices to join edges";
      case 3:
        return "Click on the object to remove";
      default:
        return "selection error";
    }
  }
}
