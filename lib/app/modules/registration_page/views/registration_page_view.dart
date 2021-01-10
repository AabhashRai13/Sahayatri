import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sahayatri/app/modules/registration_page/controllers/registration_page_controller.dart';
import 'package:sahayatri/models/register/register.dart';

class RegistrationPageView extends GetView<RegistrationPageController> {

RegistrationPageController registrationPageController = Get.put(RegistrationPageController());
    final TextEditingController _controllerEmailAddress = TextEditingController();
    final TextEditingController _controllerAge = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.redAccent, Colors.pink[300]]),
          ),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  inputEmail(),
                  passwordInput(),
                  inputAge(),
                  loginButton(),
                ],
              ),
            ],
          ),
        ),
      );
    }

    inputEmail() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
        child: Container(
          height: 60,
          width: Get.size.width,
          child: TextFormField(
            controller: _controllerEmailAddress,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              labelText: 'Name',
              labelStyle: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ),
      );
    }
    inputAge() {
      return Padding(
        padding: const EdgeInsets.only(top: 12, left: 50, right: 50),
        child: Container(
          height: 60,
          width: Get.size.width,
          child: TextFormField(
            controller: _controllerAge,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              labelText: 'Age',
              labelStyle: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ),
      );
    }

    passwordInput() {
      return Padding(
        padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
        child: Container(
          height: 60,
          width: Get.size.width,
          child: TextFormField(
            validator: (value) {
              if (GetUtils.isNull(value))
                return "Password empty";
              else
                return null;
            },
            controller: _controllerPassword,

            style: TextStyle(
              color: Colors.white,
            ),
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ),
      );
    }

    Padding loginButton() {
      return Padding(
        padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
        child: Container(
          alignment: Alignment.bottomRight,
          height: 50,
          width: Get.size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.red,
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  5.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              int age = int.parse(_controllerAge.text.trim());
              String username = _controllerEmailAddress.text.trim();
              String password = _controllerPassword.text.trim();
              registrationPageController.registerUser(Register(age, username, password));
            },
            child: Center(
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.pinkAccent[100],
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      );
    }


}
