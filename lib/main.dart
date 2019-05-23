import 'package:events/theme/theme.dart';
import 'package:events/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PrefferedThemeProvider(
      theme: PrefferedThemeProvider.defaultTheme(),
      child: Builder(
        builder: (context) => MaterialApp(
              theme: ThemeData(
                primaryColor:
                    PrefferedThemeProvider.of(context).theme.primaryColor,
                accentColor:
                    PrefferedThemeProvider.of(context).theme.accentColor,
                brightness: PrefferedThemeProvider.of(context).theme.brightness,
                primaryColorLight:
                    PrefferedThemeProvider.of(context).theme.accentColor,
                primaryColorDark:
                    PrefferedThemeProvider.of(context).theme.accentColor, 
              ),
              title: 'Events.',
              home: HomePage(),
            ),
      ),
    );
  } 
}
