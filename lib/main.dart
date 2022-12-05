import 'package:flutter/material.dart';
import 'makeGraph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Offset center = Offset(-1, -1);

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
            setState(() {
              center = new Offset(val.globalPosition.dx, val.globalPosition.dy);
              print(center);
            });
          },
          child: Scaffold(
            appBar: AppBar(title: Text("GraphX")),
            body: CustomPaint(
              painter: MakeGraph(center),
            ),
          ),
        ));
  }
}
