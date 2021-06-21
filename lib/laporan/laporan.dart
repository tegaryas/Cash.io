import 'package:flutter_application_cashier/controller/transaksicontroller.dart';
import 'package:flutter_application_cashier/manage/formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_cashier/laporan/widget/contenthis.dart';
import 'package:get/get.dart';

class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Laporan",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Penjualan',
                    style: TextStyle(fontSize: 16),
                  ),
                  GetBuilder<TransaksiController>(
                    init: TransaksiController(),
                    builder: (val) {
                      int b = 0;
                      val.transaksi.forEach((item) {
                        b += item['data']['bayar'];
                      });

                      return Text(
                        uang.format(b),
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      );
                    },
                  ),
                ],
              ),
            ),
            GetBuilder<TransaksiController>(
              init: TransaksiController(),
              builder: (val) {
                return Column(
                  children: [
                    for (var b in val.transaksi)
                      ContentHis(
                        b: b,
                      )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
