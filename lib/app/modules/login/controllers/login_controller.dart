import 'package:get/get.dart';
import 'package:sahayatri/api/api_auth_repository.dart';
import 'package:sahayatri/app/modules/home/views/home_view.dart';
import 'package:sahayatri/helper/base_controller.dart';
import 'package:sahayatri/injector/injector.dart';
import 'package:sahayatri/models/login/login_body.dart';
import 'package:sahayatri/models/token/token.dart';
import 'package:sahayatri/storage/sharedprefences/shared_preferences_manager.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final ApiAuthRepository apiAuthRepository = ApiAuthRepository();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

//  final BaseController baseController = locator<>

  @override
  void onInit() {
    super.onInit();
  }

  void login(LoginBody loginBody) async {
    Token token = await apiAuthRepository.postLoginUser(loginBody);
    if (token.error != null) {
      print("${token.error}");
      Get.snackbar(
          "An error occured", "Check your credentials or internet connection");
      return;
    }
    await sharedPreferencesManager.putString(
        SharedPreferencesManager.keyAccessToken, token.accessToken);
    await sharedPreferencesManager.putString(
        SharedPreferencesManager.keyRefreshToken, token.refreshToken);
    await sharedPreferencesManager.putBool(
        SharedPreferencesManager.keyIsLogin, true);
    await sharedPreferencesManager.putString(
        SharedPreferencesManager.keyUsername, loginBody.username);
    Get.off(HomeView());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
