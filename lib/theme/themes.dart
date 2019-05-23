import 'package:flutter/material.dart';

@immutable
class PrefferedTheme {
  final String id;
  final Color primaryColor;
  final Color accentColor;
  final Color iconColor;
  final Color eventCardTimeTextColor;
  final Brightness brightness;
  final Theme theme;

  PrefferedTheme({
    this.id,
    this.primaryColor,
    this.accentColor,
    this.iconColor,
    this.eventCardTimeTextColor,
    this.brightness,
    this.theme,
  });
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
        );
}
