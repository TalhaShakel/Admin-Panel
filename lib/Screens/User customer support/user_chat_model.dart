// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trillest_admin/Screens/User%20customer%20support/User_support.dart';
import 'package:velocity_x/velocity_x.dart';

class User_Support extends StatelessWidget {
  User_Support({super.key});
  DatabaseReference _messagesRef =
      FirebaseDatabase.instance.reference().child('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "User Support requests".text.make(),
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
                          Get.to(() => Support_page(data: json));
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

// class MessageDao {
//   final DatabaseReference _messagesRef = FirebaseDatabase.instance
//       .reference()
//       .child('users/${userModelCurrentInfo!.id}/messages');
//   void saveMessage(Message message) {
//     _messagesRef.push().set(message.toJson());
//   }

//   Query getMessageQuery() {
//     return _messagesRef;
//   }
// }

// class Message {
//   final String text;
//   final DateTime date;
//   final String sender;

//   Message(this.text, this.date, this.sender);

//   Message.fromJson(Map<dynamic, dynamic> json)
//       : date = DateTime.parse(json['date'] as String),
//         sender = json["sender"] as String,
//         text = json['text'] as String;

//   Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
//         'date': date.toString(),
//         'text': text,
//         "sender": sender.toString(),
//       };
// }

