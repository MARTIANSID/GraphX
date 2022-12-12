import 'package:flutter/material.dart';
import 'package:graphx/Components/Buttons/PrimaryButton.dart';
import 'package:graphx/Providers/OperationButtonSelected.dart';
import 'package:provider/provider.dart';

class OperationsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OperationButtonSelected buttonSelected =
        Provider.of<OperationButtonSelected>(context);
    return Row(
      children: [
        PrimaryButton(
          buttonName: "Add Vertex",
          icon: Icons.add,
          action: () => {
            buttonSelected.setSelected(selected: 1),
          },
          selection: buttonSelected.selected == 1,
        ),
        const SizedBox(
          width: 5,
        ),
        PrimaryButton(
          buttonName: "Connect Vertics",
          icon: Icons.link,
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
          action: () => {
            buttonSelected.setSelected(selected: 3),
          },
          selection: buttonSelected.selected == 3,
        ),
      ],
    );
  }
}
