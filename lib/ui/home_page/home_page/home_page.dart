import 'package:events/components/components.dart';
import 'package:events/theme/theme_controller.dart';
import 'package:events/ui/home_page/drawer.dart';
import 'package:events/ui/home_page/end_drawer.dart';
import 'package:events/ui/home_page/home_page/bottom_app_bar.dart';
import 'package:events/ui/home_page/home_page/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Events."),
        actions: <Widget>[
          IconButton(
            onPressed: Provider.of<ThemeController>(context).nextTheme,
            icon: Icon(FontAwesomeIcons.palette),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => Components.isMobileDevice(constraints)
            ? MobileHomePage()
            : TabletHomePage(),
      ),
      drawer: AppDrawer(),
      endDrawer: CategoryDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.syncAlt),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: HomePageBottomAppBar(),
      extendBody: true,
    );
  }
}
