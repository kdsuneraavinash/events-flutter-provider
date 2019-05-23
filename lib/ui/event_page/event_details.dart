import 'package:events/views/event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildEventContents(context),
    );
  }

  List<Widget> _buildEventContents(BuildContext context) {
    EventView eventView = Provider.of<EventView>(context);

    return [
      _buildListTile(
        context: context,
        title: eventView.name,
        subtitle: "Event Name",
        icon: FontAwesomeIcons.font,
      ),
      _buildListTile(
        context: context,
        title: eventView.organizer,
        subtitle: "Organizers",
        icon: FontAwesomeIcons.users,
      ),
      _buildListTile(
        context: context,
        title: eventView.venue,
        subtitle: "Venue",
        icon: FontAwesomeIcons.mapMarked,
      ),
      _buildListTile(
        context: context,
        title: "Starts on ${eventView.startDate}",
        subtitle: "Start Date",
        icon: FontAwesomeIcons.calendar,
      ),
      _buildListTile(
        context: context,
        title: "Ends on ${eventView.endDate}",
        subtitle: "End Date",
        icon: FontAwesomeIcons.calendar,
      ),
      _buildListTile(
        context: context,
        title: eventView.isAllDay
            ? "This is an All Day Event"
            : "From ${eventView.startTime} to ${eventView.endTime}",
        subtitle: "Time Duration",
        icon: FontAwesomeIcons.clock,
      ),
    ];
  }

  Widget _buildListTile(
      {BuildContext context, String title, String subtitle, IconData icon}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(icon, color: Theme.of(context).accentColor),
    );
  }
}
