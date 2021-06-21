import 'package:flutter_application_cashier/barang/widget/addbarang/addbarang.dart';
import 'package:flutter_application_cashier/barang/widget/list/listbarang.dart';
import 'package:flutter_application_cashier/barang/widget/totalup.dart';
import 'package:flutter_application_cashier/controller/barangcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class Barang extends StatefulWidget {
  @override
  _BarangState createState() => _BarangState();
}

class _BarangState extends State<Barang> {
  bool flo = false;
  Getbarang b = Get.put(Getbarang());
  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          flo = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            "Barang",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TotalUp(),
              ListBarang(),
            ],
          ),
        ),
        floatingActionButton: !flo
            ? FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                onPressed: () {
                  Get.bottomSheet(
                    AddBaranG(),
                    isScrollControlled: true,
                  );
                },
                child: Icon(
                  Icons.store_mall_directory_outlined,
                  color: Colors.white,
                ),
              )
            : null);
  }
}
