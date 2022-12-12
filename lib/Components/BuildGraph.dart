import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphx/Components/GraphCanvas.dart';
import 'package:graphx/Components/OperationsBar.dart';
import 'package:graphx/Components/OperationsHelper.dart';
import 'package:provider/provider.dart';

import '../Providers/OperationButtonSelected.dart';

class BuildGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OperationButtonSelected(1),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          OperationsBar(),
          const SizedBox(
            height: 10,
          ),
          OPerationsHelper(),
          const SizedBox(
            height: 10,
          ),
          GraphCanvas(),
        ],
      ),
    );
  }
}
