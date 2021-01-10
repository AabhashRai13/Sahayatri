import 'package:flutter/material.dart';

import 'app.dart';
import 'injector/injector.dart';


void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    runApp(App());
  } catch (error, stacktrace) {
    print('$error & $stacktrace');
  }
}
