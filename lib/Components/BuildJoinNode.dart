import 'package:flutter/material.dart';
import 'package:graphx/Components/Buttons/PrimaryButton.dart';
import 'package:graphx/Components/Buttons/SecondaryButtons.dart';
import 'package:graphx/Components/Dialogs/AlertDialog.dart';
import 'package:graphx/Components/Messages/SnackBarCostum.dart';
import 'package:graphx/Providers/MakeGraphProvider.dart';
import 'package:provider/provider.dart';

import '../Helper/GraphHelpers.dart';

class BuildJoinNode extends StatefulWidget {
  @override
  State<BuildJoinNode> createState() => _BuildJoinNodeState();
}

class _BuildJoinNodeState extends State<BuildJoinNode> {
  // GlobalKey? _formKey;
  final _formKey = GlobalKey<FormState>();
  TextEditingController? fromNode, toNode;
  @override
  void initState() {
    fromNode = TextEditingController();
    toNode = TextEditingController();
    // _formKey =  GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MakeGraphProvider makeGraph = Provider.of<MakeGraphProvider>(context);
    TextEditingController weight = TextEditingController();
    TextEditingController textAboveEdge = TextEditingController();
    return Container(
      width: 250,
      height: 45,
      margin: const EdgeInsets.only(right: 5),
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: TextFormField(
                controller: fromNode,
                style: const TextStyle(fontWeight: FontWeight.w400),
                cursorColor: Colors.black,
                cursorWidth: 0.5,
                maxLength: 3,
                validator: ((value) {
                  if (value == null || value!.length == 0) return "";
                }),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                //  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.9),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.arrow_forward),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              flex: 1,
              child: TextFormField(
                maxLength: 3,
                controller: toNode,
                validator: ((value) {
                  if (value == null || value!.length == 0) return "";
                }),
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.w400),
                keyboardType: TextInputType.number,
                // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                cursorColor: Colors.black,
                cursorWidth: 0.5,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.9),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            PrimaryButton(
                buttonName: "Join Node",
                action: () async {
                  //validate that fields are not empty
                  if (_formKey!.currentState!.validate()) {
                    int from = int.parse(fromNode!.text);
                    int to = int.parse(toNode!.text);
                    //check that edge is not previously present
                    if (GraphHelpers.isEdgeThere(
                            first: from,
                            second: to,
                            edgesList: makeGraph.edgeList) ==
                        false) {
                      //check that from node is there on canvas or not
                      if (GraphHelpers.isNodePresent(
                          nodeNo: from,nodes: makeGraph.nodesMap)) {
                        //check that to node is there on canvas or not
                        if (GraphHelpers.isNodePresent(
                            nodeNo: to,nodes: makeGraph.nodesMap)) {
                          //if everything goes well then show dialog box
                          await showMyDialog(
                              context, weight, textAboveEdge, makeGraph);
                          makeGraph.makeEdge(int.parse(fromNode!.text),
                              int.parse(toNode!.text), makeGraph.getIsDirected,weight:weight.text==""?null:int.parse(weight.text));
                        } else {
                          SnackBarCostum(msg: "To node is not present")
                              .show(context: context);
                        }
                      } else {
                        SnackBarCostum(msg: "From node is not present")
                            .show(context: context);
                      }
                    } else {
                      SnackBarCostum(msg: "Edge is previously present")
                          .show(context: context);
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
