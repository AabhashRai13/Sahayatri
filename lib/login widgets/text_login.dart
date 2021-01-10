import 'package:flutter/material.dart';

class TextLogin extends StatefulWidget {
  @override
  _TextLoginState createState() => _TextLoginState();
}

class _TextLoginState extends State<TextLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0),
      child: Container(
        height: 200,
        width: 200,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            Center(
                child: ListTile(
              leading: Text(
                'Sahayatri',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
