import 'package:events/theme/themes.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeController() {
    index = 0;
  }

  final List<PrefferedTheme> themes = [DefaultTheme(), DarkTheme()];
  int index;

  PrefferedTheme get theme => themes[index];

  void nextTheme() {
    index = (index + 1) % themes.length;
    notifyListeners();
  }
}