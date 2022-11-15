import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:trillest_admin/models/model.dart';
import 'package:velocity_x/velocity_x.dart';

// final messageDao = MessageDao();

class Support_page extends StatefulWidget {
  Map data;

  // chatpage({super.key,});
  Support_page({super.key, required this.data});

  @override
  State<Support_page> createState() => _Support_pageState();
}

class _Support_pageState extends State<Support_page> {
  var message = TextEditingController();

  var _scrollController;

  late DatabaseReference _messagesRef = FirebaseDatabase.instance
      .reference()
      .child('users/${widget.data["id"]}/messages');
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

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: "User Support Chat".text.make(),
      ),
      body: Column(
        children: [
          // Text("$data"),
          Expanded(
            child: FirebaseAnimatedList(
              controller: _scrollController,
              query: FirebaseDatabase.instance
                  .reference()
                  .child('users/${widget.data["id"]}/messages'),
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
