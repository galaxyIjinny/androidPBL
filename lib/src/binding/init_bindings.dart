import 'package:get/get.dart';

import '../controller/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}