import 'package:flutter/material.dart';
import 'package:trillest_admin/components/DashboardPage/user_info.dart';

import '../../constants/Const_Colors.dart';
import '../Header.dart';
import 'my_files.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: ConstColors.skyWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(title: "Dashboard",),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyFiles(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
