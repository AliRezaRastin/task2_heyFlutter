import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  String _tabContent = "Car";
  String get tabContent => _tabContent;

  Color _buttonColor = Colors.blue; // رنگ پیش‌فرض دکمه

  Color get buttonColor => _buttonColor;

  void changeColor(Color newColor) {
    _buttonColor = newColor;
    notifyListeners(); // به‌روزرسانی UI
  }

  void updateTabContent(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _tabContent = "Car";
        break;
      case 1:
        _tabContent = "Transit";
        break;
      case 2:
        _tabContent = "Bike";
        break;
      default:
        _tabContent = "Car";
    }
    notifyListeners();
  }
}
