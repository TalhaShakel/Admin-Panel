import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:trillest_admin/models/model.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:trillest_admin/Screens/Login_page/Login_screen.dart';
// import 'package:trillest_admin/Screens/Support/support.dart';
// // import 'login.dart';
// import 'package:velocity_x/velocity_x.dart';

// // import 'message.dart';

// final messageDao = MessageDao();
// class MessageDao {
//   final DatabaseReference _messagesRef = FirebaseDatabase.instance
//       .reference()
//       .child('drivers/${onlineDriverData.id}/messages');
//   void saveMessage(Message message) {
//     _messagesRef.push().set(message.toJson());
//   }

// }

class chatpage extends StatefulWidget {
  Map data;

  chatpage({super.key, required this.data});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  var _scrollController;

  var message = TextEditingController();

  _sendMessage() async {
    if (message.text.trim() != "") {
      final messag = await Message(
          message.text, DateTime.now(), "7dqupcq7cSMIKDSfnUgVxOCmAyF3");

      await _messagesRef.push().set(messag.toJson());
      // messageDao.saveMessage(messag);
      message.clear();
      setState(() {});
    }
  }

  Query getMessageQuery() {
    return _messagesRef;
  }

  late DatabaseReference _messagesRef = FirebaseDatabase.instance
      .reference()
      .child('drivers/${widget.data["id"]}/messages');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Support Chat".text.make(),
      ),
      body: Column(
        children: [
          // Text("$data"),
          Expanded(
            child: FirebaseAnimatedList(
              controller: _scrollController,
              query: FirebaseDatabase.instance
                  .reference()
                  .child('drivers/${widget.data["id"]}/messages'),
              itemBuilder: (context, snapshot, animation, index) {
                final json = snapshot.value as Map<dynamic, dynamic>;
                final message = Message.fromJson(json);
                return Row(
                  mainAxisAlignment:
                      (message.sender == "7dqupcq7cSMIKDSfnUgVxOCmAyF3")
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color:
                              (message.sender == "7dqupcq7cSMIKDSfnUgVxOCmAyF3")
                                  ? Colors.grey
                                  : Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          message.text.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: message,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter message"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    try {
                      _sendMessage();
                    } catch (e) {
                      print(e);
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// class chatpage extends StatefulWidget {
//   String email;
//   chatpage({required this.email});
//   @override
//   _chatpageState createState() => _chatpageState(email: email);
// }

// class _chatpageState extends State<chatpage> {
//   String email;

//   var _scrollController;
//   _chatpageState({required this.email});

//   final fs = FirebaseFirestore.instance;
//   final _auth = FirebaseAuth.instance;
//   final TextEditingController message = new TextEditingController();
//   void _sendMessage() {
//     if (message.text.trim() != "") {
//       final messag =
//           Message(message.text, DateTime.now(), "${onlineDriverData.id}");
//       messageDao.saveMessage(messag);
//       message.clear();
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: "Support Chat".text.make(),
//       ),
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: [
//               // This is where the chats will go
              // Expanded(
              //   child: FirebaseAnimatedList(
              //     controller: _scrollController,
              //     query: messageDao.getMessageQuery(),
              //     itemBuilder: (context, snapshot, animation, index) {
              //       final json = snapshot.value as Map<dynamic, dynamic>;
              //       final message = Message.fromJson(json);
              //       return Row(
              //         mainAxisAlignment: (message.sender == onlineDriverData.id)
              //             ? MainAxisAlignment.end
              //             : MainAxisAlignment.start,
              //         children: [
              //           Container(
              //               margin: EdgeInsets.symmetric(
              //                 vertical: 2,
              //               ),
              //               padding: EdgeInsets.symmetric(
              //                 vertical: 10,
              //                 horizontal: 10,
              //               ),
              //               decoration: BoxDecoration(
              //                 color: (message.sender == onlineDriverData.id)
              //                     ? Colors.grey
              //                     : Theme.of(context).colorScheme.secondary,
              //                 borderRadius: BorderRadius.circular(5),
              //               ),
              //               child: Text(
              //                 message.text.toString(),
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                 ),
              //               )),
              //         ],
              //       );
              //     },
              //   ),
              // ),

//               Container(
//                 color: Colors.grey[200],
//                 padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                 child: Row(
//                   children: [
//                     Flexible(
//                       child: TextFormField(
//                         controller: message,
//                         maxLines: null,
//                         decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Enter message"),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         try {
//                           _sendMessage();
//                         } catch (e) {
//                           print(e);
//                         }
//                       },
//                       icon: Icon(
//                         Icons.send,
//                         color: Theme.of(context).colorScheme.secondary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Row send_message() {
//     return Row(
//       children: [
//         Expanded(
//           child: TextFormField(
//             controller: message,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.purple[100],
//               hintText: 'message',
//               enabled: true,
//               contentPadding:
//                   const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: new BorderSide(color: Colors.purple),
//                 borderRadius: new BorderRadius.circular(10),
//               ),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: new BorderSide(color: Colors.purple),
//                 borderRadius: new BorderRadius.circular(10),
//               ),
//             ),
//             validator: (value) {},
//             onSaved: (value) {
//               message.text = value!;
//             },
//           ),
//         ),
//         IconButton(
//           onPressed: () {
//             if (message.text.isNotEmpty) {
//               fs.collection('Messages').doc().set({
//                 'message': message.text.trim(),
//                 'time': DateTime.now(),
//                 'email': email,
//               });

//               message.clear();
//             }
//           },
//           icon: Icon(Icons.send_sharp),
//         ),
//       ],
//     );
//   }
// }

