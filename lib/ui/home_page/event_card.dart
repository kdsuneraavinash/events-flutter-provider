import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/components/components.dart';
import 'package:events/theme/theme_controller.dart';
import 'package:events/ui/event_page/interested_pin.dart';
import 'package:events/views/event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

typedef EventCardCallback(BuildContext context);
typedef EventListCallback(BuildContext context, EventView eventView);

class EventList extends StatelessWidget {
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
            cardOnTap: (context) => onTap(context, eventView),
          );
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final EventView eventView;
  final EventCardCallback cardOnTap;

  const EventCard({Key key, @required this.eventView, @required this.cardOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => cardOnTap(context),
      child: Card(
        key: Key(eventView.name),
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
        Hero(
          tag: Key(eventView.name),
          child: CachedNetworkImage(
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
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InterestedPin(
              eventView.iLiked,
              selectedText: "${eventView.stars}",
              unselectedText: "${eventView.stars}",
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.shareAlt, color: Colors.white),
              onPressed: () => Components.shareEvent(eventView),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTimeDateStrip(BuildContext context) {
    return Container(
      color: Provider.of<ThemeController>(context).theme.accentColor,
      padding: EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.timer,
            color: Provider.of<ThemeController>(context)
                .theme
                .eventCardTimeTextColor,
          ),
          SizedBox(height: 8.0, width: 8.0),
          Text(
            "Starts on ${eventView.startDate}",
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Provider.of<ThemeController>(context)
                  .theme
                  .eventCardTimeTextColor,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleStrip(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title:
            Text(eventView.name, style: TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(eventView.organizer,
            style: TextStyle(fontWeight: FontWeight.w800)),
      ),
    );
  }
}
