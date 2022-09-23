// ignore_for_file: file_names

import 'package:flutter/services.dart';
import 'package:uts_flutter_remake/model/dataLogin.dart';
import 'package:uts_flutter_remake/model/productModel.dart';

class ServiceProducts {
  getData() async {
    final String response =
    //proses membaca json menjadi string
    await rootBundle.loadString('assets/json/product.json');

    // merubah json menjadi variable dataFoods
    DataProducts data = dataProductsFromJson(response);

    //mengirim data list food yang spesifik
    return data.data;
  }
}
