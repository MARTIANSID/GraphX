import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GestureDetector(
          onTapDown: (val) {
            print(val.globalPosition);
          },
          child: Scaffold(
            appBar: AppBar(title: Text("GraphX")),
          ),
        ));
  }
}
