import 'package:sahayatri/storage/sharedprefences/shared_preferences_manager.dart';
    import 'package:get_it/get_it.dart';

GetIt locator = GetIt. instance ;

Future setupLocator () async {
  SharedPreferencesManager sharedPreferencesManager = await SharedPreferencesManager. getInstance ();
  locator.registerSingleton <SharedPreferencesManager> (sharedPreferencesManager);


}