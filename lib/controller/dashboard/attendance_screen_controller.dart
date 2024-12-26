import 'dart:io';

import 'package:get/get.dart';
import 'package:hr_management/models/attendance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AttendanceScreenController extends GetxController {
  var selectedMonth = DateTime.now().month.obs;
  var selectedYear = DateTime.now().year.obs;
  var attendanceList = <Attendance>[].obs;
  var location = "Pokhar-25 Hemja Milan Chowk".obs;
  var checkInTime = "10:15 AM".obs;
  var checkOutTime = "7:18 PM".obs;
  RxBool isCheckedOut = false.obs;

  @override
  void onInit() {
    super.onInit();
    generateMonthlyAttendance(selectedYear.value, selectedMonth.value);
  }

  void generateMonthlyAttendance(int year, int month) {
    attendanceList.clear();
    DateTime today = DateTime.now();

    int daysInMonth = DateTime(year, month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      DateTime date = DateTime(year, month, i);

      attendanceList.add(
        Attendance(
          day: DateFormat('EEE').format(date).toUpperCase(),
          date: DateFormat('d').format(date),
          isToday: date.day == today.day &&
              date.month == today.month &&
              date.year == today.year,
          isAbsent: date.weekday == 6 || date.day == 15,
        ),
      );
    }

    attendanceList.sort((a, b) {
      if (a.isToday) return -1;
      if (b.isToday) return 1;
      return 0;
    });

    updateAttendanceRecord("10:15 AM", "7:18 PM");
  }

  void updateAttendanceRecord(String checkIn, String checkOut) {
    DateTime today = DateTime.now();
    for (var record in attendanceList) {
      if (record.isAbsent) {
        record.checkIn = "Absent";
        record.checkOut = "Absent";
      } else {
        record.checkIn = checkIn;

        if (int.parse(record.date) == today.day &&
            record.date == DateFormat('d').format(today)) {
          record.checkOut = "--";
        } else {
          record.checkOut = checkOut;
        }
      }
    }
    attendanceList.refresh();
  }

  void changeMonth(int monthChange) {
    selectedMonth.value += monthChange;
    if (selectedMonth.value > 12) {
      selectedMonth.value = 1;
      selectedYear.value++;
    } else if (selectedMonth.value < 1) {
      selectedMonth.value = 12;
      selectedYear.value--;
    }
    generateMonthlyAttendance(selectedYear.value, selectedMonth.value);
  }

  Rx<File?> pickedImage = Rx<File?>(null);

  // Function to pick an image
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }
}
