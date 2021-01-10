import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sahayatri/app/modules/home/controllers/home_controller.dart';
import 'package:sahayatri/app/modules/login/views/login_view.dart';
import 'package:sahayatri/injector/injector.dart';
import 'package:sahayatri/storage/sharedprefences/shared_preferences_manager.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final HomeController c = Get.put(HomeController());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(
          title: Obx(() => Text("Clicks: ${c.count}")),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.logout),
              onPressed: () {
                locator<SharedPreferencesManager>().clearAll();
                Get.offAll(LoginView());
              },
            ),
          ],
        ),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Get.changeTheme(Get.isDarkMode
                    ? ThemeData.light().copyWith(primaryColor: Colors.red)
                    : ThemeData.dark());
              },
              child: Text("Change Theme"),
            ),
            Center(
                child: RaisedButton(
                    child: Text("Go to Other"),
                    onPressed: () => Get.to(Other()))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final HomeController c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: ListView.separated (
      itemBuilder: (context, index) {
        return ListTile (
          title: Text (
            c.user.users[index].username,
            style: Theme. of (context) .textTheme.title,
          ),
          subtitle: Text (
            '${c.user.users[index].age}',
            style: Theme. of (context) .textTheme.subtitle),
        );
      },
      separatorBuilder: (context, index) {
        return Divider ();
      },
      itemCount: c.user.users.length,
    ));
  }
}
