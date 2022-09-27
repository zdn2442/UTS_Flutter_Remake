import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uts_flutter_remake/model/productModel.dart';
import 'package:uts_flutter_remake/service/serviceProducts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  List<Products> dataProducts = [];

  TextEditingController search = TextEditingController();

  void getFoodsData() {
    ServiceProducts().getData().then((value) {
      setState(() {
        dataProducts = value;
      });
    });
  }

  @override
  void initState() {
    getProductsData();
    super.initState();
  }

  void getProductsData() {
    ServiceProducts().getData().then((value) {
      setState(() {
        dataProducts = value;
      });
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFD9D9D9),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 120,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 10, top: 15),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: search,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  isDense: true, // Added this
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 0),
                                  hintText: "Search Here!",
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 35,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  )),
                              onSubmitted: (value) {
                                Navigator.pushReplacementNamed(
                                    context, '/searchPage',
                                    arguments: search.text);
                              },
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Text(
                                  "2",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.black,
                                ),
                                child: Icon(
                                  Icons.shopping_cart,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
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
                          "welcome to",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              fontSize: 25,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "SCREAMOUS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 70,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "simplicity is art",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              fontSize: 25,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment
                    children: [
                      Wrap(
                        spacing: MediaQuery.of(context).size.width * 0.02,
                        children: List.generate(dataProducts.length, (index) {
                          return Card(context, dataProducts[index]);
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}

Widget Card(context, Products data) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/DetailScreen',
              arguments: data);
        },
        child: Container(
          width: 220,
          height: 330,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                width: 260,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(
                        data.gambar,
                      ),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.screen)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    data.namaProduk.toUpperCase(),
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Rp${data.harga}K',
                    style: TextStyle(fontSize: 23),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
