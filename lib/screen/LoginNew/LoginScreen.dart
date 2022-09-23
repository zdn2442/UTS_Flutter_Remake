// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_final_fields, unused_element, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:uts_flutter_remake/model/dataLogin.dart';
import 'package:uts_flutter_remake/service/serviceLogin.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _userUsernameController = TextEditingController();

  List<LoginData> dataLogin = [];
  List<LoginData> dataFilter = [];

  void getLoginData() {
    LoginService().getData().then((value) {
      setState(() {
        dataLogin = value;
        if (_userUsernameController.text != "" &&
            _userPasswordController.text != "") {
          dataFilter = dataLogin
              .where((element) =>
                  element.username
                      .toLowerCase()
                      .contains(_userUsernameController.text.toLowerCase()) &&
                  element.password
                      .toLowerCase()
                      .contains(_userPasswordController.text.toLowerCase()))
              .toList();

          if (dataFilter.isNotEmpty) {
            // lakukan navigation ke home
            Navigator.pushReplacementNamed(context, '/MainScreen');
          } else {}
        } else {}
      });
    });
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFD9D9D9),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 300,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.white.withOpacity(0.3), BlendMode.dstIn),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SCREAMOUS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 100,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      margin: EdgeInsets.only(bottom: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 10, top: 15),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                controller: _userUsernameController,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    isDense: true, // Added this
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 20),
                                    hintText: "Username",
                                    // label: Text(
                                    //   "Username",
                                    //   style: TextStyle(fontSize: 25),
                                    // ),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 35,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    )),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 120,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 10, top: 15),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                controller: _userPasswordController,
                                obscureText: _obscureText,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    isDense: true, // Added this
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 20),
                                    hintText: "Password",
                                    // label: Text(
                                    //   "Password",
                                    //   style: TextStyle(fontSize: 25),
                                    // ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 35,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 35,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    )),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 30,
                                decoration: TextDecoration.underline),
                          ),
                          ElevatedButton(
                            onPressed: (() {
                              final isValidForm =
                                  formKey.currentState?.validate();
                              getLoginData();
                              Alert(
                                context: context,
                                type: AlertType.error,
                                title: "ERROR!!",
                                desc: "Please fill it correctly",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    width: 120,
                                  )
                                ],
                              ).show();
                            }),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(15), // <-- Radius
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 35),
                                backgroundColor: Colors.orange),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
