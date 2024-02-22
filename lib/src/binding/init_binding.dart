import 'package:get/get.dart';
import 'package:instargram/src/controller/auth_controller.dart';
import 'package:instargram/src/controller/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}