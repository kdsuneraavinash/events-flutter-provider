import 'package:events/theme/theme_controller.dart';
import 'package:events/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeController>(
      builder: (_) => ThemeController(),
      child: ThemedMaterialApp(),
    );
  }
}

class ThemedMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeController>(context).theme.data,
      title: 'Events.',
      home: HomePage(),
    );
  }
}
