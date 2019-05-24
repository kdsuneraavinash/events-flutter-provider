import 'package:flutter/material.dart';

@immutable
class PrefferedTheme {
  final String id;
  final Color primaryColor;
  final Color accentColor;
  final Color iconColor;
  final Color eventCardTimeTextColor;
  final Color textOnPrimaryColorTextColor;
  final Brightness brightness;

  PrefferedTheme({
    @required this.id,
    @required this.primaryColor,
    @required this.accentColor,
    @required this.iconColor,
    @required this.eventCardTimeTextColor,
    @required this.textOnPrimaryColorTextColor,
    @required this.brightness,
  });

  ThemeData get data => ThemeData(
        bottomAppBarTheme: BottomAppBarTheme(
          shape: CircularNotchedRectangle(),
          color: this.primaryColor,
        ),
        bottomAppBarColor: this.primaryColor,
        primaryColor: this.primaryColor,
        accentColor: this.accentColor,
        brightness: this.brightness,
        primaryColorLight: this.accentColor,
        primaryColorDark: this.accentColor,
      );
}

class DefaultTheme extends PrefferedTheme {
  DefaultTheme()
      : super(
          id: "default_theme",
          primaryColor: Color(0xff58355E),
          accentColor: Color(0xffE03616),
          iconColor: Color(0xffE03616),
          brightness: Brightness.light,
          eventCardTimeTextColor: Colors.white,
          textOnPrimaryColorTextColor: Colors.white,
        );
}

class DarkTheme extends PrefferedTheme {
  DarkTheme()
      : super(
          id: "dark_theme",
          primaryColor: Colors.black,
          accentColor: Colors.black,
          iconColor: Colors.white,
          brightness: Brightness.dark,
          eventCardTimeTextColor: Colors.white,
          textOnPrimaryColorTextColor: Colors.white,
        );
}
