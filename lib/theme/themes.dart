import 'package:flutter/material.dart';

@immutable
class PrefferedTheme {
  final String id;
  final Color primaryColor;
  final Color accentColor;
  final Color iconColor;
  final Brightness brightness;
  final TextStyle eventCardTitleTextTheme;
  final TextStyle eventCardSubtitleTextTheme;
  final TextStyle eventCardTimeTextTheme;
  final Theme theme;

  PrefferedTheme({
    this.id,
    this.primaryColor,
    this.accentColor,
    this.iconColor,
    this.brightness,
    this.eventCardTitleTextTheme,
    this.eventCardSubtitleTextTheme,
    this.eventCardTimeTextTheme,
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
          eventCardTitleTextTheme: TextStyle(fontWeight: FontWeight.w800),
          eventCardSubtitleTextTheme: TextStyle(fontWeight: FontWeight.w600),
          eventCardTimeTextTheme:
              TextStyle(color: Colors.white, letterSpacing: 1.0),
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
          eventCardTitleTextTheme: TextStyle(fontWeight: FontWeight.w800),
          eventCardSubtitleTextTheme: TextStyle(fontWeight: FontWeight.w600),
          eventCardTimeTextTheme:
              TextStyle(color: Colors.white, letterSpacing: 1.0),
        );
}
