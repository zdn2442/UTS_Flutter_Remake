import 'package:flutter/material.dart';
import 'package:uts_flutter_remake/model/productModel.dart';
import 'package:uts_flutter_remake/service/serviceProducts.dart';

class SearchPage extends StatefulWidget {
  final String keyword;

  SearchPage({required this.keyword});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Products> dataSearch = [];
  List<Products> dataProducts = [];

  TextEditingController search = TextEditingController();

  void getProductsData() {
    ServiceProducts().getData().then((value) {
      setState(() {
        dataProducts = value;
        dataSearch = dataProducts
            .where((element) => element.namaProduk.contains(widget.keyword))
            .toList();
      });
    });
  }

  @override
  void initState() {
    getProductsData();
    super.initState();
  }

  @override
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
                            width: MediaQuery.of(context).size.width * 0.70,
                            child: TextField(
                              controller: search,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  isDense: true, // Added this
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 20),
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
                                Navigator.pushNamed(context, '/searchPage',
                                    arguments: search.text);
                              },
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.20,
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
                  Wrap(
                    spacing: MediaQuery.of(context).size.width * 0.05,
                    children: List.generate(dataSearch.length, (index) {
                      return Card(context, dataSearch[index]);
                    }),
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
          Navigator.pushNamed(context, '/DetailScreen', arguments: data);
        },
        child: Container(
          width: 270,
          height: 380,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                width: 270,
                height: 300,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.namaProduk.toUpperCase(),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Rp${data.harga}K'.toUpperCase(),
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.start,
                      ),
                    ],
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
