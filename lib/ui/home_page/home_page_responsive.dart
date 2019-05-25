import 'package:events/ui/event_list/event_card.dart';
import 'package:events/ui/event_page/event_page.dart';
import 'package:events/views/event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

/// Views A Layout in Mobile.
///
/// Views only the [EventList].
/// Once an item in [EventList] is tapped, a [MaterialPageRoute] will direct to [EventPage].
/// [EventPage] will have a scaffold.
/// Here [_viewEventInNewPage] will control what happens when card is tapped.
class MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EventList(onTap: _viewEventInNewPage);
  }

  /// Goto Event Page when tapped on a card
  void _viewEventInNewPage(BuildContext context, EventView eventView) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Provider<EventView>.value(
              value: eventView,
              child: EventPage(isMobile: true),
            ),
      ),
    );
  }
}

/// Views A Layout in Tablets.
///
/// Views [EventList] and [EventPage] side by side.
/// No scaffold for [EventPage].
/// Once an item in [EventList] is tapped, this will load the specific event to [EventPage].
/// [_waitAndLoadEventOnSideBar] will control this functionality.
class TabletHomePage extends StatefulWidget {
  @override
  _TabletHomePageState createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
  /// Current selected Event Card Data. null if nothing selected
  EventView currentSelectedEvent;

  /// Variable used to show a loading animation before loading the [EventView]
  bool isEventDetailsPageLoading = false;

  @override
  Widget build(BuildContext context) {
    double halfPageWidth = MediaQuery.of(context).size.width / 2;

    return Row(
      children: <Widget>[
        SizedBox(
          width: halfPageWidth,
          child: EventList(onTap: _waitAndLoadEventOnSideBar),
        ),
        VerticalDivider(color: Theme.of(context).primaryColor, width: 0.0),
        SizedBox(
          width: halfPageWidth,
          child: isEventDetailsPageLoading
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

  void _waitAndLoadEventOnSideBar(
      BuildContext context, EventView eventView) async {
    setState(() {
      isEventDetailsPageLoading = true; // First mark as loading
    });
    await Future.delayed(Duration(seconds: 1)); // Wait a second
    setState(() {
      isEventDetailsPageLoading = false; // Mark as finished loading
      currentSelectedEvent = eventView;
    });
  }
}
