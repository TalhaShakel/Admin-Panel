import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trillest_admin/Screens/DriverManegment.dart';
import 'package:trillest_admin/Screens/Login_page/Login_screen.dart';
import 'package:trillest_admin/Screens/Support/support.dart';
import 'package:trillest_admin/Screens/User%20customer%20support/user_chat_model.dart';
import 'package:trillest_admin/Screens/UserManegment.dart';
import 'package:trillest_admin/components/DashboardPage/my_files.dart';

import '../constants/ConstImages.dart';
import '../constants/Const_Colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffba3145),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
                child: Image.asset(
              ConstImages.appLogo,
              width: 120,
            )),
            ListTile(
              onTap: () {
                Get.to(() => User_Support(
                    // email: "adminosis@gmail.com",
                    ));
              },
              horizontalTitleGap: 0.0,
              leading: Icon(
                Icons.dashboard,
                color: Colors.white54,
                size: 16,
              ),
              title: Text("User Customer support",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.normal,
                        fontSize: 13),
                  )),
            ),
            ListTile(
              onTap: () {
                Get.to(() => Support(
                    // email: "adminosis@gmail.com",
                    ));
              },
              horizontalTitleGap: 0.0,
              leading: Icon(
                Icons.dashboard,
                color: Colors.white54,
                size: 16,
              ),
              title: Text("Driver Customer support",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.normal,
                        fontSize: 13),
                  )),
            ),
            ListTile(
              onTap: () {
                Get.to(() => UserManegment(
                      user: users1,
                    ));
              },
              horizontalTitleGap: 0.0,
              leading: Icon(
                Icons.video_camera_back_outlined,
                color: Colors.white54,
                size: 16,
              ),
              title: Text("User Management",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.normal,
                        fontSize: 13),
                  )),
            ),
            ListTile(
              onTap: () {
                Get.to(() => DrverManegment(
                      activedriver: activeDrivers1,
                    ));
              },
              horizontalTitleGap: 0.0,
              leading: Icon(
                Icons.monetization_on_rounded,
                color: Colors.white54,
                size: 16,
              ),
              title: Text("Driver Management",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.normal,
                        fontSize: 13),
                  )),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              horizontalTitleGap: 0.0,
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.white,
                size: 20,
              ),
              title: Text("Sign Out",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
