import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/DashboardPage/dashboard_page.dart';
import '../../components/SideMenu.dart';
import '../../constants/Responsive.dart';
import '../../controllers/MenuController.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                  child: SideMenu()),
            Expanded(
                flex: 5,
                child: DashboardPage()),
          ],
        ),
      ),
    );
  }
}
