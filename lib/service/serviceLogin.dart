// ignore_for_file: file_names

import 'package:flutter/services.dart';
import 'package:uts_flutter_remake/model/dataLogin.dart';

class LoginService {
  getData() async {
    final String response =
    //proses membaca json menjadi string
    await rootBundle.loadString('assets/json/login.json');

    // merubah json menjadi variable dataLogin
    DataLogin data = dataLoginFromJson(response);

    //mengirim data list login yang spesifik
    return data.data;
  }
}
