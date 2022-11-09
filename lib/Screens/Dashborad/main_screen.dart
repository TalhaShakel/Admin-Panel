import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/DashboardPage/dashboard_page.dart';
import '../../components/SideMenu.dart';
import '../../constants/Responsive.dart';
import '../../controllers/MenuController.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  dataGet(type) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("$type");
      DatabaseEvent event = await ref.once();
      // print("object");
      Map<String, dynamic>? k = event.snapshot.value as Map<String, dynamic>;
      print(k.length.toString() + "$type");

      return k;
    } on FirebaseException catch (e) {
      Get.snackbar("${e.message}", "");
      print(e.toString() + "eee");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
            Expanded(flex: 5, child: DashboardPage()),
          ],
        ),
      ),
    );
  }
}
