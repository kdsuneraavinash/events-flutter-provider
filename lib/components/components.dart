import 'package:events/views/event.dart';
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
}
