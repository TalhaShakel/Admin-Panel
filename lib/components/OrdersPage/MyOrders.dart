import 'package:flutter/material.dart';

import '../../constants/Const_Colors.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

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
                  "My Orders",
                  style: TextStyle(
                      color: ConstColors.primaryColor,
                      fontWeight: FontWeight.bold,fontSize: 20
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
