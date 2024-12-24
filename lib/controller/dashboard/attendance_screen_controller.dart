import 'package:get/get.dart';
import 'package:hr_management/models/attendance.dart';
import 'package:intl/intl.dart';

class AttendanceScreenController extends GetxController {
  var selectedMonth = DateTime.now().month.obs;
  var selectedYear = DateTime.now().year.obs;
  var attendanceList = <Attendance>[].obs;

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

    // Example attendance records
    updateAttendanceRecord("10:15 AM", "7:18 PM");
  }

  void updateAttendanceRecord(String checkIn, String checkOut) {
    DateTime today = DateTime.now(); // Get today's date
    for (var record in attendanceList) {
      if (record.isAbsent) {
        // If the person is absent, show "Absent"
        record.checkIn = "Absent";
        record.checkOut = "Absent";
      } else {
        // If the person is present, update check-in and check-out times
        record.checkIn = checkIn;

        // Check if the record is for today, if yes set check-out to "--"
        if (int.parse(record.date) == today.day &&
            record.date == DateFormat('d').format(today)) {
          record.checkOut = "--"; // Set today's check-out to "--"
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
}
