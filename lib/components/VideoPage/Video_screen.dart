import 'package:flutter/material.dart';

import '../../constants/Const_Colors.dart';
import '../DashboardPage/user_info.dart';
import '../Header.dart';
import 'My_videos.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: ConstColors.skyWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(title: "User Management",),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyVideos(),
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
