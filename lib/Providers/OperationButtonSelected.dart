import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class OperationButtonSelected extends ChangeNotifier {
  int _selected;
  bool _disabled=false;
  OperationButtonSelected(int selected) : _selected = selected;
  get selected {
    return _selected;
  }
  get disabled {
    return _disabled;
  }

  void setSelected({required int selected}) {
    _selected = selected;
    notifyListeners();
  }
  void setDisabled({required bool disabled}) {
    _disabled = disabled;
    notifyListeners();
  }
}
