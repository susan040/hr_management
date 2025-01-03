import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CashReceiptController extends GetxController {
  final cashFormKey = GlobalKey<FormState>();
  final cilentNameController = TextEditingController();
  final clientAddressController = TextEditingController();
  final receiverNameController = TextEditingController();
  final receiverAmountController = TextEditingController();
  final refNumberController = TextEditingController();
  final selectDateController = TextEditingController();
  RxString selectPaymentMethod = ''.obs;

  final List<String> paymentMethodList = ['Cash', 'Cheque', 'Online Banking'];
  void updatePaymentMethod(String value) {
    selectPaymentMethod.value = value;
  }

  var desireDate = DateTime.now().obs;

  chooseDate(BuildContext context) async {
    log("choose date");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            hintColor: AppColors.primaryColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (pickedDate != null) {
      desireDate.value = pickedDate;
      selectDateController.text = desireDate.value.toString().split(" ")[0];
      log('Selected Date: ${selectDateController.text}');
    }
  }

  final pdf = pw.Document();
  var isLoading = false.obs;

  Future<void> generatePDF() async {
    final Uint8List imageBytes = await rootBundle
        .load('assets/images/payment_success.png')
        .then((data) => data.buffer.asUint8List());
    final pw.ImageProvider image = pw.MemoryImage(imageBytes);
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 20),
              pw.Text(
                "Receipt",
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey, width: 1),
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                      child: pw.Column(
                        children: [
                          pw.Image(image, width: 50, height: 50),
                          pw.SizedBox(height: 8),
                          pw.Text(
                            "Payment Success!",
                            style: pw.TextStyle(
                                fontSize: 18, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.Text(
                            "NPR 1,000,000",
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    pw.Divider(),
                    buildRow("Ref Number", "000085752257"),
                    buildRow("Payment Time", "25-11-2024, 13:22:16"),
                    buildRow("Payment Method", "Bank Transfer"),
                    buildRow("Sender Name", "Sujita Rana"),
                    buildRow("Amount", "NPR 1,000,000"),
                    buildRow("Admin fee", "NPR 10"),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Center(
                child: pw.Text(
                  "Get PDF Receipt",
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  pw.Widget buildRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label,
              style: pw.TextStyle(fontSize: 12, color: PdfColors.grey)),
          pw.Text(value, style: pw.TextStyle(fontSize: 12)),
        ],
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
      final filePath = "${directory.path}/HR_Management_cash_receipt.pdf";

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
}
