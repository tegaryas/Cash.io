import 'package:flutter_application_cashier/controller/barangcontroller.dart';
import 'package:flutter_application_cashier/controller/transaksicontroller.dart';
import 'package:flutter_application_cashier/manage/formater.dart';
import 'package:flutter_application_cashier/transaksi/widget/listsearch.dart';
import 'package:flutter_application_cashier/transaksi/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  TransaksiController t = Get.put(TransaksiController());
  Getbarang b = Get.put(Getbarang());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            Text(
              "Cash",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              ".io",
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<Getbarang>(
        init: Getbarang(),
        builder: (val) {
          final a = val.beli;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: val.beli.length < 0 || val.beli.isEmpty || val.beli == null
                ? SizedBox(
                    height: Get.height / 1.5,
                    child: Center(
                      child:
                          Lottie.asset('assets/can.json', width: Get.width / 2),
                    ),
                  )
                : Column(
                    children: [
                      for (var i = 0; i < val.beli.length; i++)
                        ListSearch(
                          kode: a[i]['kode'],
                          id: a[i]['id'],
                          nama: a[i]['nama'],
                          harga: a[i]['harga'],
                          stock: a[i]['jumlah'],
                          x: true,
                          i: i,
                          jumbel: a[i]['jumlahbeli'],
                        ),
                    ],
                  ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<Getbarang>(
            init: Getbarang(),
            builder: (val) {
              int b = 0;
              val.beli.forEach((item) {
                b += item['totharga'];
              });
              return val.beli.isNotEmpty || val.beli.length > 0
                  ? InkWell(
                      onTap: () {
                        if (val.beli == null ||
                            val.beli.length <= 0 ||
                            b == null ||
                            b == 0) {
                          print("Kosong");
                        } else {
                          t.addtransaksi(data: val.beli, bayar: b);
                          val.hapusbeliall();
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 5,
                                  offset: Offset(0, 5))
                            ]),
                        height: 40,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Center(
                          child: Text(
                            uang.format(b),
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 40,
                    );
            },
          ),
          FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            onPressed: () {
              Get.to(
                Search(),
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
