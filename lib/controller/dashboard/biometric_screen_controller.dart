import 'package:get/get.dart';

class BiometricScreenController extends GetxController {
  var flipValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimation();
  }

  // Flip animation logic
  void startAnimation() {
    ever(flipValue, (_) {
      if (flipValue.value >= 1.0) {
        flipValue.value = 0.0; // Reset the animation
      }
    });
    // Looping the animation
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 50));
      flipValue.value += 0.05; // Increment animation value
      return true;
    });
  }
}
