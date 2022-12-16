import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphx/Helper/CostumColor.dart';

class PrimaryButton extends StatelessWidget {
  IconData? _icon;
  String buttonName;
  Function action;
  bool? selection;
  PrimaryButton(
      {required this.buttonName,
      IconData? icon,
      required this.action,
      this.selection})
      : _icon = icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action(),
      hoverColor: (selection == null || !selection!)
          ? Color.fromARGB(255, 211, 210, 210)
          : CostumColor.darkPrimary,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Ink(
        // color: CostumColor().primay,
        decoration: BoxDecoration(
          color:
              (selection == null || !selection!) ? null : CostumColor.primay,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _icon == null
                  ? const SizedBox()
                  : Icon(
                      _icon,
                      color: (selection == null || !selection!)
                          ? Colors.black
                          : Colors.white,
                    ),
              Text(
                buttonName,
                style: TextStyle(
                  color: (selection == null || !selection!)
                      ? Colors.black
                      : Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
