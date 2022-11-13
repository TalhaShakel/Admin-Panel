import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:trillest_admin/firebase_options.dart';

import 'Screens/Dashborad/main_screen.dart';
import 'Screens/Login_page/Login_screen.dart';
import 'Screens/OrdersManagement/Orders_Management.dart';
import 'Screens/VideoManagement/videos_management.dart';
import 'controllers/MenuController.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MenuController(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'Ossis Admin Panel',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
