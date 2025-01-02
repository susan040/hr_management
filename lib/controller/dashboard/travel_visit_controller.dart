import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TravelVisitController extends GetxController {
  final travelFormKey = GlobalKey<FormState>();
  final visitProposeController = TextEditingController();
  final visitLocationController = TextEditingController();
  final noteController = TextEditingController();
  RxString selectStatus = ''.obs;
  var pdfFileName = ''.obs;

  final List<String> statusList = [
    'UI/UX Designer',
    'Digital Marketing',
    'App Developer'
  ];
  void updateStatus(String value) {
    selectStatus.value = value;
  }

  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      pdfFileName.value = result.files.single.name;
    } else {
      pdfFileName.value = '';
    }
  }
}
