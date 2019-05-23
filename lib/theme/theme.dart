import 'package:events/theme/default.dart';
import 'package:flutter/material.dart';

class PrefferedThemeProvider extends InheritedWidget {
  final PrefferedTheme theme;

  PrefferedThemeProvider({this.theme, child}) : super(child: child);

  @override
  bool updateShouldNotify(PrefferedThemeProvider oldWidget) {
    return oldWidget.theme != theme;
  }

  static PrefferedThemeProvider of(BuildContext context){
    return context.inheritFromWidgetOfExactType(PrefferedThemeProvider);
  }

  static PrefferedTheme defaultTheme() => DefaultTheme();
}

abstract class PrefferedTheme {
  String id;
  TextStyle get eventCardTitleTextTheme;
  TextStyle get eventCardSubtitleTextTheme;
  TextStyle get eventCardTimeTextTheme;
  Color get primaryColor;
  Color get accentColor;
  Brightness get brightness;
}

