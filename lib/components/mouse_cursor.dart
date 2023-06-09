import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MouseCursors extends MouseRegion{
  static var clickableArea = document.getElementById("flutter_container"); //your element id
  const MouseCursors({super.key, required Widget child}):super(
      child:child,
      onHover: _mouseOnHover,
      onExit: _mouseOnExit);
  static void _mouseOnHover(PointerHoverEvent event) {
    clickableArea?.style.cursor = "pointer";
  }
  static void _mouseOnExit(PointerExitEvent event) {
    clickableArea?.style.cursor = "default";
  }
}