import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _iconColor = Colors.blue; // رنگ پیش‌فرض ایکون‌ها

  Color get iconColor => _iconColor;

  void changeIconColor(Color newColor) {
    _iconColor = newColor;
    notifyListeners(); // به‌روزرسانی UI
  }
}
