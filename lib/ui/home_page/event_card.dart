import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/theme/theme.dart';
import 'package:events/ui/event_page/event_page.dart';
import 'package:events/views/event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  final EventView eventView;

  const EventCard({Key key, @required this.eventView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleEventCardOnTap(context),
      child: Card(
        elevation: 8.0,
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildImageBanner(context),
              _buildTitleStrip(context),
              _buildTimeDateStrip(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageBanner(BuildContext context) {
    double height = 250.0;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        CachedNetworkImage(
          /// Image
          imageUrl: eventView.coverImageUrl,
          fit: BoxFit.cover,
          height: height,
          width: width,
          placeholder: (_, __) => Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
          errorWidget: (_, __, ___) => Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.image,
                  size: 36.0,
                ),
              ),
        ),
        Container(
          /// Dark Overlay
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000), Color(0x00000000)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          height: height,
          width: width,
        ),
        FlatButton.icon(
          /// Number of stars
          icon: Icon(
            FontAwesomeIcons.mapPin,
            color: eventView.iLiked ? Colors.red : Colors.white,
          ),
          label: Text(
            "${eventView.stars}",
            style: TextStyle(
              color: eventView.iLiked ? Colors.red : Colors.white,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTimeDateStrip(BuildContext context) {
    return Container(
      color: PrefferedThemeProvider.of(context).theme.accentColor,
      padding: EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.timer,
            color: PrefferedThemeProvider.of(context)
                .theme
                .eventCardTimeTextTheme
                .color,
          ),
          SizedBox(height: 8.0, width: 8.0),
          Text(
            "Starts on ${eventView.startDate}",
            textAlign: TextAlign.end,
            style:
                PrefferedThemeProvider.of(context).theme.eventCardTimeTextTheme,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleStrip(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(eventView.name,
            style: PrefferedThemeProvider.of(context)
                .theme
                .eventCardTitleTextTheme),
        subtitle: Text(eventView.organizer,
            style: PrefferedThemeProvider.of(context)
                .theme
                .eventCardTitleTextTheme),
      ),
    );
  }

  void _handleEventCardOnTap(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Provider<EventView>.value(
            value: eventView,
            child: EventPage(),
          ),
    );
  }
}
