import 'package:events/theme/theme_controller.dart';
import 'package:events/ui/home_page/drawer.dart';
import 'package:events/ui/home_page/event_card.dart';
import 'package:events/ui/home_page/end_drawer.dart';
import 'package:events/views/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Provider.of<ThemeController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Events."),
        actions: <Widget>[
          IconButton(
            onPressed: themeController.nextTheme,
            icon: Icon(FontAwesomeIcons.palette),
          )
        ],
      ),
      body: LiquidPullToRefresh(
        showChildOpacityTransition: false,
        backgroundColor: themeController.theme.pullToRefreshBallColor,
        color: themeController.theme.pullToRefreshBackgroundColor,
        onRefresh: () async => await Future.delayed(Duration(seconds: 3)),
        child: ListView.builder(
          itemBuilder: (_, index) =>
              EventCard(eventView: EventView.fromIndex(index)),
        ),
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

class HomePageBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildBottomButton(
            context: context,
            icon: FontAwesomeIcons.plusSquare,
            label: "Add Event",
            onPressed: () {},
          ),
          _buildBottomButton(
            context: context,
            icon: FontAwesomeIcons.list,
            label: "Fliter",
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          )
        ],
      ),
    );
  }

  Widget _buildBottomButton({
    @required IconData icon,
    @required String label,
    @required BuildContext context,
    VoidCallback onPressed,
  }) {
    Color color =
        Provider.of<ThemeController>(context).theme.textOnPrimaryColorTextColor;

    return FlatButton.icon(
      icon: Icon(icon, color: color),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          label,
          style: TextStyle(color: color),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
