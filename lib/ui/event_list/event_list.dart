import 'package:events/theme/theme_controller.dart';
import 'package:events/ui/event_list/event_card.dart';
import 'package:events/views/event.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

typedef EventListCallback(BuildContext context, EventView eventView);

class EventList extends StatelessWidget {
  /// Will provide requirements to get the reference of [EventView] clicked.
  final EventListCallback onTap;

  const EventList({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Provider.of<ThemeController>(context);

    return LiquidPullToRefresh(
      showChildOpacityTransition: false,
      backgroundColor: themeController.theme.pullToRefreshBallColor,
      color: themeController.theme.pullToRefreshBackgroundColor,
      onRefresh: () async => await Future.delayed(Duration(seconds: 3)),
      child: ListView.builder(
        itemBuilder: (_, index) {
          EventView eventView = EventView.fromIndex(index);
          return EventCard(
            eventView: eventView,
            cardOnTap: () => onTap(context, eventView),
          );
        },
      ),
    );
  }
}
