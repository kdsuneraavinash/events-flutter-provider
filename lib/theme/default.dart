import 'package:events/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultTheme implements PrefferedTheme {
  @override
  String id = "default";

  @override
  TextStyle get eventCardTitleTextTheme => TextStyle(fontWeight: FontWeight.w800);

  @override
  TextStyle get eventCardSubtitleTextTheme => TextStyle(fontWeight: FontWeight.w600);

  @override
  TextStyle get eventCardTimeTextTheme => TextStyle(color: Colors.white, letterSpacing: 1.0);

  @override
  Color get accentColor => Color(0xffE03616);

  @override
  Color get primaryColor => Color(0xff58355E);

  @override
  Brightness get brightness => Brightness.light;
}
