import 'package:flutter/material.dart';

class LandingPageController extends ChangeNotifier {
  bool _isPressed = false;
  bool get isPressed => _isPressed;

  void triggerPressed(VoidCallback onNavigate) async {
    _isPressed = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    onNavigate();
  }
}
