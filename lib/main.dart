import 'package:events/theme/theme_controller.dart';
import 'package:events/theme/themes.dart';
import 'package:events/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeController>(
      builder: (_) => ThemeController(),
      child: Builder(
        builder: (context) => MaterialApp(
              theme: ThemeData(
                primaryColor:
                    Provider.of<ThemeController>(context).theme.primaryColor,
                accentColor:
                    Provider.of<ThemeController>(context).theme.accentColor,
                brightness:
                    Provider.of<ThemeController>(context).theme.brightness,
                primaryColorLight:
                    Provider.of<ThemeController>(context).theme.accentColor,
                primaryColorDark:
                    Provider.of<ThemeController>(context).theme.accentColor,
              ),
              title: 'Events.',
              home: HomePage(),
            ),
      ),
    );
  }
}
