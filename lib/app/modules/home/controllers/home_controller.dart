import 'package:get/get.dart';
import 'package:sahayatri/models/global_entity.dart';
import 'package:sahayatri/models/user/user.dart';
import 'package:sahayatri/network/covid_data_source.dart';
import 'package:sahayatri/api/api_auth_repository.dart';


class HomeController extends GetxController {
  final ApiAuthRepository apiAuthRepository = ApiAuthRepository ();
User user;
  CovidDataSource covidDataSource;
  HomeController({this.covidDataSource});
  var globalEntity = Covid().obs;

  //for global
  var lastUpdate = "-".obs;
  var confirmedTotal = 0.0.obs;
  var recoveredTotal = 0.0.obs;
  var deathTotal = 0.0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getUser() async{
    user = await apiAuthRepository.fetchAllUsers ();
    return user;
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
