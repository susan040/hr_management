import 'dart:io';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class PaySlipController extends GetxController {
  final issueFormKey = GlobalKey<FormState>();
  var totalSlip = 58600.obs;
  var chartSections = <PieChartSectionData>[].obs;
  var selectedOption = "High".obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final issueController = TextEditingController();
  final noteController = TextEditingController();

  final grossPay = 58600.0.obs;
  final earnings = 58000.0.obs;
  final deductions = 58000.0.obs;

  final earningsBreakdown = [
    {'label': 'Basic', 'value': 30000.0},
    {'label': 'Leave Encashment', 'value': 13000.0},
    {'label': 'Other Allowance', 'value': 15000.0},
  ].obs;

  final deductionsBreakdown = [
    {'label': 'Employee PF Contribution', 'value': 30000.0},
    {'label': 'Income Tax', 'value': 13000.0},
    {'label': 'Insurance', 'value': 15000.0},
  ].obs;

  void onInit() {
    super.onInit();
    loadChartData();
  }

  void loadChartData() {
    chartSections.value = [
      PieChartSectionData(
        // value: 40,
        // title: '40%',
        color: AppColors.rejected,
        radius: 15,
      ),
      PieChartSectionData(
        // value: 30,
        // title: '30%',
        color: AppColors.primaryColor,
        radius: 15,
      ),
    ];
  }

  final pdf = pw.Document();
  var isLoading = false.obs;

  Future<void> generatePDF() async {
    // Load the company logo
    final Uint8List logoData =
        (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List();

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.all(20),
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Image(pw.MemoryImage(logoData), height: 50),
                pw.Text(
                  "Tech Solutions Inc.",
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
            pw.SizedBox(height: 20),

            pw.Center(
              child: pw.Text(
                "Salary Slip",
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.SizedBox(height: 6),
            pw.Center(
                child: pw.Text(
                    "Pay Period:  January 1, 2050 to January 31, 2050")),
            pw.SizedBox(height: 20),

            pw.Text("Pay Date: February 5, 2050"),
            pw.SizedBox(height: 15),
            pw.Text("Employee Name: Johann Harvey"),
            pw.Text("Employee SSN: 123-45-6789"),
            pw.Text("Position: Software Engineer"),
            pw.SizedBox(height: 20),

            // Earnings and Deductions Table
            pw.Table.fromTextArray(
              border: pw.TableBorder.all(),
              cellStyle: pw.TextStyle(fontSize: 10),
              headerStyle:
                  pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
              data: [
                ["Earnings", "Amount", "Deductions", "Amount"],
                ["Base Salary", "\$8,000.00", "Federal Tax", "\$1,200.00"],
                ["Overtime Pay (10 hrs)", "\$500.00", "State Tax", "\$500.00"],
                ["Bonus", "\$1,000.00", "Social Security", "\$600.00"],
                ["Hours Worked", "170", "Health Insurance", "\$200.00"],
                ["Hourly Rate", "\$47.06", "Absences (2 days)", "\$300.00"],
                [
                  "Gross Salary",
                  "\$9,500.00",
                  "Total Deductions",
                  "\$2,800.00"
                ],
              ],
            ),
            pw.SizedBox(height: 20),

            // Net Pay
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                "Net Pay: \$6,700.00",
                style:
                    pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveAndOpenPDF() async {
    try {
      isLoading.value = true;
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      await generatePDF();
      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/HR_Management_payslip.pdf";

      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      await OpenFile.open(filePath);
      Get.back();
    } catch (e) {
      debugPrint("Error: $e");
      //Get.snackbar("Error", "Failed to generate PDF. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }
  // Future<void> saveAndOpenPDF() async {
  //   try {
  //     // Set loading to true
  //     isLoading.value = true;

  //     // Show loading dialog
  //     Get.dialog(
  //       Center(child: CircularProgressIndicator()),
  //       barrierDismissible: false,
  //     );

  //     // Generate PDF
  //     await generatePDF();

  //     // Get directory to save (External Storage Directory)
  //     final directory =
  //         await getExternalStorageDirectory(); // Use external storage directory
  //     final filePath = "${directory!.path}/payslip.pdf";

  //     // Save PDF file to external storage
  //     final file = File(filePath);
  //     await file.writeAsBytes(await pdf.save());

  //     // Notify the user that the file has been saved
  //     Get.snackbar("Success", "PDF has been downloaded to your device!");

  //     // Dismiss loading dialog
  //     Get.back();
  //   } catch (e) {
  //     debugPrint("Error: $e");
  //     // Show an error message if needed
  //     Get.snackbar("Error", "Failed to generate PDF. Please try again.");
  //   } finally {
  //     // Set loading to false
  //     isLoading.value = false;
  //   }
  // }
}
