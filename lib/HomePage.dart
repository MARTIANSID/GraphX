import 'package:flutter/material.dart';
import 'package:graphx/Components/OperationsBar.dart';
import 'package:graphx/Providers/MakeGraphProvider.dart';
import 'package:graphx/makeGraph.dart';
import 'package:provider/provider.dart';

import 'Components/AppBar.dart';
import 'Components/BuildGraph.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Ink(
        color: Colors.white,
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomAppBar(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Find shortest path",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Create graph and find the shortest path. or visualize different-different Algorithms",
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15),
            ),
            ChangeNotifierProvider(
                create: (_) => MakeGraphProvider(), child: BuildGraph()),
          ]),
        ),
      ),
    );
  }
}
