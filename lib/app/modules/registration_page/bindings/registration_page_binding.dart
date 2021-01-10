import 'package:get/get.dart';

import 'package:sahayatri/app/modules/registration_page/controllers/registration_page_controller.dart';

class RegistrationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationPageController>(
      () => RegistrationPageController(),
    );
  }
}
