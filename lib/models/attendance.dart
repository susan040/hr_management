class Attendance {
  final String day;
  final String date;
  String checkIn;
  String checkOut;
  bool isAbsent;
  bool isToday;

  Attendance({
    required this.day,
    required this.date,
    this.checkIn = "Absent",
    this.checkOut = "Absent",
    this.isAbsent = true,
    this.isToday = false,
  });
}
