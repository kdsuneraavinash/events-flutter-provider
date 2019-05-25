import 'package:events/theme/theme_controller.dart';
import 'package:events/ui/event_page/event_page.dart';
import 'package:events/ui/home_page/drawer.dart';
import 'package:events/ui/home_page/event_card.dart';
import 'package:events/ui/home_page/end_drawer.dart';
import 'package:events/views/event.dart';
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
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          if (constraints.maxWidth < 600) {
            return MobileHomePage();
          } else {
            return TabletHomePage();
          }
        },
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

class MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EventList(
      onTap: _handleEventCardOnTap,
    );
  }

  void _handleEventCardOnTap(BuildContext context, EventView eventView) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Provider<EventView>.value(
              value: eventView,
              child: EventPage(
                isMobile: true,
              ),
            ),
      ),
    );
  }
}

class TabletHomePage extends StatefulWidget {
  @override
  _TabletHomePageState createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
  EventView currentSelectedEvent;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: <Widget>[
        SizedBox(
          width: width / 2,
          child: EventList(
            onTap: _waitAndLoadEvent,
          ),
        ),
        VerticalDivider(color: Theme.of(context).primaryColor, width: 0.0),
        SizedBox(
          width: width / 2,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : currentSelectedEvent == null
                  ? Center(child: Icon(FontAwesomeIcons.box, size: 32))
                  : Provider<EventView>.value(
                      value: currentSelectedEvent,
                      child: EventPage(isMobile: false),
                    ),
        ),
      ],
    );
  }

  void _waitAndLoadEvent(BuildContext context, EventView eventView) async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isLoading = false;
      currentSelectedEvent = eventView;
    });
  }
}
