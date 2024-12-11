import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/location_permission_controller.dart';

class LocationPermissionScreen extends StatelessWidget {
  final c = Get.put(LocationPermissionController());
  LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          title: Text("Allow App to access this device’s location?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  c.requestPermission();
                },
                child: Text("While using the app"),
              ),
              ElevatedButton(
                onPressed: () {
                  c.requestPermission();
                },
                child: Text("Only this time"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle deny case
                  Get.snackbar(
                    "Permission Denied",
                    "You must enable location permission to continue.",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: Text("Deny"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
