import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/shift_swapping_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/widgets/request_shift_widget.dart';

class YourShiftScreen extends StatelessWidget {
  final c = Get.put(ShiftSwappingController());
  YourShiftScreen({super.key});

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
          "Shifts Swapping",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: Column(
        children: [
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildTab(
                    label: 'Your Shifts',
                    isSelected: c.selectedIndex.value == 0,
                    onTap: () => c.changeTab(0),
                  ),
                  SizedBox(width: 20),
                  BuildTab(
                    label: 'Request Shift',
                    isSelected: c.selectedIndex.value == 1,
                    onTap: () => c.changeTab(1),
                  ),
                ],
              )),
          Expanded(
            child: Obx(() {
              switch (c.selectedIndex.value) {
                case 1:
                  return RequestShiftWidget(c: c);

                default:
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _getShiftMarkers().length,
                          itemBuilder: (context, index) {
                            final shift = _getShiftMarkers()[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 2,
                                        height: 20,
                                        color: shift['color'],
                                      ),
                                      CircleAvatar(
                                        backgroundColor: shift['color'],
                                        radius: 15,
                                        child: const Icon(
                                          Icons.person,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: shift['color'].withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: shift['color']),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            shift['name'] ?? 'No Name',
                                            style: TextStyle(
                                              color: shift['color'],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Shift Details Here',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      ShiftSwappingWidget(),
                    ],
                  );
              }
            }),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getShiftMarkers() {
    return [
      {'color': Colors.red, 'name': null},
      {'color': Colors.orange, 'name': null},
      {'color': Colors.pink, 'name': 'Susan T.'},
      {'color': Colors.teal, 'name': 'Seema T.'},
      {'color': Colors.red, 'name': 'Sujita R.'},
      {'color': Colors.green, 'name': 'Swostika B.'},
    ];
  }
}

class BuildTab extends StatelessWidget {
  const BuildTab(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onTap});
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 35,
        width: 110,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: CustomTextStyles.f14W500(
                color: isSelected ? AppColors.extraWhite : AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShiftSwappingWidget extends StatelessWidget {
  const ShiftSwappingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 25),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'When',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text('Sunday 22 November'),
          Row(
            children: [
              Text('26 Nov, 2024'),
              Expanded(
                child: Slider(
                  value: 2,
                  min: 0,
                  max: 5,
                  divisions: 5,
                  onChanged: (value) {},
                ),
              ),
              Text('30 Nov, 2024'),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Shift Holder’s Name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text('Susan Thapa'),
          const SizedBox(height: 16),
          const Text(
            'Reason',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            'I need to swap this shift due to an urgent family event that requires my presence. I’m willing to cover another shift in return if needed.',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle "Swap Shift"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Swap Shift'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle "Cancel Shift"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Cancel Shift'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
