import 'package:flutter/material.dart';
class TextPainterHelper{
  static TextPainter nodeCenterPaint({required String nodeName}){
    TextSpan span = TextSpan(
          style: const TextStyle(color: Colors.yellow), text: nodeName);
      TextPainter nodeCenterPaint = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      nodeCenterPaint.layout();
      return nodeCenterPaint;
  }
  static TextPainter weightPainter({required String weight}){
    TextSpan span = TextSpan(
          style: const TextStyle(color: Colors.yellow), text: weight);
      TextPainter nodeCenterPaint = TextPainter(
          text: span,
          textAlign: TextAlign.center,

          textDirection: TextDirection.ltr);
      nodeCenterPaint.layout();
      return nodeCenterPaint;
  }
}