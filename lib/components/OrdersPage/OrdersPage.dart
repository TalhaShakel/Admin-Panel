import 'package:flutter/material.dart';

import '../../constants/Const_Colors.dart';
import '../Header.dart';
import 'MyOrders.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: ConstColors.skyWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(title: "Driver Management",),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyOrders(),
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
