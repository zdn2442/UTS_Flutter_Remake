import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:uts_flutter_remake/model/dataLogin.dart';
import 'package:uts_flutter_remake/service/serviceLogin.dart';

class LoginForm extends StatefulWidget {
  // final LoginData data;

  // LoginForm({
  //   required this.data
  // });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

FocusNode focusNode = new FocusNode();

TextEditingController txtUsername = TextEditingController(),
                      txtPassword = TextEditingController(),
                      txtEmail = TextEditingController();

class _LoginFormState extends State<LoginForm> {
  List<LoginData> dataLogin = [];

  void getLoginData(){
    LoginService().getData().then((value) {
      setState(() {
        dataLogin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildUsername(),
          buildEmail(),
          buildPassword(),
          buildLoginBtn(),
        ],
      ),
    );
  }

  TextFormField buildUsername(){
    return TextFormField(
      controller: txtUsername,
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 2.0
      ),
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? Color.fromARGB(0, 0, 0, 0) : Color.fromARGB(0, 174, 138, 45),
        )
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter correct Username";
        } else {
          return null;
        }
      },
    );
  }

  TextFormField buildEmail(){
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 2.0
      ),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? Color.fromARGB(0, 0, 0, 0) : Color.fromARGB(0, 174, 138, 45),
        )
      ),
      validator: (value) {
        if (value!.isEmpty ||!RegExp(r'${data.email}').hasMatch(value)) {
          return "Enter correct Email";
        } else {
          return null;
        }
      },
    );
  }

  TextFormField buildPassword(){
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 2.0
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? Color.fromARGB(0, 0, 0, 0) : Color.fromARGB(0, 174, 138, 45),
        ),
        suffixIcon: Icon(Icons.lock_outlined)
      ),
      validator: (value) {
        if (value!.isEmpty ||!RegExp(r'${data.password}').hasMatch(value)) {
          return "Enter correct Password";
        } else {
          
        }
      },
    );
  }

  Widget buildLoginBtn(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: (){
        Navigator.pushNamed(context, '/MainScreen');
        print("Login Pressed");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white
      ),
      child: Text(
        "LOGIN",
        style: TextStyle(
          color: Color(0xffc5ac18e),
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}
}