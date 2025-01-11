import 'package:cookish/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // Major
    Get.put(AuthController(), permanent: true);
  }
}
