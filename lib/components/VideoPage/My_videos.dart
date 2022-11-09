import 'package:flutter/material.dart';

import '../../constants/Const_Colors.dart';
import '../../constants/padding.dart';

class MyVideos extends StatelessWidget {
  const MyVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstColors.skyWhite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "My Videos",
                  style: TextStyle(
                      color: ConstColors.primaryColor,
                      fontWeight: FontWeight.bold,fontSize: 20
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ConstColors.primaryColor,
                    ),
                    child: Center(
                      child: Text("Add Videos",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.w700
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
