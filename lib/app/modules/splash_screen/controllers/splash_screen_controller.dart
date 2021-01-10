import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sahayatri/app/modules/home/views/home_view.dart';
import 'package:sahayatri/app/modules/login/views/login_view.dart';
import 'package:sahayatri/injector/injector.dart';
import 'package:sahayatri/storage/sharedprefences/shared_preferences_manager.dart';

class SplashScreenController extends GetxController {
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  //TODO: Implement SplashScreenController

  final count = 0.obs;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 5), () => routeManager());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  routeManager() {
    bool _isAlreadyLoggedIn = _sharedPreferencesManager
            .isKeyExists(SharedPreferencesManager.keyIsLogin)
        ? _sharedPreferencesManager.getBool(SharedPreferencesManager.keyIsLogin)
        : false;
    print(_isAlreadyLoggedIn);
    if (_isAlreadyLoggedIn) {
      return Get.to(HomeView());
    } else {
      return Get.off(LoginView());
    }
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
