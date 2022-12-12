import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class OperationButtonSelected extends ChangeNotifier {
  int _selected;
  OperationButtonSelected(int selected) : _selected = selected;
  get selected {
    return _selected;
  }

  void setSelected({required int selected}) {
    _selected = selected;
    notifyListeners();
  }
}
