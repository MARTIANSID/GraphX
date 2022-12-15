import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/MakeGraph.dart';
import '../Buttons/SecondaryButtons.dart';

Future<bool?> showMyDialog(context, TextEditingController weight,
    TextEditingController textAboveEdge, MakeGraphProvider makeGraph) async {
  return showDialog<bool?>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          title: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(110, 166, 210, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            padding: EdgeInsets.only(top: 5, left: 10),
            height: 35,
            child: Text(
              "Add Edge",
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                // color: Colors.red,
                height: 50,
                child: Row(children: [
                  Text("Edge Weight"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: weight,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                      cursorColor: Colors.black,
                      cursorWidth: 0.5,
                      maxLength: 3,
                      // validator: ((value) {}),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      //  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.9),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                height: 80,
                // color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Text Above Edge"),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: textAboveEdge,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                        cursorColor: Colors.black,
                        cursorWidth: 0.5,
                        maxLength: 3,
                        // validator: ((value) {}),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                        //  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.9),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SecondaryButton(
                        buttonName: "Directed",
                        function: () {
                          makeGraph.setIsDirected = true;
                          Navigator.pop(context);

                          // return true;
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SecondaryButton(
                        buttonName: "Undirected",
                        function: () {
                          makeGraph.setIsDirected = false;
                          Navigator.pop(context);

                          // return false;
                        },
                      ),
                    ],
                  ))
            ],
          )));
    },
  );
}
