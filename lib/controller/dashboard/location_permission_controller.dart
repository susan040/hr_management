import 'package:get/get.dart';
import 'package:hr_management/views/dash_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionController extends GetxController{
  void requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Get.offAll(() => DashScreen());
    } else {
      Get.snackbar(
        "Permission Denied",
        "You must enable location permission to continue.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}