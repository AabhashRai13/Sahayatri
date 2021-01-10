import 'package:get/get.dart';
import 'package:sahayatri/api/api_auth_repository.dart';
import 'package:sahayatri/app/modules/login/views/login_view.dart';
import 'package:sahayatri/models/diagnostic/diagnostic.dart';
import 'package:sahayatri/models/register/register.dart';

class RegistrationPageController extends GetxController {
  //TODO: Implement RegistrationPageController
  Diagnostic diagnostic;
  final ApiAuthRepository apiAuthRepository = ApiAuthRepository();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }

  registerUser(Register register)async{
     diagnostic = await apiAuthRepository.postRegisterUser (register);
    if (diagnostic.error != null) {
      print('${diagnostic.error}');
      printError();
      Get.snackbar(
          "An error occured", "Check your credentials or internet connection");
      return;
    }
    Get.off(LoginView());
    Get.snackbar("Registered successfully", "");
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
