import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreenController extends GetxController {
  void launchURL() async {
    final Uri url =
        Uri.parse('https://maps.app.goo.gl/R81cMFLwJ415e1ta6?g_st=ac');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        print('Error: Could not launch $url');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
