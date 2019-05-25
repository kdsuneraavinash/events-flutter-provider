import 'package:events/views/event.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Components {
  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('ERROR: Could not launch $url');
    }
  }

  static void shareEvent(EventView eventView) {
    Share.share("Check out this awesome event:\n"
        "${eventView.name}\n"
        "on ${eventView.startDate}\n"
        "in ${eventView.venue}");
  }

  static bool isMobileDevice(BoxConstraints constraints) {
    return constraints.maxWidth < 600;
  }

  static bool isMobileDeviceFromContext(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }
}
