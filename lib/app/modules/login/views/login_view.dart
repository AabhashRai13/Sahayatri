import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'package:sahayatri/app/modules/login/controllers/login_controller.dart';
import 'package:sahayatri/app/modules/registration_page/views/registration_page_view.dart';

import 'package:sahayatri/login%20widgets/text_login.dart';
import 'package:sahayatri/models/login/login_body.dart';

class LoginView extends GetView<LoginController> {
  final LoginController loginController = Get.put(LoginController());

  final TextEditingController _controllerUserName = TextEditingController();
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
                Row(children: <Widget>[
                  TextLogin(),
                ]),
                inputEmail(),
                passwordInput(),
                loginButton(),
                firstTimeButton(),
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
          controller: _controllerUserName,
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
      padding: const EdgeInsets.only(top: 40, right: 50, left: 50),
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
          minWidth: Get.size.width,
          onPressed: () {
            String username = _controllerUserName.text.trim();
            String password = _controllerPassword.text.trim();
            loginController.login(LoginBody(username, password, 'password'));
          },
          child: Center(
            child: Text(
              'Login',
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

  firstTimeButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,12.0,0,0),
      child: Container(
        alignment: Alignment.center,
        //color: Colors.red,
        height: 25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your first time?',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Get.to(RegistrationPageView());
              },
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
