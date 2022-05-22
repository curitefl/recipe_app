import 'package:url_launcher/url_launcher.dart';

class LaunchUrlComponent {
  static void launchURL(String url) async {
    final bool _canLaunch = await canLaunchUrl(Uri.parse(url));
    if (!_canLaunch) {
      throw 'Could not launch $url';
    }
    await launchUrl(Uri.parse(url));
  }
}
