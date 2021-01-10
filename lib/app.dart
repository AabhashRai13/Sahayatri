import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sahayatri/storage/sharedprefences/shared_preferences_manager.dart';

import 'app/routes/app_pages.dart';
import 'injector/injector.dart';

class App extends StatelessWidget {
final SharedPreferencesManager _sharedPreferencesManager = locator<SharedPreferencesManager>();

@override
Widget build(BuildContext context) {
  bool _isAlreadyLoggedIn = _sharedPreferencesManager.isKeyExists(SharedPreferencesManager.keyIsLogin)
      ? _sharedPreferencesManager.getBool(SharedPreferencesManager.keyIsLogin)
      : false;

  return GetMaterialApp(
    title: "Application",
    initialRoute: AppPages.INITIAL,
    debugShowCheckedModeBanner: false,
    getPages: AppPages.routes,
    theme: ThemeData.light()
        .copyWith(primaryColor: Colors.red[300], splashColor: Colors.red[50]),
  );
}
}

//_isAlreadyLoggedIn?AppPages.INITIAL: Routes.LOGIN



