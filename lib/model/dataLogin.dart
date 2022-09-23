// To parse this JSON data, do
//
//     final dataLogin = dataLoginFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

DataLogin dataLoginFromJson(String str) => DataLogin.fromJson(json.decode(str));

String dataLoginToJson(DataLogin data) => json.encode(data.toJson());

class DataLogin {
    DataLogin({
       required this.status,
       required this.message,
       required this.data,
    });

    String status;
    String message;
    List<LoginData> data;

    factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        status: json["status"],
        message: json["message"],
        data: List<LoginData>.from(json["data"].map((x) => LoginData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class LoginData {
    LoginData({
       required this.id,
       required this.username,
       required this.email,
       required this.password,
    });

    int id;
    String username;
    String email;
    String password;

    factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
    };
}
