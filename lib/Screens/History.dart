import 'package:flutter/material.dart';
import 'package:trillest_admin/constants/Const_Colors.dart';
import 'package:velocity_x/velocity_x.dart';

class History extends StatelessWidget {
  Map<String, dynamic> history;
  History({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.primaryColor,
        title: "All Ride History".text.make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Card(
            //   child: Text("$history"),
            // ),
            ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  String key = history.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "car_details:   ${history[key]["car_details"]}"
                                .text
                                .uppercase
                                .make(),
                            "destinationAddress:    ${history[key]["destinationAddress"]}"
                                .text
                                .uppercase
                                .make(),
                            "driverName:    ${history[key]["driverName"]}"
                                .text
                                .uppercase
                                .make(),
                            "driverPhone:   ${history[key]["driverPhone"]}"
                                .text
                                .uppercase
                                .make(),
                            "fareAmount:    ${history[key]["fareAmount"]}"
                                .text
                                .uppercase
                                .make(),
                            "OriginAddress:   ${history[key]["originAddress"]}"
                                .text
                                .uppercase
                                .make(),
                            "status:    ${history[key]["status"]}"
                                .text
                                .uppercase
                                .make(),
                            "time:    ${history[key]["time"]}"
                                .text
                                .uppercase
                                .make(),
                            "userName:    ${history[key]["userName"]}"
                                .text
                                .uppercase
                                .make(),
                            "userPhone:   ${history[key]["userPhone"]}"
                                .text
                                .uppercase
                                .make(),

// status
// :
// "ended"
// time
// :
// "2022-12-07 12:56:58.440879"
// userName
// :
// "user talha"
// userPhone
// :
// "123456"
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
