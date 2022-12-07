import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trillest_admin/Screens/Support/chat.dart';
import 'package:trillest_admin/constants/Const_Colors.dart';
import 'package:velocity_x/velocity_x.dart';

class Support extends StatelessWidget {
  Support({super.key});
  DatabaseReference _messagesRef =
      FirebaseDatabase.instance.reference().child('drivers');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.primaryColor,
        title: "Driver Support requests".text.make(),
      ),
      body: Column(
        children: [
          FirebaseAnimatedList(
              shrinkWrap: true,
              query: _messagesRef,
              itemBuilder: (context, snapshot, animation, index) {
                final json = snapshot.value as Map<dynamic, dynamic>;
                print(json);
                return json["messages"] == null
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          Get.to(() => chatpage(data: json));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Text("${json["name"]}"),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${json["email"]}"),
                                  Text("Phone: ${json["phone"]}"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
              }),
        ],
      ),
    );
  }
}
