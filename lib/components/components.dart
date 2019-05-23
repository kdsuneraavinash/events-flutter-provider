import 'package:url_launcher/url_launcher.dart';

class Components {
  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('ERROR: Could not launch $url');
    }
  }
}
