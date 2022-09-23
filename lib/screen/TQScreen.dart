import 'package:flutter/material.dart';
import 'package:uts_flutter_remake/model/productModel.dart';

class TQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFD9D9D9),
            body: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("TERIMAKASIH!", style: TextStyle(fontSize: 25)),
                      Text("Pembelian Anda Telah Dikonfirmasi.", style: TextStyle(fontSize: 25),),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, "/MainScreen");
                        },
                        child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                textAlign: TextAlign.center,
                                "Kembali",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                      )
                    ],
                  ),
                ))));
  }
}
