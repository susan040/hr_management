import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/attendance_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class LocationScreen extends StatelessWidget {
  final c = Get.put(AttendanceScreenController());

  LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColors.extraWhite,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 19,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          "Location",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Google Map
            Stack(
              children: [
                // GoogleMap(
                //   initialCameraPosition: const CameraPosition(
                //     target: LatLng(28.2096, 83.9856),
                //     zoom: 14,
                //   ),
                //   markers: {
                //     Marker(
                //       markerId: const MarkerId("currentLocation"),
                //       position: const LatLng(28.2096, 83.9856),
                //       infoWindow: const InfoWindow(
                //         title: "Din Tai Fung",
                //       ),
                //     ),
                //   },
                //   myLocationEnabled: true,
                //   zoomControlsEnabled: false,
                // ),
                Image.asset("assets/images/location.png"),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location", style: CustomTextStyles.f14W600()),
                  Obx(() => Text(c.location.value,
                      style: CustomTextStyles.f12W400(
                          color: AppColors.secondaryTextColor))),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Check In", style: CustomTextStyles.f14W600()),
                          Obx(() => Text(
                                c.checkInTime.value,
                                style: CustomTextStyles.f12W400(
                                    color: AppColors.secondaryTextColor),
                              )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Check Out", style: CustomTextStyles.f14W600()),
                          Obx(() => Text(
                                c.checkOutTime.value,
                                style: CustomTextStyles.f12W400(
                                    color: AppColors.secondaryTextColor),
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: InkWell(
                      onTap: c.pickImage,
                      child: Obx(() => (c.pickedImage.value != null)
                          ? Image.file(
                              c.pickedImage.value!,
                              fit: BoxFit.cover,
                              height: 180,
                              width: double.infinity,
                            )
                          : Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.extraWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1.5,
                                      color: AppColors.borderColor)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: AppColors.extraWhite,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 3,
                                              color: AppColors.primaryColor)),
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.primaryColor,
                                        size: 30,
                                      )),
                                  SizedBox(height: 5),
                                  Text(
                                    "Capture a photo",
                                    style: CustomTextStyles.f14W400(),
                                  )
                                ],
                              ),
                            )),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Obx(
                        () => Stack(
                          children: [
                            Align(
                              alignment: c.isCheckedOut.value
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: GestureDetector(
                                onHorizontalDragUpdate: (details) {
                                  if (details.primaryDelta! > 10) {
                                    c.isCheckedOut.value = true;
                                  } else if (details.primaryDelta! < -10) {
                                    c.isCheckedOut.value = false;
                                  }
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  width: 45,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: AppColors.extraWhite,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(
                                    c.isCheckedOut.value
                                        ? Icons.arrow_back
                                        : Icons.arrow_forward,
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                c.isCheckedOut.value
                                    ? "Swipe to Check Out"
                                    : "Swipe to Check In",
                                style: CustomTextStyles.f14W400(
                                    color: AppColors.extraWhite),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
