import 'package:flutter/material.dart';
import 'package:graphx/Components/Buttons/PrimaryButton.dart';
import 'package:graphx/Components/Buttons/SecondaryButtons.dart';
import 'package:graphx/Components/Dialogs/AlertDialog.dart';
import 'package:graphx/Providers/MakeGraph.dart';
import 'package:provider/provider.dart';

class BuildJoinNode extends StatefulWidget {
  @override
  State<BuildJoinNode> createState() => _BuildJoinNodeState();
}

class _BuildJoinNodeState extends State<BuildJoinNode> {
  GlobalKey? _formKey;
  TextEditingController? fromNode, toNode;
  @override
  void initState() {
    fromNode = TextEditingController();
    toNode = TextEditingController();
    _formKey = GlobalKey<FormState>();
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
                  validator: ((value) {}),
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
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              PrimaryButton(
                  buttonName: "Join Node",
                  action: () async {
                    bool? isDirected =
                        await showMyDialog(context, weight, textAboveEdge);
                
                    bool directed = isDirected == null ? false : isDirected;

                    makeGraph.makeEdge(int.parse(fromNode!.text),
                        int.parse(toNode!.text), directed);
                  }),
            ],
          ),
        ));
  }
}
