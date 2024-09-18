import 'package:get/get.dart';
import 'package:login_page/controller/internet_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
