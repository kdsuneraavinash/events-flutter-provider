import 'package:events/ui/home_page/category_row.dart';
import 'package:events/ui/home_page/drawer.dart';
import 'package:events/ui/home_page/event_card.dart';
import 'package:events/views/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Events."),
        elevation: 0.0,
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
    );
  }
}
