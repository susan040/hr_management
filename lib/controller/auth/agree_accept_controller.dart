import 'package:get/get.dart';

class AgreeAndAcceptController extends GetxController {
  var isPrivacyPolicyAccepted = false.obs;
  var isTermsOfUseAccepted = false.obs;

  void togglePrivacyPolicy(bool value) {
    isPrivacyPolicyAccepted.value = value;
  }

  void toggleTermsOfUse(bool value) {
    isTermsOfUseAccepted.value = value;
  }
}
