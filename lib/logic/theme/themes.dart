import 'package:flutter/material.dart';

@immutable
class PrefferedTheme {
  final String id;
  final Color primaryColor;
  final Color accentColor;
  final Color iconColor;
  final Color eventCardTimeTextColor;
  final Color textOnPrimaryColorTextColor;
  final Color pullToRefreshBallColor;
  final Color pullToRefreshBackgroundColor;
  final Brightness brightness;

  Color get normalTextColor =>
      this.brightness == Brightness.light ? Colors.black : Colors.white;

  PrefferedTheme({
    @required this.id,
    @required this.primaryColor,
    @required this.accentColor,
    @required this.iconColor,
    @required this.eventCardTimeTextColor,
    @required this.pullToRefreshBallColor,
    @required this.pullToRefreshBackgroundColor,
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

/// #58355E #E03616
class DefaultTheme extends PrefferedTheme {
  DefaultTheme()
      : super(
          id: "default_theme",
          primaryColor: Color(0xff58355E),
          accentColor: Color(0xffE03616),
          iconColor: Color(0xffE03616),
          brightness: Brightness.light,
          eventCardTimeTextColor: Colors.white,
          pullToRefreshBallColor: Color(0xffE03616),
          pullToRefreshBackgroundColor: Colors.white,
          textOnPrimaryColorTextColor: Colors.white,
        );
}

/// #AD1457 #AB47BC
class PinkTheme extends PrefferedTheme {
  PinkTheme()
      : super(
          id: "pink_theme",
          primaryColor: Color(0xffAD1457),
          accentColor: Color(0xffAB47BC),
          iconColor: Color(0xffAB47BC),
          brightness: Brightness.light,
          eventCardTimeTextColor: Colors.white,
          pullToRefreshBallColor: Colors.pink,
          pullToRefreshBackgroundColor: Colors.pink[100],
          textOnPrimaryColorTextColor: Colors.white,
        );
}

/// #1A237E #1E88E5
class BlueTheme extends PrefferedTheme {
  BlueTheme()
      : super(
          id: "blue_theme",
          primaryColor: Color(0xff1A237E),
          accentColor: Color(0xff1E88E5),
          iconColor: Color(0xff00ACC1),
          brightness: Brightness.light,
          eventCardTimeTextColor: Colors.white,
          pullToRefreshBallColor: Colors.white,
          pullToRefreshBackgroundColor: Color(0xff3F51B5),
          textOnPrimaryColorTextColor: Colors.white,
        );
}

/// #000000 #000000
class DarkTheme extends PrefferedTheme {
  DarkTheme()
      : super(
          id: "dark_theme",
          primaryColor: Colors.black,
          accentColor: Colors.black,
          iconColor: Colors.white,
          brightness: Brightness.dark,
          eventCardTimeTextColor: Colors.white,
          pullToRefreshBallColor: Colors.white,
          pullToRefreshBackgroundColor: Colors.black,
          textOnPrimaryColorTextColor: Colors.white,
        );
}
