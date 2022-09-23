// To parse this JSON data, do
//
//     final DataProducts = DataProductsFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

DataProducts dataProductsFromJson(String str) => DataProducts.fromJson(json.decode(str));

String dataProductsToJson(DataProducts data) => json.encode(data.toJson());

class DataProducts {
    DataProducts({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<Products> data;

    factory DataProducts.fromJson(Map<String, dynamic> json) => DataProducts(
        status: json["status"],
        message: json["message"],
        data: List<Products>.from(json["data"].map((x) => Products.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Products {
    Products({
        required this.id,
        required this.gambar,
        required this.namaProduk,
        required this.harga,
    });

    int id;
    String gambar;
    String namaProduk;
    int harga;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        gambar: json["gambar"],
        namaProduk: json["nama_produk"],
        harga: json["harga"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "gambar": gambar,
        "nama_produk": namaProduk,
        "harga": harga,
    };
}
