import 'package:events/theme/theme_controller.dart';
import 'package:events/ui/home_page/category_row.dart';
import 'package:events/ui/home_page/drawer.dart';
import 'package:events/ui/home_page/event_card.dart';
import 'package:events/ui/home_page/end_drawer.dart';
import 'package:events/views/event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Events."),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: Provider.of<ThemeController>(context).nextTheme,
            icon: Icon(FontAwesomeIcons.palette),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          CategoryRow(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) =>
                  EventCard(eventView: EventView.fromIndex(index)),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      endDrawer: InterestedUsersDrawer(),
    );
  }
}
