import 'package:flutter/material.dart';
import 'package:uts_flutter_remake/screen/Login/LoginForm.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: LoginForm(),
    );
  }
}