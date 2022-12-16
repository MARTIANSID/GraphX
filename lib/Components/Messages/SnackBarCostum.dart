import 'package:flutter/material.dart';
import 'package:graphx/Helper/CostumColor.dart';

class SnackBarCostum {
  String msg;

  SnackBarCostum({required this.msg});
  void show({required BuildContext context, int durationInSec = 4,bool dismissButton=true}) {
    final snackBar = SnackBar(
      duration: Duration(seconds: durationInSec),
      content: Text(msg),
      action:dismissButton? SnackBarAction(
          onPressed: () {},
          label: "dismiss",
          textColor: CostumColor.darkPrimary):null,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
