import 'package:flutter/material.dart';

@immutable
class Category {
  final String name;
  final IconData icon;

  Category({this.name, this.icon});

  static List<Category>  get categoryList => [
          Category(icon: Icons.play_for_work, name: "Play for Work"),
          Category(icon: Icons.portable_wifi_off, name: "Portable Wifi Off"),
          Category(icon: Icons.radio_button_checked, name: "Radio Button Checked"),
          Category(icon: Icons.replay_5, name: "Replay 5"),
          Category(icon: Icons.rv_hookup, name: "RV Hookup"),
          Category(icon: Icons.security, name: "Security"),
          Category(icon: Icons.settings_input_antenna, name: "Settings Input Antenna"),
          Category(icon: Icons.shopping_cart, name: "Shopping Cart"),
          Category(icon: Icons.sim_card_alert, name: "Sim Card Alert"),
          Category(icon: Icons.spa, name: "Spa"),
  ];
}
