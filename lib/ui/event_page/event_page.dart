import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/ui/event_page/event_description.dart';
import 'package:events/ui/event_page/event_details.dart';
import 'package:events/views/event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: NestedScrollView(
            headerSliverBuilder: (_, __) => [_buildHeaderSliver(context)],
            body: TabBarView(
              children: [EventDetails(), EventDescription()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSliver(BuildContext context) {
    return SliverAppBar(
      title: Text(Provider.of<EventView>(context).name),
      bottom: TabBar(
        tabs: [
          Tab(child: Text("Basic")),
          Tab(child: Text("Descriptions")),
        ],
      ),
      expandedHeight: 250.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: Provider.of<EventView>(context).coverImageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (_, __, ___) => Center(
                    child: Icon(
                      FontAwesomeIcons.image,
                      size: 36.0,
                      color: Colors.white,
                    ),
                  ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff000000),
                    Color(0x00000000),
                    Color(0x88000000)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
